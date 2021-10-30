@droptables

-- Utilisateur
CREATE TABLE users (
  idUsers INTEGER,
  login VARCHAR2(32) NOT NULL,
  email VARCHAR2(128) NOT NULL,
  pwd VARCHAR2(64) NOT NULL,
  name VARCHAR2(32),
  lastName VARCHAR2(32),
  address VARCHAR2(128),
  CONSTRAINT PK_users PRIMARY KEY (idUsers),	-- Clé primaire
  CONSTRAINT U_users_login UNIQUE (login), -- Unicité login
  CONSTRAINT U_users_email UNIQUE (email), -- Unicité email
  CONSTRAINT CK_users_email CHECK (email LIKE '%@%.%' AND email NOT LIKE '@%' AND email NOT LIKE '%@%@%') -- Check format
);

-- Ingredient
CREATE TABLE ingredient (
  idIngredient INTEGER,
  nameIngredient VARCHAR2(64) NOT NULL,
  unity VARCHAR2(64) NOT NULL,
  CONSTRAINT PK_ingredient PRIMARY KEY (idIngredient), -- PK
  CONSTRAINT U_ingredient_name UNIQUE (nameIngredient) -- Unicité nameIngredient
);

-- Ingrédients d’un utilisateur
CREATE TABLE stock (
  idUsers INTEGER,
  idIngredient INTEGER,
  qtyAvailable DECIMAL NOT NULL,
  CONSTRAINT PK_stock PRIMARY KEY (idUsers, idIngredient),	-- Clé primaire
  CONSTRAINT FK_stock_idUsers FOREIGN KEY (idUsers) REFERENCES users ON DELETE CASCADE, -- FK
  CONSTRAINT FK_stock_idIngredient FOREIGN KEY (idIngredient) REFERENCES ingredient ON DELETE CASCADE, -- FK
  CONSTRAINT CK_stock_quantity CHECK (qtyAvailable >= 0)	-- Check quantity
);

-- Recette 
CREATE TABLE recipe (
  idRecipe INTEGER,
  nameRecipe VARCHAR2(128) NOT NULL,
  author VARCHAR2(64) NOT NULL,
  descRecipe CLOB,
  difficulty VARCHAR2(32) NOT NULL,
  price DECIMAL NOT NULL,
  nbPers INTEGER NOT NULL,
  CONSTRAINT PK_recipe PRIMARY KEY (idRecipe), -- PK
  CONSTRAINT CK_recipe_difficulty CHECK (difficulty IN ('Tres facile','Facile','Standard','Difficile')), -- Check difficulty
  CONSTRAINT CK_recipe_price CHECK (price between 1 and 5), -- Check price
  CONSTRAINT CK_recipe_nb CHECK (nbPers > 0)	-- Check nbPers
);

-- Recettes d’un utilisateur
CREATE TABLE users_recipe (
  idUsers INTEGER,
  idRecipe INTEGER,
  CONSTRAINT PK_usersRecipe PRIMARY KEY (idUsers, idRecipe),	-- Clé primaire
  CONSTRAINT FK_usersRecipe_idUsers	FOREIGN KEY (idUsers) REFERENCES users ON DELETE CASCADE, -- FK
  CONSTRAINT FK_usersRecipe_idRecipe FOREIGN KEY (idRecipe) REFERENCES recipe ON DELETE CASCADE -- FK
);

-- Illustration
CREATE TABLE media (
  idMedia INTEGER,
  nameMedia VARCHAR2(32) NOT NULL,
  descMedia CLOB,
  media VARCHAR2(256) NOT NULL,
  idRecipe INTEGER,
  CONSTRAINT PK_media PRIMARY KEY (idMedia),	-- Clé primaire
  CONSTRAINT FK_media_idRecipe FOREIGN KEY (idRecipe) REFERENCES recipe ON DELETE CASCADE -- FK
);

-- Categorie
CREATE TABLE category (
  idCategory INTEGER,
  nameCategory VARCHAR2(64) NOT NULL,
  CONSTRAINT PK_category PRIMARY KEY (idCategory), -- PK
  CONSTRAINT U_category_name UNIQUE (nameCategory) -- Unicité nameCategory
);

-- Catégories d’un ingrédient
CREATE TABLE ingredient_category (
  idIngredient INTEGER,
  idCategory INTEGER,
  CONSTRAINT PK_ingredientCategory PRIMARY KEY (idIngredient, idCategory),	-- Clé primaire
  CONSTRAINT FK_ingredientCategory_idIngre FOREIGN KEY (idIngredient) REFERENCES ingredient ON DELETE CASCADE, -- FK
  CONSTRAINT FK_ingredientCategory_idCat FOREIGN KEY (idCategory) REFERENCES category ON DELETE CASCADE -- FK
);

-- Ingrédients d’une recette
CREATE TABLE recipe_ingredient (
  idRecipe INTEGER,
  idIngredient INTEGER,
  quantity DECIMAL NOT NULL,
  idCategory INTEGER,
  CONSTRAINT PK_recipeIngredient PRIMARY KEY (idRecipe, idIngredient),	-- Clé primaire
  CONSTRAINT FK_recipeIngredient_idRecipe FOREIGN KEY (idRecipe) REFERENCES recipe ON DELETE CASCADE, -- FK
  CONSTRAINT FK_recipeIngredient_idIngre FOREIGN KEY (idIngredient) REFERENCES ingredient ON DELETE CASCADE, -- FK
  CONSTRAINT FK_recipeIngredient_idCategory FOREIGN KEY (idCategory) REFERENCES category ON DELETE CASCADE, -- FK
  CONSTRAINT CK_recipeIngredient_quantity CHECK (quantity >= 0)	-- Check quantity
);

-- Etape
CREATE TABLE step (
  idStep INTEGER,
  weigth INTEGER NOT NULL,
  nameStep VARCHAR2(32),
  descStep CLOB,
  idRecipe INTEGER,
  CONSTRAINT PK_step PRIMARY KEY (idStep),	-- Clé primaire
  CONSTRAINT FK_step_idRecipe FOREIGN KEY (idRecipe) REFERENCES recipe ON DELETE CASCADE -- FK
  CONSTRAINT CK_step_weigth CHECK (weigth >= 0)	-- Check weigth
);

-- Durée
CREATE TABLE duration (
  idDuration INTEGER,
  nameDuration VARCHAR2(32) NOT NULL,
  CONSTRAINT PK_duration PRIMARY KEY (idDuration), -- PK
  CONSTRAINT U_duration_name UNIQUE (nameDuration) -- Unicité nameDuration
);

-- Durée d’une étape
CREATE TABLE step_duration (
  idStep INTEGER,
  idDuration INTEGER,
  durStep NUMBER(4) DEFAULT 0 NOT NULL,
  CONSTRAINT PK_stepDuration PRIMARY KEY (idStep, idDuration),	-- Clé primaire
  CONSTRAINT FK_stepDuration_idStep FOREIGN KEY (idStep) REFERENCES step ON DELETE CASCADE, -- FK
  CONSTRAINT FK_stepDuration_idDuration FOREIGN KEY (idDuration) REFERENCES duration ON DELETE CASCADE, -- FK
  CONSTRAINT CK_stepDuration_duration CHECK (duration >= 0) -- Check durée
);

-- Durée d’une recette
CREATE TABLE recipe_duration (
  idRecipe INTEGER,
  idDuration INTEGER,
  durRecipe NUMBER(4) DEFAULT 0 NOT NULL,
  CONSTRAINT PK_recipeDuration PRIMARY KEY (idRecipe, idDuration),	-- Clé primaire
  CONSTRAINT FK_recipeDuration_idRecipe FOREIGN KEY (idRecipe) REFERENCES step ON DELETE CASCADE, -- FK
  CONSTRAINT FK_recipeDuration_idDuration FOREIGN KEY (idDuration) REFERENCES duration ON DELETE CASCADE, -- FK
  CONSTRAINT CK_recipeDuration_duration CHECK (duration >= 0) -- Check durée
);

-- Qualité diététique
CREATE TABLE quality (
  idQuality INTEGER,
  nameQuality VARCHAR2(32) NOT NULL,
  CONSTRAINT PK_quality PRIMARY KEY (idQuality), -- PK
  CONSTRAINT U_quality_name UNIQUE (nameQuality) -- Unicité nameQuality
);

-- Qualités diététiques d’un ingrédient
CREATE TABLE ingredient_quality (
  idIngredient INTEGER,
  idQuality INTEGER,
  qtyQuality DECIMAL NOT NULL,
  CONSTRAINT PK_ingredientQuality PRIMARY KEY (idIngredient, idQuality),	-- Clé primaire
  CONSTRAINT FK_ingredientQuality_idIngre FOREIGN KEY (idIngredient) REFERENCES ingredient ON DELETE CASCADE, -- FK
  CONSTRAINT FK_ingredientQuality_idQuali FOREIGN KEY (idQuality) REFERENCES quality ON DELETE CASCADE, -- FK
  CONSTRAINT CK_ingredientQuality CHECK (qtyQuality >= 0)	-- Check quantity
);

-- Qualités diététiques d’une recette
CREATE TABLE recipe_quality (
  idRecipe INTEGER,
  idQuality INTEGER,
  qtyQuality DECIMAL NOT NULL,
  CONSTRAINT PK_recipeQuality PRIMARY KEY (idRecipe, idQuality),	-- Clé primaire
  CONSTRAINT FK_recipeQuality_idRecipe FOREIGN KEY (idRecipe) REFERENCES recipe ON DELETE CASCADE, -- FK
  CONSTRAINT FK_recipeQuality_idQuality FOREIGN KEY (idQuality) REFERENCES quality ON DELETE CASCADE, -- FK
  CONSTRAINT CK_recipeQuality_quantity CHECK (qtyQuality >= 0)	-- Check quantity
);

-- Planning
CREATE TABLE planning (
  idPlanning INTEGER,
  namePlanning VARCHAR2(32) NOT NULL,
  descPlanning CLOB,
  startPlanning DATE,
  endPlanning DATE,
  CONSTRAINT PK_planning PRIMARY KEY (idPlanning) -- PK
);

-- Recettes d’un planning
CREATE TABLE planning_recipe (
  idPlanning INTEGER,
  idRecipe INTEGER,
  dateMeal timestamp NOT NULL,
  nbPersMeal INTEGER NOT NULL,
  CONSTRAINT PK_planningRecipe PRIMARY KEY (idPlanning, idRecipe),	-- Clé primaire
  CONSTRAINT FK_planningRecipe_idPlanning FOREIGN KEY (idPlanning) REFERENCES planning ON DELETE CASCADE, -- FK
  CONSTRAINT FK_planningRecipe_idIngredient FOREIGN KEY (idRecipe) REFERENCES recipe ON DELETE CASCADE, -- FK
  CONSTRAINT CK_planningRecipe_nbPers CHECK (nbPersMeal > 0)	-- Check person
);

-- Plannings d’un utilisateur
CREATE TABLE users_planning (
  idUsers INTEGER,
  idPlanning INTEGER,
  CONSTRAINT PK_usersPlanning PRIMARY KEY (idUsers, idPlanning),	-- Clé primaire
  CONSTRAINT FK_usersPlanning_idUsers FOREIGN KEY (idUsers) REFERENCES users ON DELETE CASCADE, -- FK
  CONSTRAINT FK_usersPlanning_idPlanning FOREIGN KEY (idPlanning) REFERENCES planning ON DELETE CASCADE -- FK
);

-- Plannings archivés d’un utilisateur
CREATE TABLE users_old_planning (
  idUsers INTEGER,
  idPlanning INTEGER,
  CONSTRAINT PK_usersOldPlanning PRIMARY KEY (idUsers, idPlanning),	-- Clé primaire
  CONSTRAINT FK_usersOldPlanning_idUsers FOREIGN KEY (idUsers) REFERENCES users ON DELETE CASCADE, -- FK
  CONSTRAINT FK_usersOldPlanning_idPlanning FOREIGN KEY (idPlanning) REFERENCES planning ON DELETE CASCADE -- FK
);

-- Liste des courses
CREATE TABLE shopping (
  idShopping INTEGER,
  nameShopping VARCHAR2(32) NOT NULL,
  descShopping CLOB,
  startShopping DATE,
  endShopping DATE,
  CONSTRAINT PK_shopping PRIMARY KEY (idShopping) -- PK
);

-- Ingrédients d’une liste des courses
CREATE TABLE shopping_ingredient (
  idShopping INTEGER,
  idIngredient INTEGER,
  qtyShopping DECIMAL NOT NULL,
  CONSTRAINT PK_shoppingIngredient PRIMARY KEY (idShopping, idIngredient),	-- Clé primaire
  CONSTRAINT FK_shoppingIngredient_idShop FOREIGN KEY (idShopping) REFERENCES shopping ON DELETE CASCADE, -- FK
  CONSTRAINT FK_shoppingIngredient_idIngre FOREIGN KEY (idIngredient) REFERENCES ingredient ON DELETE CASCADE, -- FK
  CONSTRAINT CK_shoppingIngredient_quantity CHECK (qtyShopping >= 0)	-- Check quantity
);

-- Plannings d’une liste des courses
CREATE TABLE shopping_planning (
  idShopping INTEGER,
  idPlanning INTEGER,
  CONSTRAINT PK_shoppingPlanning PRIMARY KEY (idShopping, idPlanning),	-- Clé primaire
  CONSTRAINT FK_shoppingPlanning_idShopping FOREIGN KEY (idShopping) REFERENCES shopping ON DELETE CASCADE, -- FK
  CONSTRAINT FK_shoppingPlanning_idPlanning FOREIGN KEY (idPlanning) REFERENCES planning ON DELETE CASCADE -- FK
);

-- Listes des courses d’un utilisateur
CREATE TABLE users_shopping (
  idUsers INTEGER,
  idShopping INTEGER,
  CONSTRAINT PK_usersShopping PRIMARY KEY (idUsers, idShopping),	-- Clé primaire
  CONSTRAINT FK_usersShopping_idUsers FOREIGN KEY (idUsers) REFERENCES users ON DELETE CASCADE, -- FK
  CONSTRAINT FK_usersShopping_idShopping FOREIGN KEY (idShopping) REFERENCES shopping ON DELETE CASCADE -- FK
);

-- Listes des courses archivées d’unutilisateur
CREATE TABLE users_old_shopping (
  idUsers INTEGER,
  idShopping INTEGER,
  CONSTRAINT PK_usersOldShopping PRIMARY KEY (idUsers, idShopping),	-- Clé primaire
  CONSTRAINT FK_usersOldShopping_idUsers FOREIGN KEY (idUsers) REFERENCES users ON DELETE CASCADE, -- FK
  CONSTRAINT FK_usersOldShopping_idShopping FOREIGN KEY (idShopping) REFERENCES shopping ON DELETE CASCADE -- FK
);

-- Regime alimentaire
CREATE TABLE diet (
  idDiet INTEGER,
  nameDiet VARCHAR2(32) NOT NULL,
  CONSTRAINT PK_diet PRIMARY KEY (idDiet), -- PK
  CONSTRAINT U_diet_name UNIQUE (nameDiet) -- Unicité nameDiet
);

-- Régimes alimentaires d’un ingrédient
CREATE TABLE ingredient_diet (
  idIngredient INTEGER,
  idDiet INTEGER,
  CONSTRAINT PK_ingredientDiet PRIMARY KEY (idIngredient, idDiet),	-- Clé primaire
  CONSTRAINT FK_ingredientDiet_idIngredient FOREIGN KEY (idIngredient) REFERENCES ingredient ON DELETE CASCADE, -- FK
  CONSTRAINT FK_ingredientDiet_idDiet FOREIGN KEY (idDiet) REFERENCES diet ON DELETE CASCADE -- FK
);