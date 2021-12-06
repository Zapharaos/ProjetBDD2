SET SERVEROUTPUT ON;

-- Définir une fonction qui change le nom d’un ingrédient par un autre dans les étapes de réalisation d’une recette

CREATE OR REPLACE FUNCTION edit_ingredient(
    idR STEP.idRecipe%TYPE,
    idI1 INGREDIENT.idIngredient%TYPE,
    idI2 INGREDIENT.idIngredient%TYPE
) RETURN STEP.idRecipe%TYPE
    IS
    nameI1_v INGREDIENT.nameIngredient%TYPE;
    nameI2_v INGREDIENT.nameIngredient%TYPE;
BEGIN
    SELECT nameIngredient INTO nameI1_v FROM INGREDIENT WHERE idIngredient = idI1;
    SELECT nameIngredient INTO nameI2_v FROM INGREDIENT WHERE idIngredient = idI2;

    UPDATE STEP
    SET nameStep = REPLACE(nameStep, nameI1_v, nameI2_v),
        descStep = REPLACE(descStep, nameI1_v, nameI2_v)
    WHERE IDRECIPE = idR;

    -- Use Implicit cursor attribute (useless here since "REPLACE" edit every rows)
    RETURN SQL%ROWCOUNT;
END;
/
SHOW ERRORS FUNCTION edit_ingredient ;

/*BEGIN
    dbms_output.put_line(edit_ingredient(1, 1, 2));
END;
/*/

-- Définir une fonction qui retourne la liste des ingrédients où la quantité d’ingrédient a été adaptée pour un nombre de personnes différent du nombre de personnes de la recette d’origine.

CREATE OR REPLACE FUNCTION edit_recipe(
    idR RECIPE.idRecipe%TYPE,
    nbP RECIPE.nbPers%TYPE
) RETURN CLOB
    IS
    nbPers_v RECIPE.nbPers%TYPE;
    liste_v  CLOB;
BEGIN
    DECLARE
        CURSOR ing_c IS
            SELECT I.nameIngredient, RI.quantity, I.unity
            FROM RECIPE_INGREDIENT RI
                     INNER JOIN INGREDIENT I on RI.IDINGREDIENT = I.IDINGREDIENT
            WHERE RI.idRecipe = idR;
    BEGIN
        SELECT nbPers INTO nbPers_v FROM RECIPE WHERE idRecipe = idR;

        if (nbP = nbPers_v) THEN
            liste_v := 'NONE' || CHR(10);
        ELSE
            FOR ing_v IN ing_c
                LOOP
                    liste_v := liste_v || ing_v.nameIngredient || ' : ' || ing_v.quantity / nbPers_v * nbP || ' ' ||
                               ing_v.unity || ', ' || CHR(10);
                END LOOP;
        END IF;

        RETURN liste_v;
    END;
END;
/
SHOW ERRORS FUNCTION edit_recipe ;

/*BEGIN
    dbms_output.put_line(edit_recipe(2, 3));
END;
/*/

-- Définir une fonction qui retourne un booléen si la recette ne contient que des ingrédients valides pour un certain régime (« végétarien », « sans-gluten », …).
-- pas le plus optimisé j'imagine, j'attends une réponse du prof de TP pour trouver un moyen de verifier que chaque ingredient d'une même recette respecte un certain regime

CREATE OR REPLACE FUNCTION check_diet(
    idR RECIPE.idRecipe%TYPE,
    diet DIET.nameDiet%TYPE
) RETURN BOOLEAN
    IS
    result_v    BOOLEAN := TRUE;
    countDiet_v INTEGER;
    countAll_v  INTEGER;
BEGIN
    SELECT count(*)
    INTO countDiet_v
    FROM RECIPE_INGREDIENT RI
             INNER JOIN INGREDIENT I on RI.idIngredient = I.idIngredient
             INNER JOIN INGREDIENT_DIET D on D.idIngredient = I.idIngredient
             INNER JOIN DIET D2 on D2.IDDIET = D.IDDIET
    WHERE RI.idRecipe = idR
      AND D2.nameDiet LIKE diet;

    SELECT count(*)
    INTO countAll_v
    FROM RECIPE_INGREDIENT RI
             INNER JOIN INGREDIENT I on RI.idIngredient = I.idIngredient
             INNER JOIN INGREDIENT_DIET D on D.idIngredient = I.idIngredient
    WHERE RI.idRecipe = idR;

    IF (countAll_v = countDiet_v) THEN
        result_v := TRUE;
    ELSE
        result_v := FALSE;
    END IF;

    RETURN result_v;
END;
/
SHOW ERRORS FUNCTION check_diet ;

/*DECLARE
    dietName_v DIET.nameDiet%TYPE;
    dietID_v   DIET.idDiet%TYPE := 1;
BEGIN
    SELECT nameDiet INTO dietName_v FROM DIET WHERE idDiet = dietID_v;
    IF (check_diet(4, dietName_v)) THEN
        dbms_output.put_line('recette est ' || dietName_v);
    ELSE
        dbms_output.put_line('recette est pas ' || dietName_v);
    END IF;
END;
/*/

-- Définir une fonction qui génère une liste d’ingrédients à acheter. La liste d’ingrédient sera générée pour un utilisateur, à partir d’un planning de recette à réaliser, une liste d’ingrédients disponibles et la date estimée des achats.
-- chaque utilisateur possède une unique liste d'ingrédient disponible, un unique stock, il ne sera logiquement pas renseigné dans les paramètres de cette fonction
-- pour la date des listes de courses je prévoyais de conserver les mêmes dates que pour le planning correspondant, mais je change ici pour respecter la consigne

CREATE OR REPLACE FUNCTION create_shopping(
    idU USERS.idUsers%TYPE,
    idP PLANNING.idPlanning%TYPE,
    dateP SHOPPING.startShopping%TYPE
) RETURN SHOPPING.idShopping%TYPE
    IS
    nameP_v    PLANNING.namePlanning%TYPE;
    descP_v    PLANNING.descPlanning%TYPE;
    startP_v   PLANNING.startPlanning%TYPE;
    endP_v     PLANNING.endPlanning%TYPE;
    idS_v      SHOPPING.idShopping%TYPE;
    quantity_v STOCK.qtyAvailable%TYPE := 0;
    count_v    INTEGER                 := 0;
BEGIN
    DECLARE
        CURSOR ingPR_c IS
            SELECT RI.idIngredient, RI.quantity
            FROM RECIPE_INGREDIENT RI
                     INNER JOIN RECIPE R ON R.IDRECIPE = RI.IDRECIPE
                     INNER JOIN PLANNING_RECIPE PR ON PR.idRecipe = R.idRecipe
            WHERE PR.idPlanning = idP;
    BEGIN
        SELECT namePlanning, descPlanning, startPlanning, endPlanning
        INTO nameP_v, descP_v, startP_v, endP_v
        FROM PLANNING
        WHERE idPlanning = idP;

        INSERT INTO SHOPPING VALUES (NULL, nameP_v, descP_v, dateP, endP_v) RETURNING idShopping INTO idS_v;
        INSERT INTO SHOPPING_PLANNING VALUES (idS_v, idP);
        INSERT INTO USERS_SHOPPING VALUES (idU, idS_v);

        SELECT count(*) INTO count_v FROM USERS_PLANNING WHERE idUsers = idU AND idPlanning = idP;
        IF (count_v = 0) THEN
            INSERT INTO USERS_PLANNING VALUES (idU, idP);
        ELSE
            count_v := 0;
        END IF;

        FOR ingPR_v IN ingPR_c
            LOOP

                SELECT count(*)
                INTO count_v
                FROM STOCK S
                WHERE S.idIngredient = ingPR_v.idIngredient
                  AND S.idUsers = idU
                  AND S.qtyAvailable > 0;

                IF (quantity_v > 0 AND ingPR_v.quantity > 0 AND count_v != 0) THEN
                    SELECT S.qtyAvailable
                    INTO quantity_v
                    FROM STOCK S
                    WHERE S.idIngredient = ingPR_v.idIngredient
                      AND S.idUsers = idU
                      AND S.qtyAvailable > 0;

                    ingPR_v.quantity := quantity_v - ingPR_v.quantity;
                    quantity_v := 0;
                    count_v := 0;
                END IF;

                IF (ingPR_v.quantity > 0) THEN
                    INSERT INTO SHOPPING_INGREDIENT VALUES (idS_v, ingPR_v.idIngredient, ingPR_v.quantity);
                END IF;
            END LOOP;

        RETURN idS_v;
    END;
END;
/
SHOW ERRORS FUNCTION create_shopping ;

/*
BEGIN
    dbms_output.put_line(create_shopping(4, 2, SYSDATE));
END;
/*/

-- Définir une procédure qui crée une copie de recette où certains ingrédients ont été remplacés par d’autres équivalents et où le nombre de personnes peut-être différent de celui de la recette originale.

CREATE OR REPLACE PROCEDURE copy_recipe(
    idR RECIPE.idRecipe%TYPE,
    nbP RECIPE.nbPers%TYPE,
    idI INGREDIENT.idIngredient%TYPE
) IS
    recipe_v RECIPE%rowtype;
    idR_v RECIPE.idRecipe%TYPE;
BEGIN
    DECLARE
        CURSOR step_c IS
            SELECT idStep, weigth, nameStep, descStep
            FROM STEP
            WHERE idRecipe = idR;
        CURSOR media_c IS
            SELECT nameMedia, descMedia, media
            FROM MEDIA
            WHERE idRecipe = idR;
        CURSOR durR_c IS
            SELECT idDuration, durRecipe
            FROM RECIPE_DURATION
            WHERE idRecipe = idR;
        CURSOR durS_c IS
            SELECT idDuration, durStep
            FROM STEP_DURATION
            INNER JOIN STEP S on S.IDSTEP = STEP_DURATION.IDSTEP
            WHERE S.idRecipe = idR;
    BEGIN

    SELECT * INTO recipe_v FROM RECIPE WHERE idRecipe = idR;
    INSERT INTO RECIPE VALUES (NULL, recipe_v.nameRecipe, recipe_v.author, recipe_v.descRecipe, recipe_v.difficulty, recipe_v.price, nbP, recipe_v.idUsers) RETURNING idRecipe INTO idR_v;

    -- ingredient recette (x nbPers !!!)
    -- qualite recette

    -- media
    FOR media_c IN media_c
        LOOP
            INSERT INTO MEDIA VALUES (NULL, media_c.nameMedia, media_c.descMedia, media_c.media, idR_v);
        END LOOP;

    -- recipe duration
    FOR durR_v IN durR_c
        LOOP
            INSERT INTO RECIPE_DURATION VALUES (idR_v, durR_v.idDuration, durR_v.durRecipe);
        END LOOP;

    -- step & step duration ???
    FOR step_v IN step_c
        LOOP
            INSERT INTO STEP VALUES (NULL, step_v.weigth, step_v.nameStep, step_v.descStep, idR_v);
        END LOOP;

    -- for each : edit_ingredient(idR_v, idI1, idI2);

    END;
END;
/
SHOW ERRORS PROCEDURE copy_recipe ;
