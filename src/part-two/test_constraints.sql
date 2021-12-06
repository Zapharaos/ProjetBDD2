-- Pas plus de 20 ingrédients par recettes.

INSERT INTO recipe VALUES (NULL, 'Test constraint 20 ingredients', 'silverswan131', '', 'Tres facile', 1, 1, 1);

INSERT INTO recipe_ingredient VALUES (5, 1, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 2, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 3, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 4, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 5, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 6, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 7, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 8, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 9, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 10, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 11, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 12, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 13, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 14, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 15, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 16, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 17, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 18, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 19, 100, 1);
INSERT INTO recipe_ingredient VALUES (5, 20, 100, 1);

SELECT count(*) FROM RECIPE_INGREDIENT WHERE idRecipe = 5;
INSERT INTO recipe_ingredient VALUES (5, 21, 100, 1);

-- La liste des ingrédients à acheter ne peut pas être générée plus d’un mois à l’avance.
-- pour simplifier (par rapport aux insert déjà fait), on testera pour 6 mois

INSERT INTO shopping VALUES (NULL, 'Test 6 mois en avance', '', NULL, TO_TIMESTAMP('2022/10/31 19:30:00', 'yyyy/mm/dd hh24:mi:ss'));

-- La durée d’une recette est égale au moins au minimum de la durée de ses étapes.

INSERT INTO recipe_duration VALUES (5, 4, 25);
INSERT INTO step VALUES (NULL, 1, '', 'Test trigger duree de recette', 5);
SELECT durRecipe FROM RECIPE_DURATION WHERE idRecipe = 5 AND idDuration = 4;

INSERT INTO step_duration VALUES (21, 2, 50);

SELECT durRecipe FROM RECIPE_DURATION WHERE idRecipe = 5 AND idDuration = 4;

-- Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses ingrédients (+/- 20%).
-- update value au lieu de raise ?

SELECT SUM(IQ.qtyQuality * RI.quantity)
FROM INGREDIENT_QUALITY IQ
         INNER JOIN INGREDIENT I on I.IDINGREDIENT = IQ.IDINGREDIENT
         INNER JOIN RECIPE_INGREDIENT RI on RI.IDINGREDIENT = I.IDINGREDIENT
WHERE RI.idRecipe = 1
  AND IQ.idQuality = 1;

SELECT qtyQuality
FROM RECIPE_QUALITY
WHERE idRecipe = 1
  AND idQuality = 1;

INSERT INTO recipe_ingredient VALUES (1, 6, 50, 1);

SELECT qtyQuality
FROM RECIPE_QUALITY
WHERE idRecipe = 1
  AND idQuality = 1;

-- Les plannings de recettes et la liste des courses sont archivés lorsqu’ils sont supprimés ou une fois les dates associées dépassées.
-- exception deja supprimé ? + check time
