-- Test : Modifie le nom et prénom
INSERT INTO users VALUES (0, 'jdoe', 'john@doe.jd', 'password', 'john', 'doe', '');
SELECT name, lastName FROM users WHERE idUsers = 0;

-- Test : Modifie le nom d'une étape si le nom est null ou vide
INSERT INTO recipe VALUES (0, 'recette sql', 'John Doe', '', 'Difficile', 5, 1);
INSERT INTO step VALUES (0, 5, '', '', 0);
SELECT nameStep FROM step WHERE idStep = 0;

-- Test : Refus d'une date de repas trop ancienne
INSERT INTO planning VALUES (0, 'planning', '');
INSERT INTO planning_recipe VALUES (0, 0, CURRENT_TIMESTAMP-10, 1);