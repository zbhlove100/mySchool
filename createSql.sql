SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `greatfood` DEFAULT CHARACTER SET utf8 ;
USE `greatfood` ;

-- -----------------------------------------------------
-- Table `greatfood`.`food`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `greatfood`.`food` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `food_name` VARCHAR(255) NULL ,
  `owner` VARCHAR(255) NULL ,
  `discription` VARCHAR(5000) NULL ,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `removed_at` TIMESTAMP NULL ,
  `state` VARCHAR(45) NULL ,
  `main_picture` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `greatfood`.`materials`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `greatfood`.`materials` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `materials_name` VARCHAR(255) NULL ,
  `other_name` VARCHAR(5000) NULL ,
  `discription` VARCHAR(5000) NULL ,
  `materials_picture` VARCHAR(255) NULL ,
  `materials_nutrition` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'the message of the materials' ;


-- -----------------------------------------------------
-- Table `greatfood`.`food_materials`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `greatfood`.`food_materials` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `food_id` BIGINT NOT NULL ,
  `food_materials_id` BIGINT NOT NULL ,
  `food_materials_type` VARCHAR(255) NULL ,
  `food_materials_count` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_food_materials_1` (`food_materials_id` ASC) ,
  INDEX `fk_food_materials_2` (`food_id` ASC) ,
  CONSTRAINT `fk_food_materials_1`
    FOREIGN KEY (`food_materials_id` )
    REFERENCES `greatfood`.`materials` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_food_materials_2`
    FOREIGN KEY (`food_id` )
    REFERENCES `greatfood`.`food` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greatfood`.`tag`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `greatfood`.`tag` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `tag_name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greatfood`.`materials_tag`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `greatfood`.`materials_tag` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `materials_id` BIGINT NOT NULL ,
  `tag_id` BIGINT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_materials_tag_1` (`materials_id` ASC) ,
  INDEX `fk_materials_tag_2` (`tag_id` ASC) ,
  CONSTRAINT `fk_materials_tag_1`
    FOREIGN KEY (`materials_id` )
    REFERENCES `greatfood`.`materials` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_tag_2`
    FOREIGN KEY (`tag_id` )
    REFERENCES `greatfood`.`tag` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greatfood`.`food_method`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `greatfood`.`food_method` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `food_id` BIGINT NULL ,
  `step` INT NULL DEFAULT 0 ,
  `method_picture` VARCHAR(255) NULL ,
  `method_detail` VARCHAR(2000) NULL ,
  `method_tip` VARCHAR(500) NULL ,
  `ispoint` VARCHAR(45) NULL ,
  `taketime` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_table1_1` (`food_id` ASC) ,
  CONSTRAINT `fk_table1_1`
    FOREIGN KEY (`food_id` )
    REFERENCES `greatfood`.`food` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greatfood`.`food_viewlog`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `greatfood`.`food_viewlog` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `food_id` BIGINT NOT NULL ,
  `view_times` BIGINT NULL ,
  `favorite_times` BIGINT NULL ,
  `cook_times` BIGINT NULL ,
  `comment_times` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_food_viewlog_1` (`food_id` ASC) ,
  CONSTRAINT `fk_food_viewlog_1`
    FOREIGN KEY (`food_id` )
    REFERENCES `greatfood`.`food` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
