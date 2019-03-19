-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema accesssystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema accesssystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `accesssystem` DEFAULT CHARACTER SET utf8 ;
USE `accesssystem` ;

-- -----------------------------------------------------
-- Table `accesssystem`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `accesssystem`.`rooms` (
  `rooms_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rooms_name` VARCHAR(255) NOT NULL,
  `rooms_rooms_id` INT UNSIGNED NULL,
  PRIMARY KEY (`rooms_id`),
  INDEX `fk_rooms_rooms_idx` (`rooms_rooms_id` ASC),
  CONSTRAINT `fk_rooms_rooms`
    FOREIGN KEY (`rooms_rooms_id`)
    REFERENCES `accesssystem`.`rooms` (`rooms_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `accesssystem`.`departs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `accesssystem`.`departs` (
  `departs_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `departs_name` VARCHAR(255) NULL,
  `departs_departs_id` INT UNSIGNED NULL,
  PRIMARY KEY (`departs_id`),
  INDEX `fk_departs_departs1_idx` (`departs_departs_id` ASC),
  CONSTRAINT `fk_departs_departs1`
    FOREIGN KEY (`departs_departs_id`)
    REFERENCES `accesssystem`.`departs` (`departs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `accesssystem`.`rooms_departs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `accesssystem`.`rooms_departs` (
  `rooms_id` INT UNSIGNED NOT NULL,
  `departs_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`rooms_id`, `departs_id`),
  INDEX `fk_rooms_has_departs_departs1_idx` (`departs_id` ASC),
  INDEX `fk_rooms_has_departs_rooms1_idx` (`rooms_id` ASC),
  CONSTRAINT `fk_rooms_has_departs_rooms1`
    FOREIGN KEY (`rooms_id`)
    REFERENCES `accesssystem`.`rooms` (`rooms_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rooms_has_departs_departs1`
    FOREIGN KEY (`departs_id`)
    REFERENCES `accesssystem`.`departs` (`departs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `accesssystem`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `accesssystem`.`users` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `departs_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC),
  INDEX `fk_users_departs1_idx` (`departs_id` ASC),
  CONSTRAINT `fk_users_departs1`
    FOREIGN KEY (`departs_id`)
    REFERENCES `accesssystem`.`departs` (`departs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
