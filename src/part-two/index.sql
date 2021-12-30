-- accelerer le processus de connexion
CREATE INDEX connexion ON USERS (login, email, pwd);

-- affichage simple des recettes sur le site : version minimale de RECIPE
CREATE INDEX recette ON RECIPE (idRecipe, nameRecipe, difficulty, price, nbPers);