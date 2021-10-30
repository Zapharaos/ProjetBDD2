-- //////////////////////////////////////////////
-- //////////     id AUTO increment    //////////
-- //////////////////////////////////////////////

-- idUsers
CREATE OR REPLACE TRIGGER IDUSERS_INSERT
BEFORE INSERT
ON users
FOR EACH ROW
BEGIN
    SELECT idUsers_sequence.nextval
    INTO :new.idUsers
    FROM dual;
END;
/
SHOW ERRORS trigger IDUSERS_INSERT;

-- idIngredient
CREATE OR REPLACE TRIGGER IDINGREDIENT_INSERT
BEFORE INSERT
ON ingredient
FOR EACH ROW
BEGIN
    SELECT idIngredient_sequence.nextval
    INTO :new.idIngredient
    FROM dual;
END;
/
SHOW ERRORS trigger IDINGREDIENT_INSERT;

-- idRecipe
CREATE OR REPLACE TRIGGER IDRECIPE_INSERT
BEFORE INSERT
ON recipe
FOR EACH ROW
BEGIN
    SELECT idRecipe_sequence.nextval
    INTO :new.idRecipe
    FROM dual;
END;
/
SHOW ERRORS trigger IDRECIPE_INSERT;

-- idMedia
CREATE OR REPLACE TRIGGER IDMEDIA_INSERT
BEFORE INSERT
ON media
FOR EACH ROW
BEGIN
    SELECT idMedia_sequence.nextval
    INTO :new.idMedia
    FROM dual;
END;
/
SHOW ERRORS trigger IDMEDIA_INSERT;

-- idCategory
CREATE OR REPLACE TRIGGER IDCATEGORY_INSERT
BEFORE INSERT
ON category
FOR EACH ROW
BEGIN
    SELECT idCategory_sequence.nextval
    INTO :new.idCategory
    FROM dual;
END;
/
SHOW ERRORS trigger IDCATEGORY_INSERT;

-- idStep
CREATE OR REPLACE TRIGGER IDSTEP_INSERT
BEFORE INSERT
ON step
FOR EACH ROW
BEGIN
    SELECT idStep_sequence.nextval
    INTO :new.idStep
    FROM dual;
END;
/
SHOW ERRORS trigger IDSTEP_INSERT;

-- idDuration
CREATE OR REPLACE TRIGGER IDDURATION_INSERT
BEFORE INSERT
ON duration
FOR EACH ROW
BEGIN
    SELECT idDuration_sequence.nextval
    INTO :new.idDuration
    FROM dual;
END;
/
SHOW ERRORS trigger IDDURATION_INSERT;

-- idQuality
CREATE OR REPLACE TRIGGER IDQUALITY_INSERT
BEFORE INSERT
ON quality
FOR EACH ROW
BEGIN
    SELECT idQuality_sequence.nextval
    INTO :new.idQuality
    FROM dual;
END;
/
SHOW ERRORS trigger IDQUALITY_INSERT;

-- idShopping
CREATE OR REPLACE TRIGGER IDSHOPPING_INSERT
BEFORE INSERT
ON shopping
FOR EACH ROW
BEGIN
    SELECT idShopping_sequence.nextval
    INTO :new.idShopping
    FROM dual;
END;
/
SHOW ERRORS trigger IDSHOPPING_INSERT;

-- idPlanning
CREATE OR REPLACE TRIGGER IDPLANNING_INSERT
BEFORE INSERT
ON planning
FOR EACH ROW
BEGIN
    SELECT idPlanning_sequence.nextval
    INTO :new.idPlanning
    FROM dual;
END;
/
SHOW ERRORS trigger IDPLANNING_INSERT;

-- idDiet
CREATE OR REPLACE TRIGGER IDDIET_INSERT
BEFORE INSERT
ON diet
FOR EACH ROW
BEGIN
    SELECT idDiet_sequence.nextval
    INTO :new.idDiet
    FROM dual;
END;
/
SHOW ERRORS trigger IDDIET_INSERT;