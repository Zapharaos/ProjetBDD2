-- Cast lastName to uppercase & set first letter of name to caps
CREATE OR REPLACE TRIGGER SET_USERS_NAME_CAP
BEFORE INSERT OR UPDATE
ON users
FOR EACH ROW
BEGIN
    :NEW.name := INITCAP(:NEW.name);
    :NEW.lastName := UPPER(:NEW.lastName);
END;
/
SHOW ERRORS trigger SET_USERS_NAME_CAP;

-- Updating the stepName to ( 'Etape' + step.weight ) if null or empty
CREATE OR REPLACE TRIGGER SET_RECIPE_STEP_NAME
BEFORE INSERT OR UPDATE
ON step
FOR EACH ROW
WHEN (NEW.nameStep IS NULL OR NEW.nameStep = '')
BEGIN
    :NEW.nameStep := CONCAT('Etape ',:NEW.weigth);
END;
/
SHOW ERRORS trigger SET_RECIPE_STEP_NAME;

-- Check planning recipe date (margin 5 minutes)
CREATE OR REPLACE TRIGGER CK_PLAN_RECIPE_DATE
BEFORE INSERT OR UPDATE
ON planning_recipe
FOR EACH ROW
BEGIN
    IF (:NEW.dateMeal < (CURRENT_TIMESTAMP - INTERVAL '5' MINUTE))
    THEN
        RAISE_APPLICATION_ERROR(-20000,'Date de repas trop ancienne');
    END IF;
END;
/
SHOW ERRORS trigger CK_PLAN_RECIPE_DATE;