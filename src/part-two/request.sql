-- recipe with less than 200 calories per person, where all the ingredients are gluten free and the recipe is stored in a planning
-- Les recettes qui ont moins de 200 calories par personne, dont tous les ingrédients sont sans gluten et qui apparaissent sur le planning d’un utilisateur.

-- the most stored recipe in the plannings
-- La recette la plus souvent présente dans des plannings d’utilisateurs.

-- for each ingredient, the number of recipes where he is used and its number of categories
-- Pour chaque ingrédient, nombre de recette et nombre de catégorie dans lesquelles il apparaît.

SELECT
    idIngredient,
    COUNT ( SELECT idIngredient
            FROM recipe_ingredient
            WHERE recipe_ingredient.idIngredient = idIngredient)
        AS nbRecipes,
    COUNT ( SELECT idIngredient
            FROM ingredient_diet
            WHERE ingredient_diet.idIngredient = idIngredient)
        AS nbDiets
FROM ingredient;


-- users that only created vegie recipes
-- Les utilisateurs qui n’ont ajouté à la base de données que des recettes végétariennes.

SELECT idUsers
FROM recipe
WHERE idRecipe IN (
    SELECT recipe_ingredient.idRecipe FROM recipe_ingredient WHERE recipe_ingredient.idRecipe = idRecipe
    AND recipe_ingredient.idIngredient IN (
        SELECT ingredient.idIngredient FROM ingredient WHERE ingredient.idIngredient = recipe_ingredient.idIngredient
        AND ingredient.idIngredient IN (
            SELECT ingredient_diet.idIngredient FROM ingredient_diet WHERE ingredient_diet.idIngredient = ingredient.idIngredient
            AND ingredient_diet.idDiet IN (
                SELECT diet.idDiet FROM diet WHERE diet.idDiet = ingredient_diet.idDiet and diet.name LIKE 'Sans gluten'
            )
        )))

-- for each user, its login - name - lastName - address - number of recipes created - number of ingredients he possess - number of recipes planned (recipe is in the future !!!)
-- Pour chaque utilisateur, son login, son nom, son prénom, son adresse, son nombre de recette créé, son nombre d’ingrédients enregistrés, le nombre de recette qu’il a prévu de réaliser (la recette est dans son planning à une date postérieure à la date d’aujourd’hui).

SELECT
    login,
    name,
    lastName,
    address,
    COUNT ( SELECT idRecipe
            FROM recipe
            WHERE recipe.idUsers = users.idUsers)
        AS nbRecipesCreated,
    COUNT ( SELECT idIngredient
            FROM stock
            WHERE stock.idUsers = users.idUsers)
        AS nbIngredientsStock,
    COUNT ( SELECT idRecipe
            FROM planning_recipe
            WHERE dateMeal > SYSDATE AND idPlanning IN (
                (SELECT idPlanning FROM users_planning WHERE users_planning.idUsers = idUsers)))
        AS nbRecipesPlanned
FROM users;