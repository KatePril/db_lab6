SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_labs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_labs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_labs` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------

USE `DB_labs` ;

-- -----------------------------------------------------
-- Table `DB_labs`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`User` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `password` VARCHAR(45) NOT NULL,
  `is_admin` TINYINT NOT NULL,
  `description` TEXT NULL,
  `age` TINYINT NULL,
  `gender` VARCHAR(45) NULL,
  `company` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idUser_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`ExpertComplaint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`ExpertComplaint` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `date` DATETIME NOT NULL,
  `researcher_id` INT UNSIGNED NOT NULL,
  `expert_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `researcher_id`, `expert_id`),
  INDEX `fk_ExpertComplaint_User2_idx` (`expert_id` ASC) VISIBLE,
  CONSTRAINT `fk_ExpertComplaint_User1`
    FOREIGN KEY (`researcher_id`)
    REFERENCES `DB_labs`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ExpertComplaint_User2`
    FOREIGN KEY (`expert_id`)
    REFERENCES `DB_labs`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`Survey`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`Survey` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `creation_date` DATETIME NOT NULL,
  `close_date` DATETIME NULL,
  `is_changable` TINYINT NOT NULL,
  `is_active` TINYINT NOT NULL,
  `owner_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `owner_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Survey_User1_idx` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `fk_Survey_User1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `DB_labs`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`SurveyComplaint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`SurveyComplaint` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `date` DATETIME NOT NULL,
  `survey_id` INT UNSIGNED NOT NULL,
  `expert_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `survey_id`, `expert_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `survey_id_idx` (`survey_id` ASC) VISIBLE,
  INDEX `fk_SurveyComplaint_User1_idx` (`expert_id` ASC) VISIBLE,
  CONSTRAINT `survey_1_id`
    FOREIGN KEY (`survey_id`)
    REFERENCES `DB_labs`.`Survey` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `expert_id`
    FOREIGN KEY (`expert_id`)
    REFERENCES `DB_labs`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`Category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `parent_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`Expertise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`Expertise` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `expertise_rate` DOUBLE NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `category_id`, `user_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `category_id_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_Expertise_User1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `DB_labs`.`Category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Expertise_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DB_labs`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`Question` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `header` VARCHAR(60) NOT NULL,
  `description` TEXT NULL,
  `survey_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `survey_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `survey_id_idx` (`survey_id` ASC) VISIBLE,
  CONSTRAINT `fk_survey_id`
    FOREIGN KEY (`survey_id`)
    REFERENCES `DB_labs`.`Survey` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`Option_q`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`Option_q` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `question_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `question_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `question_id_idx` (`question_id` ASC) VISIBLE,
  CONSTRAINT `fk_question_id`
    FOREIGN KEY (`question_id`)
    REFERENCES `DB_labs`.`Question` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`Answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`Answer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_id` INT UNSIGNED NOT NULL,
  `expert_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `option_id`, `expert_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `option_id_idx` (`option_id` ASC) VISIBLE,
  INDEX `fk_Answer_User2_idx` (`expert_id` ASC) VISIBLE,
  CONSTRAINT `fk_option_id`
    FOREIGN KEY (`option_id`)
    REFERENCES `DB_labs`.`Option_q` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Answer_User2`
    FOREIGN KEY (`expert_id`)
    REFERENCES `DB_labs`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_labs`.`SurveyCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_labs`.`SurveyCategory` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `survey_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `survey_id`, `category_id`),
  INDEX `fk_Survey_has_Category_Survey1_idx` (`survey_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_SurveyCategory_Category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_survey_id1`
    FOREIGN KEY (`survey_id`)
    REFERENCES `DB_labs`.`Survey` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_SurveyCategory_Category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `DB_labs`.`Category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;