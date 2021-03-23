
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema moviecruiser
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema moviecruiser
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moviecruiser` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8_general_ci ;
USE `moviecruiser` ;

-- -----------------------------------------------------
-- Table `moviecruiser`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviecruiser`.`user` (
  `us_id` INT NOT NULL AUTO_INCREMENT,
  `us_name` VARCHAR(60) NULL,
  PRIMARY KEY (`us_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviecruiser`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviecruiser`.`movie` (
  `mo_id` INT NOT NULL AUTO_INCREMENT,
  `mo_title` VARCHAR(100) NULL,
  `mo_box_office` DECIMAL(8,2) NULL,
  `mo_active` VARCHAR(3) NULL,
  `mo_date_of_launch` DATE NULL,
  `mo_genre` VARCHAR(45) NULL,
  `mo_has_teaser` VARCHAR(3) NULL,
  PRIMARY KEY (`mo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviecruier`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviecruiser`.`favourites` (
  `ft_id` INT NOT NULL AUTO_INCREMENT,
  `ft_us_id` INT NULL,
  `ft_pr_id` INT NULL,
  PRIMARY KEY (`ft_id`),
  INDEX `ct_us_fk_idx` (`ft_us_id` ASC),
  INDEX `ct_pr_fk_idx` (`ft_pr_id` ASC),
  CONSTRAINT `ft_us_fk`
    FOREIGN KEY (`ft_us_id`)
    REFERENCES `moviecruiser`.`favorites` (`us_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ft_pr_fk`
    FOREIGN KEY (`ft_pr_id`)
    REFERENCES `moviecruiser`.`movie` (`mo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


select * from favourites;

select * from movie;

alter table movie modify mo_active boolean;

alter table movie modify mo_has_teaser boolean;

alter table movie modify mo_box_office varchar(100);

