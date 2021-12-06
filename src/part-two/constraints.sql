-- Pas plus de 20 ingrédients par recettes.

CREATE OR REPLACE TRIGGER nbIngredients_recipe
    BEFORE INSERT
    ON RECIPE_INGREDIENT
    FOR EACH ROW
BEGIN
    DECLARE
        nbI INTEGER;
    BEGIN
        SELECT count(*)
        INTO nbI
        FROM RECIPE_INGREDIENT
        WHERE idRecipe = :NEW.idRecipe;
        IF nbI >= 20 THEN
            raise_application_error(-20001, 'Pas plus de 20 ingrédients par recettes.');
        END IF;
    END;
END;
/

-- La liste des ingrédients à acheter ne peut pas être générée plus d’un mois à l’avance.
-- pour simplifier (par rapport aux insert déjà fait), on testera pour 6 mois

CREATE OR REPLACE TRIGGER date_shopping
    BEFORE INSERT OR UPDATE
    ON SHOPPING
    FOR EACH ROW
BEGIN
    IF :NEW.ENDSHOPPING > ADD_MONTHS(SYSDATE, 6) THEN
        raise_application_error(-20002,
                                'La liste des ingrédients à acheter ne peut pas être générée plus d’un mois à l’avance.');
    END IF;
END;
/

-- La durée d’une recette est égale au moins au minimum de la durée de ses étapes.
-- update value au lieu de raise ?

CREATE OR REPLACE TRIGGER duration_recipe
    BEFORE INSERT OR UPDATE
    ON STEP
    FOR EACH ROW
BEGIN
    DECLARE
        timeR_v RECIPE_DURATION.durRecipe%TYPE;
        timeS_v STEP_DURATION.durStep%TYPE;
    BEGIN

        SELECT durRecipe
        INTO timeR_v
        FROM RECIPE_DURATION
        WHERE idRecipe = :NEW.idRecipe
          AND idDuration = 4;

        SELECT SUM(durStep)
        INTO timeS_v
        FROM STEP_DURATION
        WHERE idRecipe = :NEW.idRecipe
          AND idDuration != 4;

        IF timeR_v < timeS_v THEN
            raise_application_error(-20003,
                                    'La durée d’une recette est égale au moins au minimum de la durée de ses étapes.');
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;
END;
/

-- Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses ingrédients (+/- 20%).
-- update value au lieu de raise ?

CREATE OR REPLACE TRIGGER calories_recipe
    BEFORE INSERT OR UPDATE
    ON RECIPE_INGREDIENT
    FOR EACH ROW
BEGIN
    DECLARE
        quantityR_v RECIPE_QUALITY.qtyQuality%TYPE;
        quantityI_v INGREDIENT_QUALITY.qtyQuality%TYPE;
    BEGIN

        SELECT qtyQuality
        INTO quantityR_v
        FROM RECIPE_QUALITY
        WHERE idRecipe = :NEW.idRecipe
          AND idQuality = 1;

        SELECT SUM(qtyQuality)
        INTO quantityI_v
        FROM INGREDIENT_QUALITY IQ
                 INNER JOIN INGREDIENT I on IQ.IDINGREDIENT = I.IDINGREDIENT
                 INNER JOIN RECIPE_INGREDIENT RI on RI.IDINGREDIENT = I.IDINGREDIENT
        WHERE idRecipe = :NEW.idRecipe
          AND idQuality = 1;

        IF quantityR_v < quantityI_v * 0.8 OR quantityR_v > quantityI_v * 1.2 OR quantityI_v < quantityR_v * 0.8 OR
           quantityI_v > quantityR_v * 1.2 THEN
            raise_application_error(-20004,
                                    'Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses ingrédients (+/- 20%).');
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;
END;
/

-- Les plannings de recettes et la liste des courses sont archivés lorsqu’ils sont supprimés ou une fois les dates associées dépassées.
-- exception deja supprimé ? + check time

CREATE OR REPLACE TRIGGER remove_planning
    BEFORE DELETE
    ON USERS_PLANNING
    FOR EACH ROW
BEGIN
    DECLARE
        idS SHOPPING.idShopping%TYPE;
    BEGIN

        SELECT SP.idShopping INTO idS
        FROM SHOPPING_PLANNING SP
                 INNER JOIN SHOPPING S on S.IDSHOPPING = SP.IDSHOPPING
                 INNER JOIN USERS_SHOPPING US on US.IDSHOPPING = S.IDSHOPPING
        WHERE SP.idPlanning = idPlanning AND US.idUsers = idUsers;

        INSERT INTO USERS_OLD_PLANNING VALUES (idUsers, idPlanning);
        INSERT INTO USERS_OLD_SHOPPING VALUES (idUsers, idShopping);
    END;
END;
/

CREATE OR REPLACE TRIGGER remove_planning
    BEFORE DELETE
    ON USERS_SHOPPING
    FOR EACH ROW
BEGIN
    DECLARE
        idP PLANNING.idPlanning%TYPE;
    BEGIN

        SELECT SP.idShopping INTO idS
        FROM SHOPPING_PLANNING SP
                 INNER JOIN SHOPPING S on S.IDSHOPPING = SP.IDSHOPPING
                 INNER JOIN USERS_SHOPPING US on US.IDSHOPPING = S.IDSHOPPING
        WHERE SP.idPlanning = idPlanning AND US.idUsers = idUsers;

        INSERT INTO USERS_OLD_SHOPPING VALUES (idUsers, idShopping);
        INSERT INTO USERS_OLD_PLANNING VALUES (idUsers, idPlanning);
    END;
END;
/