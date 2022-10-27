-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`usuarios` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `sobre_mi` VARCHAR(500) NULL,
  `password` VARCHAR(45) NULL,
  `url_foto` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`lenguaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`lenguaje` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `url_logo` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`skills` (
  `id` INT NOT NULL,
  `porcentaje` INT NULL,
  `usuarios_id` INT NOT NULL,
  `lenguaje_id` INT NOT NULL,
  PRIMARY KEY (`id`, `usuarios_id`, `lenguaje_id`),
  INDEX `fk_skills_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `fk_skills_lenguaje1_idx` (`lenguaje_id` ASC) VISIBLE,
  CONSTRAINT `fk_skills_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `portfolio`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skills_lenguaje1`
    FOREIGN KEY (`lenguaje_id`)
    REFERENCES `portfolio`.`lenguaje` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`red_social` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `url_icono` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`contacto` (
  `id` INT NOT NULL,
  `url_contacto` VARCHAR(200) NULL,
  `usuarios_id` INT NOT NULL,
  `red_social_id` INT NOT NULL,
  PRIMARY KEY (`id`, `red_social_id`),
  INDEX `fk_contacto_usuarios_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `fk_contacto_red_social1_idx` (`red_social_id` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `portfolio`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_red_social1`
    FOREIGN KEY (`red_social_id`)
    REFERENCES `portfolio`.`red_social` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`proyectos` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `imagen` VARCHAR(200) NULL,
  `url` VARCHAR(200) NULL,
  `url_repo` VARCHAR(200) NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proyectos_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `portfolio`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
