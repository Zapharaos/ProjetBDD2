-- Les recettes qui ont moins de 200 calories par personne, dont tous les ingrédients sont sans gluten et qui apparaissent sur le planning d’un utilisateur.

SELECT R.idRecipe
FROM RECIPE R
INNER JOIN RECIPE_QUALITY RQ on R.IDRECIPE = RQ.IDRECIPE
INNER JOIN RECIPE_INGREDIENT RI ON RI.idRecipe = R.idRecipe
INNER JOIN INGREDIENT I ON I.idIngredient = RI.idIngredient
INNER JOIN INGREDIENT_DIET D ON D.idIngredient = I.idIngredient
INNER JOIN DIET D2 ON D2.idDiet = D.idDiet
WHERE
    RQ.IDQUALITY = 1 AND
    RQ.QTYQUALITY / R.NBPERS < 200 AND
    D2.idDiet = 4 AND
    EXISTS(SELECT PLANNING_RECIPE.idRecipe FROM PLANNING_RECIPE WHERE PLANNING_RECIPE.idRecipe = R.idRecipe)
;

-- La recette la plus souvent présente dans des plannings d’utilisateurs.
-- ne prend pas en compte la possibilite d avoir plusieurs recettes avec le meme nombre d occurrence

SELECT
       idRecipe,
       nbOccurrence
FROM
     (
         SELECT
             idRecipe,
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
    FROM INGREDIENT_DIET
    GROUP BY idIngredient
) nbC ON INGREDIENT.idIngredient = nbC.idIngredient
ORDER BY INGREDIENT.idIngredient ASC;

-- Les utilisateurs qui n’ont ajouté à la base de données que des recettes végétariennes.

SELECT idUsers
FROM RECIPE R
INNER JOIN RECIPE_INGREDIENT RI ON RI.idRecipe = R.idRecipe
INNER JOIN INGREDIENT I ON I.idIngredient = RI.idIngredient
INNER JOIN INGREDIENT_DIET D ON D.idIngredient = I.idIngredient
WHERE D.idDiet = 1;

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
