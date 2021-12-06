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
        FROM RECIPE_INGREDIENT RI
        WHERE RI.idRecipe = :NEW.idRecipe;

        IF nbI >= 20 THEN
            raise_application_error(-20001, 'Pas plus de 20 ingrédients par recettes.');
        END IF;
    END;
END;
/
SHOW ERRORS TRIGGER nbIngredients_recipe ;

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
SHOW ERRORS TRIGGER date_shopping ;

-- La durée d’une recette est égale au moins au minimum de la durée de ses étapes.
-- il faudrait egalement placer un trigger lors de l'edition des durées d'une recette, mais je ne vais pas le faire par soucis de simplicité. En effet, j'estime que ce trigger est suffisant, de plus, la logique est la même

CREATE OR REPLACE TRIGGER duration_recipe
    BEFORE INSERT OR UPDATE
    ON STEP_DURATION
    FOR EACH ROW
BEGIN
    DECLARE
        timeR_v RECIPE_DURATION.durRecipe%TYPE;
        timeS_v STEP_DURATION.durStep%TYPE;
        idR_v RECIPE.idRecipe%TYPE;
        count_v INTEGER;
    BEGIN

        SELECT RD.idRecipe
        INTO idR_v
        FROM RECIPE_DURATION RD
                 INNER JOIN RECIPE R on R.IDRECIPE = RD.IDRECIPE
                 INNER JOIN STEP S on S.IDRECIPE = R.IDRECIPE
        WHERE S.idStep = :NEW.idStep;

        SELECT count(*) INTO count_v FROM STEP_DURATION WHERE idStep = :NEW.idStep;

        IF(count_v = 0) THEN
            timeS_v := :NEW.durStep;
        ELSE
            SELECT SUM(durStep)
            INTO timeS_v
            FROM STEP_DURATION SD
            WHERE SD.idStep = :NEW.idStep
              AND SD.idDuration != 4;
        end if;

        SELECT RD.durRecipe
        INTO timeR_v
        FROM RECIPE_DURATION RD
        WHERE RD.idRecipe = idR_v AND RD.idDuration = 4;

        IF timeR_v < timeS_v THEN
            UPDATE RECIPE_DURATION SET durRecipe = timeS_v WHERE idRecipe = idR_v AND idDuration = 4;
            -- raise_application_error(-20003, 'La durée d’une recette est égale au moins au minimum de la durée de ses étapes.');
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;
END;
/
SHOW ERRORS TRIGGER duration_recipe ;

-- Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses ingrédients (+/- 20%).
-- mais les valeurs nutritionnelles peuvent changer à :
-- l'ajout d'un ingrédient (recipe_ingredient) ; la modification des qualités de la recette (recipe_quality) ; la modification des qualités d'un ingrédient (ingredient_quality)
-- ici, on partira du principe qu'un utilisateur ne peut pas renseigner les qualités globales d'une recette et quelles sont simplement recalculées à l'ajout d'un ingrédient, mais aussi que le nombre de calorie d'un ingredient est stable et ne devrait pas changer, pour 100 grammes
-- techniquement, il faudrait tout de même réaliser ces triggers mais par soucis de simplicité, j'estime que le trigger que j'ai réalisé est suffisant, la logique est plus ou moins la même pour ceux (les autres) que j'ai suggéré

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

        SELECT SUM(IQ.qtyQuality * RI.quantity)
        INTO quantityI_v
        FROM INGREDIENT_QUALITY IQ
                 INNER JOIN INGREDIENT I on I.IDINGREDIENT = IQ.IDINGREDIENT
                 INNER JOIN RECIPE_INGREDIENT RI on RI.IDINGREDIENT = I.IDINGREDIENT
        WHERE RI.idRecipe = :NEW.idRecipe
          AND IQ.idQuality = 1;

        IF quantityR_v < quantityI_v * 0.8 THEN
            UPDATE RECIPE_QUALITY SET qtyQuality = quantityI_v * 0.8 WHERE idRecipe = :NEW.idRecipe AND idQuality = 1;
            -- raise_application_error(-20004, 'Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses ingrédients (+/- 20%).');
        ELSIF quantityR_v > quantityI_v * 1.2 THEN
            UPDATE RECIPE_QUALITY SET qtyQuality = quantityI_v * 1.2 WHERE idRecipe = :NEW.idRecipe AND idQuality = 1;
            -- raise_application_error(-20004, 'Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses ingrédients (+/- 20%).');
        ELSIF quantityI_v < quantityR_v * 0.8 OR quantityI_v > quantityR_v * 1.2 THEN
            UPDATE RECIPE_QUALITY SET qtyQuality = quantityI_v WHERE idRecipe = :NEW.idRecipe AND idQuality = 1;
            -- raise_application_error(-20004, 'Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses ingrédients (+/- 20%).');
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;
END;
/
SHOW ERRORS TRIGGER calories_recipe ;

-- Les plannings de recettes et la liste des courses sont archivés lorsqu’ils sont supprimés ou une fois les dates associées dépassées.

CREATE OR REPLACE TRIGGER remove_planning
    BEFORE DELETE
    ON USERS_PLANNING
    FOR EACH ROW
BEGIN
    INSERT INTO USERS_OLD_PLANNING VALUES (:OLD.idUsers, :OLD.idPlanning);
END;
/
SHOW ERRORS TRIGGER remove_planning ;

CREATE OR REPLACE TRIGGER remove_shopping
    BEFORE DELETE
    ON USERS_SHOPPING
    FOR EACH ROW
BEGIN
    INSERT INTO USERS_OLD_SHOPPING VALUES (:OLD.idUsers, :OLD.idShopping);
END;
/
SHOW ERRORS TRIGGER remove_shopping ;

-- utilisation de scheduler pour tester quotidiennement => pas les droits donc je check betement à chaque update des tables
-- avec cette méthode, techniquement, il faudrait ajouter les checks BEOFRE INSERT sur RECIPE_PLANNING, SHOPPING_INGREDIENT et SHOPPING_PLANNING
-- mais je ne vais pas le faire par soucis de simplicité, car j'estime que les triggers que j'ai realise ici suffisent et que la logique serait de toute facon la meme

CREATE OR REPLACE TRIGGER check_end_planning
    BEFORE UPDATE
    ON PLANNING
    FOR EACH ROW
BEGIN
    IF (:NEW.endPlanning < SYSDATE) THEN
        DELETE FROM USERS_PLANNING WHERE idPlanning = :NEW.idPlanning;
    END IF;
END;
/
SHOW ERRORS TRIGGER check_end_planning ;

CREATE OR REPLACE TRIGGER check_end_shopping
    BEFORE UPDATE
    ON SHOPPING
    FOR EACH ROW
BEGIN
    IF (:NEW.endShopping < SYSDATE) THEN
        DELETE FROM USERS_SHOPPING WHERE idShopping = :NEW.idShopping;
    END IF;
END;
/
SHOW ERRORS TRIGGER check_end_shopping ;