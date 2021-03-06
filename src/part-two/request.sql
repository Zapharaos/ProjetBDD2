-- Les recettes qui ont moins de 200 calories par personne, dont tous les ingrédients sont sans gluten et qui apparaissent sur le planning d’un utilisateur.
-- ne verifie pas que tous les ingredients sont sans gluten

SELECT R.idRecipe
FROM RECIPE R
INNER JOIN RECIPE_QUALITY RQ on R.IDRECIPE = RQ.IDRECIPE
WHERE
    RQ.IDQUALITY = 1 AND
    RQ.QTYQUALITY / R.NBPERS < 200 AND
    EXISTS(SELECT PLANNING_RECIPE.idRecipe FROM PLANNING_RECIPE WHERE PLANNING_RECIPE.idRecipe = R.idRecipe)
;

-- La recette la plus souvent présente dans des plannings d’utilisateurs.

SELECT idRecipe,
       nbOccurrence
FROM (
         SELECT idRecipe,
                count(*) as nbOccurrence
         FROM PLANNING_RECIPE
         GROUP BY idRecipe
         ORDER BY count(*) DESC
     )
WHERE ROWNUM = 1;

-- Pour chaque ingrédient, nombre de recette et nombre de catégorie dans lesquelles il apparaît.

SELECT
    INGREDIENT.idIngredient,
    COALESCE(nbR.counter, 0) AS nbR,
    COALESCE(nbC.counter, 0) AS nbC
FROM INGREDIENT
LEFT OUTER JOIN (
     SELECT idIngredient, count(*) AS counter
     FROM RECIPE_INGREDIENT
     GROUP BY idIngredient
) nbR ON INGREDIENT.idIngredient = nbR.idIngredient
LEFT OUTER JOIN (
    SELECT idIngredient, count(*) AS counter
    FROM INGREDIENT_CATEGORY
    GROUP BY idIngredient
) nbC ON INGREDIENT.idIngredient = nbC.idIngredient
ORDER BY INGREDIENT.idIngredient ASC;

-- Les utilisateurs qui n’ont ajouté à la base de données que des recettes végétariennes.

/*SELECT DISTINCT U.idUsers
FROM USERS U
WHERE EXISTS (
    SELECT *
    FROM RECIPE R
    INNER JOIN RECIPE_INGREDIENT RI ON RI.idRecipe = R.idRecipe
    INNER JOIN INGREDIENT I ON I.idIngredient = RI.idIngredient
    INNER JOIN INGREDIENT_DIET D ON D.IDINGREDIENT = I.IDINGREDIENT
    WHERE D.IDDIET = 4 AND R.idUsers = U.idUsers
);

SELECT DISTINCT R.idUsers
FROM RECIPE R
    INNER JOIN RECIPE_INGREDIENT RI ON RI.idRecipe = R.idRecipe
    INNER JOIN INGREDIENT I ON I.idIngredient = RI.idIngredient
    INNER JOIN INGREDIENT_DIET D ON D.idIngredient = I.idIngredient
WHERE D.idDiet = 4;*/

/*
SELECT RI.idRecipe, RI.idIngredient
FROM RECIPE_INGREDIENT RI
WHERE NOT (NOT EXISTS (
    SELECT *
    FROM INGREDIENT_DIET ID
    WHERE ID.idIngredient = RI.idIngredient AND ID.idDiet = 3
    ));

SELECT RI.idRecipe, RI.idIngredient
FROM RECIPE_INGREDIENT RI
WHERE RI.idRecipe = 4 AND RI.idIngredient = ALL (NOT (NOT EXISTS (
        SELECT *
        FROM INGREDIENT_DIET ID
        WHERE ID.idIngredient = RI.idIngredient AND ID.idDiet = 3
    ));*/

/*SELECT *
FROM RECIPE_INGREDIENT RI
WHERE RI.idIngredient NOT IN (
    SELECT DISTINCT RI.idIngredient
    FROM RECIPE_INGREDIENT RI
    INNER JOIN INGREDIENT I ON I.idIngredient = RI.idIngredient
    INNER JOIN INGREDIENT_DIET ID ON ID.idIngredient = I.idIngredient
    WHERE ID.idDiet != 2
    );*/

-- Pour chaque utilisateur, son login, son nom, son prénom, son adresse, son nombre de recette créé, son nombre d’ingrédients enregistrés, le nombre de recette qu’il a prévu de réaliser (la recette est dans son planning à une date postérieure à la date d’aujourd’hui).

SELECT
    users.login,
    users.name,
    users.lastName,
    users.address,
    COALESCE(nbRc.counter, 0) AS nbRcreated,
    COALESCE(nbIs.counter, 0) AS nbIstock,
    COALESCE(nbRp.counter, 0) AS nbRplanned
FROM users
LEFT OUTER JOIN (
    SELECT idUsers, count(*) AS counter
    FROM RECIPE
    GROUP BY idUsers
) nbRc ON users.idUsers  = nbRc.idUsers
LEFT OUTER JOIN (
    SELECT idUsers, count(*) AS counter
    FROM STOCK
    WHERE qtyAvailable > 0
    GROUP BY idUsers
) nbIs ON users.idUsers = nbIs.idUsers
LEFT OUTER JOIN (
    SELECT idUsers, count(*) AS counter
    FROM USERS_PLANNING
    INNER JOIN PLANNING P on P.idPlanning = USERS_PLANNING.idPlanning
    INNER JOIN PLANNING_RECIPE PR on PR.idPlanning = P.idPlanning
    WHERE PR.dateMeal > SYSDATE
    GROUP BY idUsers
) nbRp ON users.idUsers = nbRp.idUsers
ORDER BY users.idUsers ASC;
