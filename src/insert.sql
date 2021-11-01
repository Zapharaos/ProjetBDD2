-- USERS (idUsers, login, email, pwd, name, lastName, address)

INSERT INTO users VALUES (NULL, 'silverswan131', 'brad.gibson@example.com', '0cbbe25ca54ceb42e0899422bdf417dadc6865c19b32981af430325ba416351f', 'brad', 'gibson', '9278 new road, kilcoole, waterford, 93027');
INSERT INTO users VALUES (NULL, 'icecreamketchupbagel', 'john.johnston@example.com', '1becaaef8bdc5da2910202603669a731970f736042366cd74d9938557debeb43', 'john', 'johnston', '3686 Shady Ln Dr');
INSERT INTO users VALUES (NULL, 'beforesunset', 'leta.barrett@example.com', '6eb161adfa62b9d2d02f0d4acdd2f26daa989026088725c1ba27016c56788b11', 'leta', 'barrett', '6547 Thornridge Cir');

-- INGREDIENT (idIngredient, nameIngredient, unity)

    -- pour idRecipe 1
INSERT INTO ingredient VALUES (NULL, 'Miel', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Vinaigre balsamique', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Camembert', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Pain de campagne', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Mâche', 'grammes');

    -- pour idRecipe 2
INSERT INTO ingredient VALUES (NULL, 'Farine', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Sucre en poudre', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Levure chimique', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Sucre vanillé', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Anis vert', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Muscade râpée', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Cannelle en poudre', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Gingembre en poudre', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Quatre-épices', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Lait de vache', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Oeuf de poule', 'oeuf(s) de poule');

    -- pour idRecipe 3
INSERT INTO ingredient VALUES (NULL, 'Sel', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Poivre', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Beurre', 'grammes');

    -- autres, pour accompagner les catégories
INSERT INTO ingredient VALUES (NULL, 'Miel de sapin', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Miel de lavande', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Vinaigre de riz', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Vinaigre de cidre', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Brie', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Munster', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Baguette', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Pain complet', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Pain au levain', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Laitue', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Farine T55', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Farine T80', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Gros sel', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Sel fin', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Fleur de sel', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Beurre cru', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Beurre doux', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Beurre salé', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Beurre allégé', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Sucre glace', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Sucre brun', 'grammes');
INSERT INTO ingredient VALUES (NULL, 'Oeuf d oie', 'oeuf(s) d oie');
INSERT INTO ingredient VALUES (NULL, 'Oeuf d autruche', 'oeuf(s) d autruche');
INSERT INTO ingredient VALUES (NULL, 'Lait de chamelle', 'grammes');

-- STOCK (idUsers, idIngredient, qtyAvailable)
-- nombre d'ingrédients par users random, ingrédient random, quantité random

    -- pour idUsers 1
INSERT INTO stock VALUES (1, 20, 664);
INSERT INTO stock VALUES (1, 33, 47);
INSERT INTO stock VALUES (1, 15, 875);
INSERT INTO stock VALUES (1, 3, 477);
INSERT INTO stock VALUES (1, 6, 499);
INSERT INTO stock VALUES (1, 19, 582);
INSERT INTO stock VALUES (1, 24, 411);
INSERT INTO stock VALUES (1, 7, 124);
INSERT INTO stock VALUES (1, 34, 991);
INSERT INTO stock VALUES (1, 8, 659);
INSERT INTO stock VALUES (1, 10, 775);
INSERT INTO stock VALUES (1, 35, 671);
INSERT INTO stock VALUES (1, 37, 621);
INSERT INTO stock VALUES (1, 5, 284);
INSERT INTO stock VALUES (1, 4, 149);
INSERT INTO stock VALUES (1, 23, 721);
INSERT INTO stock VALUES (1, 42, 919);

    -- pour idUsers 2
INSERT INTO stock VALUES (2, 23, 707);
INSERT INTO stock VALUES (2, 30, 807);
INSERT INTO stock VALUES (2, 14, 879);
INSERT INTO stock VALUES (2, 31, 758);
INSERT INTO stock VALUES (2, 15, 236);
INSERT INTO stock VALUES (2, 35, 847);
INSERT INTO stock VALUES (2, 28, 955);
INSERT INTO stock VALUES (2, 5, 694);
INSERT INTO stock VALUES (2, 2, 294);
INSERT INTO stock VALUES (2, 3, 685);
INSERT INTO stock VALUES (2, 1, 985);
INSERT INTO stock VALUES (2, 39, 849);
INSERT INTO stock VALUES (2, 4, 136);
INSERT INTO stock VALUES (2, 40, 288);
INSERT INTO stock VALUES (2, 22, 69);

    -- pour idUsers 3
INSERT INTO stock VALUES (3, 11, 738);
INSERT INTO stock VALUES (3, 32, 124);
INSERT INTO stock VALUES (3, 4, 687);
INSERT INTO stock VALUES (3, 25, 437);
INSERT INTO stock VALUES (3, 7, 702);
INSERT INTO stock VALUES (3, 33, 222);
INSERT INTO stock VALUES (3, 6, 245);
INSERT INTO stock VALUES (3, 10, 179);
INSERT INTO stock VALUES (3, 2, 469);
INSERT INTO stock VALUES (3, 34, 545);
INSERT INTO stock VALUES (3, 13, 474);
INSERT INTO stock VALUES (3, 20, 25);
INSERT INTO stock VALUES (3, 28, 808);
INSERT INTO stock VALUES (3, 35, 515);
INSERT INTO stock VALUES (3, 14, 308);
INSERT INTO stock VALUES (3, 31, 137);
INSERT INTO stock VALUES (3, 39, 354);
INSERT INTO stock VALUES (3, 19, 945);
INSERT INTO stock VALUES (3, 29, 525);
INSERT INTO stock VALUES (3, 17, 793);

-- RECIPE (idRecipe, nameRecipe, author, descRecipe, difficulty, price, nbPers)
-- voir bibliographie du rapport pour les références

INSERT INTO recipe VALUES (NULL, 'Camembert rôti au miel', 'silverswan131', '', 'Facile', 1, 2);
INSERT INTO recipe VALUES (NULL, 'Pain d épices', 'silverswan131', '', 'Facile', 2.5, 6);
INSERT INTO recipe VALUES (NULL, 'Béchamel rapide et facile', 'beforesunset', '', 'Tres facile', 1, 4);

-- USERS RECIPE (idUsers, idRecipe)

INSERT INTO users_recipe VALUES (1, 1);
INSERT INTO users_recipe VALUES (1, 2);
INSERT INTO users_recipe VALUES (3, 3);

-- MEDIA RECIPE (idMedia, nameMedia, descMedia, media, idRecipe)
-- uniquement des images dans cet exemple

INSERT INTO media VALUES (NULL, 'Pain d épices', 'Photo de pain d épices', 'https://assets.afcdn.com/recipe/20181219/84929_origin.jpg', 2);
INSERT INTO media VALUES (NULL, 'Guide : Pain d épices', 'Comment faire un pain d epices en vidéo', 'https://assets.afcdn.com/video13/20140808/v502871_6587_55_HD.mp4', 2);
INSERT INTO media VALUES (NULL, 'Béchamel', '', 'https://assets.afcdn.com/recipe/20180628/80001_origin.jpg', 3);

-- CATEGORY (idCategory, nameCategory)
-- en rapport avec les ingrédients plus haut

INSERT INTO category VALUES (NULL, 'Miel');
INSERT INTO category VALUES (NULL, 'Vinaigre');
INSERT INTO category VALUES (NULL, 'Fromage');
INSERT INTO category VALUES (NULL, 'Fromage pâte molle');
INSERT INTO category VALUES (NULL, 'Fromage crôute fleurie');
INSERT INTO category VALUES (NULL, 'Fromage crôute lavée');
INSERT INTO category VALUES (NULL, 'Pain');
INSERT INTO category VALUES (NULL, 'Pain petit-déjeuner');
INSERT INTO category VALUES (NULL, 'Pain repas');
INSERT INTO category VALUES (NULL, 'Salade verte');
INSERT INTO category VALUES (NULL, 'Sel');
INSERT INTO category VALUES (NULL, 'Epices');
INSERT INTO category VALUES (NULL, 'Produit laitier');
INSERT INTO category VALUES (NULL, 'Beurre');
INSERT INTO category VALUES (NULL, 'Farine');
INSERT INTO category VALUES (NULL, 'Sucre');
INSERT INTO category VALUES (NULL, 'Levure');
INSERT INTO category VALUES (NULL, 'Oeuf');
INSERT INTO category VALUES (NULL, 'Lait');
INSERT INTO category VALUES (NULL, 'Fromage crôute fleurie et crôute lavée');

-- INGREDIENT CATEGORY (idIngredient, idCategory)

    -- pour les ingrédients de idRecipe 1
INSERT INTO ingredient_category VALUES (1, 1);
INSERT INTO ingredient_category VALUES (2, 2);
INSERT INTO ingredient_category VALUES (3, 3);
INSERT INTO ingredient_category VALUES (3, 4);
INSERT INTO ingredient_category VALUES (3, 5);
INSERT INTO ingredient_category VALUES (3, 20);
INSERT INTO ingredient_category VALUES (4, 7);
INSERT INTO ingredient_category VALUES (4, 8);
INSERT INTO ingredient_category VALUES (4, 9);
INSERT INTO ingredient_category VALUES (5, 10);

    -- pour les ingrédients de idRecipe 2
INSERT INTO ingredient_category VALUES (6, 15);
INSERT INTO ingredient_category VALUES (7, 16);
INSERT INTO ingredient_category VALUES (8, 17);
INSERT INTO ingredient_category VALUES (9, 16);
INSERT INTO ingredient_category VALUES (10, 12);
INSERT INTO ingredient_category VALUES (11, 12);
INSERT INTO ingredient_category VALUES (12, 12);
INSERT INTO ingredient_category VALUES (13, 12);
INSERT INTO ingredient_category VALUES (14, 12);
INSERT INTO ingredient_category VALUES (15, 19);
INSERT INTO ingredient_category VALUES (15, 13);
INSERT INTO ingredient_category VALUES (16, 18);

    -- pour les ingrédients de idRecipe 3
INSERT INTO ingredient_category VALUES (17, 11);
INSERT INTO ingredient_category VALUES (17, 12);
INSERT INTO ingredient_category VALUES (18, 12);
INSERT INTO ingredient_category VALUES (19, 14);
INSERT INTO ingredient_category VALUES (19, 13);

    -- pour les ingrédients de others
INSERT INTO ingredient_category VALUES (20, 1);
INSERT INTO ingredient_category VALUES (21, 1);
INSERT INTO ingredient_category VALUES (22, 2);
INSERT INTO ingredient_category VALUES (23, 2);
INSERT INTO ingredient_category VALUES (24, 3);
INSERT INTO ingredient_category VALUES (24, 4);
INSERT INTO ingredient_category VALUES (24, 5);
INSERT INTO ingredient_category VALUES (24, 20);
INSERT INTO ingredient_category VALUES (25, 3);
INSERT INTO ingredient_category VALUES (25, 4);
INSERT INTO ingredient_category VALUES (25, 6);
INSERT INTO ingredient_category VALUES (26, 7);
INSERT INTO ingredient_category VALUES (26, 8);
INSERT INTO ingredient_category VALUES (26, 9);
INSERT INTO ingredient_category VALUES (27, 7);
INSERT INTO ingredient_category VALUES (27, 8);
INSERT INTO ingredient_category VALUES (27, 9);
INSERT INTO ingredient_category VALUES (28, 7);
INSERT INTO ingredient_category VALUES (28, 8);
INSERT INTO ingredient_category VALUES (28, 9);
INSERT INTO ingredient_category VALUES (29, 10);
INSERT INTO ingredient_category VALUES (30, 15);
INSERT INTO ingredient_category VALUES (31, 15);
INSERT INTO ingredient_category VALUES (32, 11);
INSERT INTO ingredient_category VALUES (33, 11);
INSERT INTO ingredient_category VALUES (34, 11);
INSERT INTO ingredient_category VALUES (32, 12);
INSERT INTO ingredient_category VALUES (33, 12);
INSERT INTO ingredient_category VALUES (34, 12);
INSERT INTO ingredient_category VALUES (35, 14);
INSERT INTO ingredient_category VALUES (36, 14);
INSERT INTO ingredient_category VALUES (37, 14);
INSERT INTO ingredient_category VALUES (38, 14);
INSERT INTO ingredient_category VALUES (35, 13);
INSERT INTO ingredient_category VALUES (36, 13);
INSERT INTO ingredient_category VALUES (37, 13);
INSERT INTO ingredient_category VALUES (38, 13);
INSERT INTO ingredient_category VALUES (39, 16);
INSERT INTO ingredient_category VALUES (40, 16);
INSERT INTO ingredient_category VALUES (41, 18);
INSERT INTO ingredient_category VALUES (42, 18);
INSERT INTO ingredient_category VALUES (43, 19);

-- RECIPE INGREDIENT (idRecipe, idIngredient, quantity, idCategory)

    -- pour idRecipe 1
INSERT INTO recipe_ingredient VALUES (1, 1, 45/1000, 1);
INSERT INTO recipe_ingredient VALUES (1, 2, 30/1000, 2); 
INSERT INTO recipe_ingredient VALUES (1, 3, 300, 20);
INSERT INTO recipe_ingredient VALUES (1, 4, 1000, 7);
INSERT INTO recipe_ingredient VALUES (1, 5, 60, 10);
-- la quantité du dernier inséré correspond à une poignée

    -- pour idRecipe 2
INSERT INTO recipe_ingredient VALUES (2, 1, 250, 1);
INSERT INTO recipe_ingredient VALUES (2, 6, 250, 15);
INSERT INTO recipe_ingredient VALUES (2, 7, 100, 16);
INSERT INTO recipe_ingredient VALUES (2, 8, 12, 17);
-- la quantité du dernier inséré correspond à un sachet
INSERT INTO recipe_ingredient VALUES (2, 9, 12, 16);
-- la quantité du dernier inséré correspond à un sachet
INSERT INTO recipe_ingredient VALUES (2, 10, 5, 12);
INSERT INTO recipe_ingredient VALUES (2, 11, 5, 12);
INSERT INTO recipe_ingredient VALUES (2, 12, 5, 12);
INSERT INTO recipe_ingredient VALUES (2, 13, 5, 12);
INSERT INTO recipe_ingredient VALUES (2, 14, 5, 12);
INSERT INTO recipe_ingredient VALUES (2, 15, 10/100, 19);
INSERT INTO recipe_ingredient VALUES (2, 16, 2, 18);

    -- pour idRecipe 3
INSERT INTO recipe_ingredient VALUES (3, 15, 25/100, 19);
INSERT INTO recipe_ingredient VALUES (3, 6,  10, 15);
INSERT INTO recipe_ingredient VALUES (3, 17, 0.5, 11);
-- la quantité du dernier inséré correspond à une pincée
INSERT INTO recipe_ingredient VALUES (3, 18, 0.5, 12);
-- la quantité du dernier inséré correspond à une pincée
INSERT INTO recipe_ingredient VALUES (3, 19, 20, 14);

-- STEP RECIPE (idRecipe, weigth, nameStep, descStep, idRecipe)

    -- pour idRecipe 1
INSERT INTO step VALUES (NULL, 1, '', 'Préchauffer le four à 200°C (thermostat 6-7) pendant 10 min', 1);
INSERT INTO step VALUES (NULL, 2, '', 'Mettre les camemberts au four sur du papier sulfurisé pendant environ 10 min en vérifiant très souvent que les camemberts n éclatent pas, ils doivent gonfler...', 1);
INSERT INTO step VALUES (NULL, 3, '', 'En attendant, préparer le miel en le réchauffant très légèrement à la casserole sans le faire bouillir.', 1);
INSERT INTO step VALUES (NULL, 4, '', 'Faire griller les tartines de pain au grille-pain, disposer la mâche sur toute la surface des assietes, arroser d un filet de vinaigre balsalmique puis disposer les tartines de pain sur la salade.', 1);
INSERT INTO step VALUES (NULL, 5, '', 'Lorsque les camemberts sont bien gonflés, les sortir très delicatements du four et les mettre sur les tartines de pain.', 1);
INSERT INTO step VALUES (NULL, 6, '', 'Mettre une petite poignée de baies de genievre sur les camemberts, arroser généreusement le tout( camambert et salade) de miel chaud et servir aussitôt!', 1);

    -- pour idRecipe 2
INSERT INTO step VALUES (NULL, 1, '1', 'Faites chauffer 250 g de miel à la casserole ou au micro-ondes.', 2);
INSERT INTO step VALUES (NULL, 2, '2', 'Mélangez la farine avec la levure chimique, les deux sucres et les épices.', 2);
INSERT INTO step VALUES (NULL, 3, '3', 'Ajoutez le miel chaud (en remuant idéalement avec une cuillère en bois).', 2);
INSERT INTO step VALUES (NULL, 4, '4', 'Incorporez petit à petit 2 oeufs, puis un peu de lait juste tiède pour amalgamer le tout.', 2);
INSERT INTO step VALUES (NULL, 5, '5', 'Préchauffez le four à 160°C (thermostat 5-6).', 2);
INSERT INTO step VALUES (NULL, 6, '6', 'Versez la préparation dans un moule à cake bien beurré et fariné.', 2);
INSERT INTO step VALUES (NULL, 7, '7', 'Enfournez et laissez cuire pendant 1h à 1h15.', 2);
INSERT INTO step VALUES (NULL, 8, '8', 'Démoulez le pain d épices lorsqu il a totalement refroidi. Attendez 24 heures au minimum avant de le déguster.', 2);
INSERT INTO step VALUES (NULL, 9, '9', 'Il se garde une semaine, enveloppé dans du papier d aluminium.', 2);

    -- pour idRecipe 3 
INSERT INTO step VALUES (NULL, 1, '', 'Dans un grand récipient, faire fondre le beurre 1 minute au micro-ondes. Le sortir et ajouter la farine en remuant bien.', 3);
INSERT INTO step VALUES (NULL, 2, '2', 'Porter le lait à ébullition, le laisser bouillir quelques instants.', 3);
INSERT INTO step VALUES (NULL, 3, '3', 'Verser le lait sur le mélange farine/beurre en fouettant. Assaisonner', 3);
INSERT INTO step VALUES (NULL, 4, '', 'Remettre le tout au micro-ondes pendant 1 minute.', 3);
INSERT INTO step VALUES (NULL, 5, '5', 'Bien fouetter, c est prêt !', 3);

-- DURATION (idDuration, nameDuration)

INSERT INTO duration VALUES (NULL, 'Préparation');
INSERT INTO duration VALUES (NULL, 'Cuisson');
INSERT INTO duration VALUES (NULL, 'Repos');
INSERT INTO duration VALUES (NULL, 'Total');

-- STEP DURATION (idStep, idDuration, durStep)

    -- pour idRecipe 1 
INSERT INTO step_duration VALUES (2, 2, 10);
INSERT INTO step_duration VALUES (3, 1, 5);
INSERT INTO step_duration VALUES (4, 1, 5);
INSERT INTO step_duration VALUES (6, 1, 5);

    -- pour idRecipe 2 
INSERT INTO step_duration VALUES (7, 1, 5);
INSERT INTO step_duration VALUES (8, 1, 5);
INSERT INTO step_duration VALUES (9, 1, 5);
INSERT INTO step_duration VALUES (10, 1, 5);
INSERT INTO step_duration VALUES (12, 1, 5);
INSERT INTO step_duration VALUES (13, 2, 60);
INSERT INTO step_duration VALUES (14, 3, 24*60);

    -- pour idRecipe 3 
INSERT INTO step_duration VALUES (15, 2, 1);
INSERT INTO step_duration VALUES (16, 1, 5);
INSERT INTO step_duration VALUES (19, 2, 1);

-- RECIPE DURATION (idRecipe, idDuration, durRecipe)

    -- pour idRecipe 1
INSERT INTO recipe_duration VALUES (1, 1, 15);
INSERT INTO recipe_duration VALUES (1, 2, 10);
INSERT INTO recipe_duration VALUES (1, 4, 25);

    -- pour idRecipe 2 
INSERT INTO recipe_duration VALUES (2, 1, 30);
INSERT INTO recipe_duration VALUES (2, 2, 60);
INSERT INTO recipe_duration VALUES (2, 4, 90);

    -- pour idRecipe 3 
INSERT INTO recipe_duration VALUES (3, 1, 5);
INSERT INTO recipe_duration VALUES (3, 2, 2);
INSERT INTO recipe_duration VALUES (3, 4, 7);

-- QUALITY (idQuality, nameQuality)

INSERT INTO quality VALUES (NULL, 'calories');
INSERT INTO quality VALUES (NULL, 'protides');
INSERT INTO quality VALUES (NULL, 'glucides');
INSERT INTO quality VALUES (NULL, 'lipides');

-- INGREDIENT QUALITY (idIngredient, idQuality, qtyQuality)

INSERT INTO ingredient_quality VALUES ( 1, 1, 327);
INSERT INTO ingredient_quality VALUES ( 1, 2, 0.395);
INSERT INTO ingredient_quality VALUES ( 1, 3, 81.1);
INSERT INTO ingredient_quality VALUES ( 1, 4, 0.0667);

INSERT INTO ingredient_quality VALUES (2 , 1, 130);
INSERT INTO ingredient_quality VALUES (2 , 2, 0.5);
INSERT INTO ingredient_quality VALUES (2 , 3, 32);
INSERT INTO ingredient_quality VALUES (2 , 4, 0.5);

INSERT INTO ingredient_quality VALUES (3 , 1, 269);
INSERT INTO ingredient_quality VALUES (3 , 2, 20);
INSERT INTO ingredient_quality VALUES (3 , 3, 0);
INSERT INTO ingredient_quality VALUES (3 , 4, 21);

INSERT INTO ingredient_quality VALUES ( 4, 1, 266);
INSERT INTO ingredient_quality VALUES ( 4, 2, 8);
INSERT INTO ingredient_quality VALUES ( 4, 3, 55.6);
INSERT INTO ingredient_quality VALUES ( 4, 4, 1.9);

INSERT INTO ingredient_quality VALUES ( 5, 1, 27 );
INSERT INTO ingredient_quality VALUES ( 5, 2, 2.2 );
INSERT INTO ingredient_quality VALUES ( 5, 3, 2.6 );
INSERT INTO ingredient_quality VALUES ( 5, 4, 0.5 );

INSERT INTO ingredient_quality VALUES ( 6, 1, 343 );
INSERT INTO ingredient_quality VALUES ( 6, 2, 11.7 );
INSERT INTO ingredient_quality VALUES ( 6, 3, 69.3 );
INSERT INTO ingredient_quality VALUES ( 6, 4, 0.8 );

INSERT INTO ingredient_quality VALUES ( 7, 1, 398 );
INSERT INTO ingredient_quality VALUES ( 7, 2, 0);
INSERT INTO ingredient_quality VALUES ( 7, 3, 99.6 );
INSERT INTO ingredient_quality VALUES ( 7, 4, 0);

INSERT INTO ingredient_quality VALUES ( 8, 1, 76 );
INSERT INTO ingredient_quality VALUES ( 8, 2, 0);
INSERT INTO ingredient_quality VALUES ( 8, 3, 20);
INSERT INTO ingredient_quality VALUES ( 8, 4, 0);

INSERT INTO ingredient_quality VALUES ( 9, 1, 101 );
INSERT INTO ingredient_quality VALUES ( 9, 2, 0.01 );
INSERT INTO ingredient_quality VALUES ( 9, 3, 99.2 );
INSERT INTO ingredient_quality VALUES ( 9, 4, 0 );

INSERT INTO ingredient_quality VALUES ( 10, 1, 337 );
INSERT INTO ingredient_quality VALUES ( 10, 2, 17.6 );
INSERT INTO ingredient_quality VALUES ( 10, 3, 50.02 );
INSERT INTO ingredient_quality VALUES ( 10, 4, 15.9 );

INSERT INTO ingredient_quality VALUES ( 11, 1, 507 );
INSERT INTO ingredient_quality VALUES ( 11, 2, 5.3 );
INSERT INTO ingredient_quality VALUES ( 11, 3, 28.5 );
INSERT INTO ingredient_quality VALUES ( 11, 4, 36.3 );

INSERT INTO ingredient_quality VALUES ( 12, 1, 247 );
INSERT INTO ingredient_quality VALUES ( 12, 2, 3.99 );
INSERT INTO ingredient_quality VALUES ( 12, 3, 80.59 );
INSERT INTO ingredient_quality VALUES ( 12, 4, 1.24 );

INSERT INTO ingredient_quality VALUES ( 13, 1, 270 );
INSERT INTO ingredient_quality VALUES ( 13, 2, 9.1 );
INSERT INTO ingredient_quality VALUES ( 13, 3, 70.8 );
INSERT INTO ingredient_quality VALUES ( 13, 4, 6 );

INSERT INTO ingredient_quality VALUES ( 14, 1, 349);
INSERT INTO ingredient_quality VALUES ( 14, 2, 6.09 );
INSERT INTO ingredient_quality VALUES ( 14, 3, 50.5 );
INSERT INTO ingredient_quality VALUES ( 14, 4, 8.69 );

INSERT INTO ingredient_quality VALUES ( 15, 1, 55);
INSERT INTO ingredient_quality VALUES ( 15, 2, 3.3);
INSERT INTO ingredient_quality VALUES ( 15, 3, 4.8);
INSERT INTO ingredient_quality VALUES ( 15, 4, 3);

INSERT INTO ingredient_quality VALUES ( 16, 1, 155);
INSERT INTO ingredient_quality VALUES ( 16, 2, 13);
INSERT INTO ingredient_quality VALUES ( 16, 3, 1.1 );
INSERT INTO ingredient_quality VALUES ( 16, 4, 11);

INSERT INTO ingredient_quality VALUES ( 17, 1, 0);
INSERT INTO ingredient_quality VALUES ( 17, 2, 0);
INSERT INTO ingredient_quality VALUES ( 17, 3, 0);
INSERT INTO ingredient_quality VALUES ( 17, 4, 0);

INSERT INTO ingredient_quality VALUES ( 18, 1, 255 );
INSERT INTO ingredient_quality VALUES ( 18, 2, 10.95 );
INSERT INTO ingredient_quality VALUES ( 18, 3, 64.81);
INSERT INTO ingredient_quality VALUES ( 18, 4, 3.26);

INSERT INTO ingredient_quality VALUES ( 19, 1, 717);
INSERT INTO ingredient_quality VALUES ( 19, 2, 0.9 );
INSERT INTO ingredient_quality VALUES ( 19, 3, 0.1 );
INSERT INTO ingredient_quality VALUES ( 19, 4, 81 );

INSERT INTO ingredient_quality VALUES ( 20, 1, 335 );
INSERT INTO ingredient_quality VALUES ( 20, 2, 0.4 );
INSERT INTO ingredient_quality VALUES ( 20, 3, 81.1);
INSERT INTO ingredient_quality VALUES ( 20, 4, 0.06 );

INSERT INTO ingredient_quality VALUES ( 21, 1, 327);
INSERT INTO ingredient_quality VALUES ( 21, 2, 0.39);
INSERT INTO ingredient_quality VALUES ( 21, 3, 81.1);
INSERT INTO ingredient_quality VALUES ( 21, 4, 0.06);

INSERT INTO ingredient_quality VALUES ( 22, 1, 30 );
INSERT INTO ingredient_quality VALUES ( 22, 2, 0.10 );
INSERT INTO ingredient_quality VALUES ( 22, 3, 6.4 );
INSERT INTO ingredient_quality VALUES ( 22, 4, 0.4 );

INSERT INTO ingredient_quality VALUES ( 23, 1, 22);
INSERT INTO ingredient_quality VALUES ( 23, 2, 0);
INSERT INTO ingredient_quality VALUES ( 23, 3, 0.9 );
INSERT INTO ingredient_quality VALUES ( 23, 4, 0);

INSERT INTO ingredient_quality VALUES ( 24, 1, 334);
INSERT INTO ingredient_quality VALUES ( 24, 2, 21 );
INSERT INTO ingredient_quality VALUES ( 24, 3, 0.5 );
INSERT INTO ingredient_quality VALUES ( 24, 4, 28 );

INSERT INTO ingredient_quality VALUES ( 25, 1, 368 );
INSERT INTO ingredient_quality VALUES ( 25, 2, 23.41 );
INSERT INTO ingredient_quality VALUES ( 25, 3, 1.12 );
INSERT INTO ingredient_quality VALUES ( 25, 4, 30.04 );

INSERT INTO ingredient_quality VALUES ( 26, 1, 286 );
INSERT INTO ingredient_quality VALUES ( 26, 2, 9.3 );
INSERT INTO ingredient_quality VALUES ( 26, 3, 56.6);
INSERT INTO ingredient_quality VALUES ( 26, 4, 1.5 );

INSERT INTO ingredient_quality VALUES ( 27, 1, 269 );
INSERT INTO ingredient_quality VALUES ( 27, 2, 9 );
INSERT INTO ingredient_quality VALUES ( 27, 3, 50.6 );
INSERT INTO ingredient_quality VALUES ( 27, 4, 1.8 );

INSERT INTO ingredient_quality VALUES ( 28, 1, 274);
INSERT INTO ingredient_quality VALUES ( 28, 2, 8.8);
INSERT INTO ingredient_quality VALUES ( 28, 3, 51.9);
INSERT INTO ingredient_quality VALUES ( 28, 4, 3);

INSERT INTO ingredient_quality VALUES ( 29, 1, 13.6 );
INSERT INTO ingredient_quality VALUES ( 29, 2, 1.3 );
INSERT INTO ingredient_quality VALUES ( 29, 3, 1.4 );
INSERT INTO ingredient_quality VALUES ( 29, 4, 0.2 );

INSERT INTO ingredient_quality VALUES ( 30, 1, 343 );
INSERT INTO ingredient_quality VALUES ( 30, 2, 11.7 );
INSERT INTO ingredient_quality VALUES ( 30, 3, 69.3 );
INSERT INTO ingredient_quality VALUES ( 30, 4, 0.8 );

INSERT INTO ingredient_quality VALUES ( 31, 1, 344 );
INSERT INTO ingredient_quality VALUES ( 31, 2, 11.4 );
INSERT INTO ingredient_quality VALUES ( 31, 3, 68.7 );
INSERT INTO ingredient_quality VALUES ( 31, 4, 1.1);

INSERT INTO ingredient_quality VALUES ( 32, 1, 0);
INSERT INTO ingredient_quality VALUES ( 32, 2, 0);
INSERT INTO ingredient_quality VALUES ( 32, 3, 0);
INSERT INTO ingredient_quality VALUES ( 32, 4, 0);

INSERT INTO ingredient_quality VALUES ( 33, 1, 0);
INSERT INTO ingredient_quality VALUES ( 33, 2, 0);
INSERT INTO ingredient_quality VALUES ( 33, 3, 0);
INSERT INTO ingredient_quality VALUES ( 33, 4, 0);

INSERT INTO ingredient_quality VALUES ( 34, 1, 0);
INSERT INTO ingredient_quality VALUES ( 34, 2, 0);
INSERT INTO ingredient_quality VALUES ( 34, 3, 0);
INSERT INTO ingredient_quality VALUES ( 34, 4, 0);

INSERT INTO ingredient_quality VALUES ( 35, 1, 735);
INSERT INTO ingredient_quality VALUES ( 35, 2, 0);
INSERT INTO ingredient_quality VALUES ( 35, 3, 0);
INSERT INTO ingredient_quality VALUES ( 35, 4, 80);

INSERT INTO ingredient_quality VALUES ( 36, 1, 745 );
INSERT INTO ingredient_quality VALUES ( 36, 2, 0.7 );
INSERT INTO ingredient_quality VALUES ( 36, 3, 1);
INSERT INTO ingredient_quality VALUES ( 36, 4, 82.2 );

INSERT INTO ingredient_quality VALUES ( 37, 1, 717);
INSERT INTO ingredient_quality VALUES ( 37, 2, 0.85 );
INSERT INTO ingredient_quality VALUES ( 37, 3, 0.06 );
INSERT INTO ingredient_quality VALUES ( 37, 4, 81.11 );

INSERT INTO ingredient_quality VALUES ( 38, 1, 359 );
INSERT INTO ingredient_quality VALUES ( 38, 2, 7 );
INSERT INTO ingredient_quality VALUES ( 38, 3, 1 );
INSERT INTO ingredient_quality VALUES ( 38, 4, 36.3 );

INSERT INTO ingredient_quality VALUES ( 39, 1, 389);
INSERT INTO ingredient_quality VALUES ( 39, 2, 0);
INSERT INTO ingredient_quality VALUES ( 39, 3, 100 );
INSERT INTO ingredient_quality VALUES ( 39, 4, 0);

INSERT INTO ingredient_quality VALUES ( 40, 1, 380);
INSERT INTO ingredient_quality VALUES ( 40, 2, 0.1);
INSERT INTO ingredient_quality VALUES ( 40, 3, 98 );
INSERT INTO ingredient_quality VALUES ( 40, 4, 0);

INSERT INTO ingredient_quality VALUES ( 41, 1, 185 );
INSERT INTO ingredient_quality VALUES ( 41, 2, 13.8);
INSERT INTO ingredient_quality VALUES ( 41, 3, 1.35);
INSERT INTO ingredient_quality VALUES ( 41, 4, 13.2);

INSERT INTO ingredient_quality VALUES ( 42, 1, 120);
INSERT INTO ingredient_quality VALUES ( 42, 2, 12.2);
INSERT INTO ingredient_quality VALUES ( 42, 3, 0.7);
INSERT INTO ingredient_quality VALUES ( 42, 4, 11.7);

INSERT INTO ingredient_quality VALUES ( 43, 1, 50);
INSERT INTO ingredient_quality VALUES ( 43, 2, 3.1);
INSERT INTO ingredient_quality VALUES ( 43, 3, 21.3);
INSERT INTO ingredient_quality VALUES ( 43, 4, 3.5);

-- RECIPE QUALITY (idRecipe, idQuality, qtyQuality)
-- quantités non représentatives, elles sont aléatoires

    -- pour idRecipe 1
INSERT INTO recipe_quality VALUES ( 1, 1, 1113);
INSERT INTO recipe_quality VALUES ( 1, 2, 5);
INSERT INTO recipe_quality VALUES ( 1, 3, 10);
INSERT INTO recipe_quality VALUES ( 1, 4, 84);

    -- pour idRecipe 2
INSERT INTO recipe_quality VALUES ( 2, 1, 1309);
INSERT INTO recipe_quality VALUES ( 2, 2, 12);
INSERT INTO recipe_quality VALUES ( 2, 3, 46);
INSERT INTO recipe_quality VALUES ( 2, 4, 49);

    -- pour idRecipe 3
INSERT INTO recipe_quality VALUES ( 3, 1, 618);
INSERT INTO recipe_quality VALUES ( 3, 2, 14);
INSERT INTO recipe_quality VALUES ( 3, 3, 73);
INSERT INTO recipe_quality VALUES ( 3, 4, 44);

-- PLANNING (idPlanning, namePlanning, descPlanning, startPlanning, endPlanning)

INSERT INTO planning VALUES (NULL, 'Week-end', '', NULL, NULL);
INSERT INTO planning VALUES (NULL, 'Semaine', '', NULL, NULL);
INSERT INTO planning VALUES (NULL, 'Semaine 03/01/2022', '', NULL, NULL);

-- RECIPE PLANNING (idPlanning, idRecipe, dateMeal, nbPersMeal)

    -- pour idPlanning 1
INSERT INTO planning_recipe VALUES (1, 1, TO_TIMESTAMP('2022/01/08 19:30:00', 'yyyy/mm/dd hh24:mi:ss'), 4);
INSERT INTO planning_recipe VALUES (1, 2, TO_TIMESTAMP('2022/01/08 15:00:00', 'yyyy/mm/dd hh24:mi:ss'), 12);
INSERT INTO planning_recipe VALUES (1, 3, TO_TIMESTAMP('2022/01/09 12:00:00', 'yyyy/mm/dd hh24:mi:ss'), 8);

    -- pour idPlanning 2
INSERT INTO planning_recipe VALUES (2, 2, CURRENT_TIMESTAMP+4, 3);

    -- pour idPlanning 3
INSERT INTO planning_recipe VALUES (3, 1, TO_TIMESTAMP('2022/01/03 19:30:00', 'yyyy/mm/dd hh24:mi:ss'), 4);
INSERT INTO planning_recipe VALUES (3, 3, TO_TIMESTAMP('2022/01/06 12:00:00', 'yyyy/mm/dd hh24:mi:ss'), 4);

-- USERS PLANNING (idUsers, idPlanning)

INSERT INTO users_planning VALUES (1, 1);
INSERT INTO users_planning VALUES (2, 2);
INSERT INTO users_planning VALUES (3, 3);

-- USERS OLD PLANNING (idUsers, idPlanning)

INSERT INTO users_old_planning VALUES (2, 3);
INSERT INTO users_planning VALUES (3, 1);

-- SHOPPING (idShopping, nameShopping, descShopping, startShopping, endShopping)

INSERT INTO shopping VALUES (NULL, 'Ce week-end', '', NULL, NULL);
INSERT INTO shopping VALUES (NULL, 'Semaine', '', NULL, NULL);
INSERT INTO shopping VALUES (NULL, 'Semaine 03/01/2022', '', NULL, NULL);

-- INGREDIENT SHOPPING (idShopping, idIngredient, qtyShopping)
-- rien insérer ici ce car sera fait dans la deuxième partie du projet

-- PLANNING SHOPPING (idShopping, idPlanning)

INSERT INTO shopping_planning VALUES (1, 1);
INSERT INTO shopping_planning VALUES (2, 2);
INSERT INTO shopping_planning VALUES (3, 3);

-- USERS SHOPPING (idUsers, idShopping)

INSERT INTO users_shopping VALUES (1, 1);
INSERT INTO users_shopping VALUES (2, 2);
INSERT INTO users_shopping VALUES (3, 3);

-- USERS OLD SHOPPING (idUsers, idShopping)

INSERT INTO users_old_shopping VALUES (2, 3);
INSERT INTO users_shopping VALUES (3, 1);

-- DIET (idDiet, nameDiet)

INSERT INTO diet VALUES (NULL, 'Végétarisme');
INSERT INTO diet VALUES (NULL, 'Pesco-végétarisme');
INSERT INTO diet VALUES (NULL, 'Véganisme');
INSERT INTO diet VALUES (NULL, 'Sans gluten');
INSERT INTO diet VALUES (NULL, 'Sans lactose');

-- INGEDIENT DIET (idIngredient, idDiet)
-- pas d'ingrédient Vegetarisme ou Pesco Vegetarisme

    -- Veganisme
INSERT INTO ingredient_diet VALUES(1, 3);
INSERT INTO ingredient_diet VALUES(3, 3);
INSERT INTO ingredient_diet VALUES(15, 3);
INSERT INTO ingredient_diet VALUES(16, 3);
INSERT INTO ingredient_diet VALUES(19, 3);
INSERT INTO ingredient_diet VALUES(20, 3);
INSERT INTO ingredient_diet VALUES(21, 3);
INSERT INTO ingredient_diet VALUES(24, 3);
INSERT INTO ingredient_diet VALUES(25, 3);
INSERT INTO ingredient_diet VALUES(35, 3);
INSERT INTO ingredient_diet VALUES(36, 3);
INSERT INTO ingredient_diet VALUES(37, 3);
INSERT INTO ingredient_diet VALUES(38, 3);
INSERT INTO ingredient_diet VALUES(41, 3);
INSERT INTO ingredient_diet VALUES(42, 3);
INSERT INTO ingredient_diet VALUES(43, 3);

    -- Sans gluten
INSERT INTO ingredient_diet VALUES(4, 4);
INSERT INTO ingredient_diet VALUES(6, 4);
INSERT INTO ingredient_diet VALUES(8, 4);
INSERT INTO ingredient_diet VALUES(26, 4);
INSERT INTO ingredient_diet VALUES(27, 4);
INSERT INTO ingredient_diet VALUES(28, 4);
INSERT INTO ingredient_diet VALUES(30, 4);
INSERT INTO ingredient_diet VALUES(31, 4);

    -- Sans lactose
INSERT INTO ingredient_diet VALUES(3, 5);
INSERT INTO ingredient_diet VALUES(15, 5);
INSERT INTO ingredient_diet VALUES(19, 5);
INSERT INTO ingredient_diet VALUES(24, 5);
INSERT INTO ingredient_diet VALUES(25, 5);
INSERT INTO ingredient_diet VALUES(35, 5);
INSERT INTO ingredient_diet VALUES(36, 5);
INSERT INTO ingredient_diet VALUES(37, 5);
INSERT INTO ingredient_diet VALUES(38, 5);
INSERT INTO ingredient_diet VALUES(43, 5);