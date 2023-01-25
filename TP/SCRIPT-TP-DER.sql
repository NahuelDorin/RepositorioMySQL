-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peliculas` (
  `codigo_pelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` TEXT NOT NULL,
  `año` INT NOT NULL,
  `duracion` INT NULL,
  PRIMARY KEY (`codigo_pelicula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Amigos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Amigos` (
  `codigo_amigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` TEXT NOT NULL,
  `apellido` TEXT NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` TEXT NOT NULL,
  PRIMARY KEY (`codigo_amigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prestamos` (
  `numeros_alquiler` INT NOT NULL AUTO_INCREMENT,
  `fecha_fin` DATE NULL,
  `fecha_inicio` DATE NOT NULL,
  `codigo_pelicula` INT NOT NULL,
  `codigo_amigo` INT NOT NULL,
  `Peliculas_codigo_pelicula` INT NOT NULL,
  `Amigos_codigo_amigo` INT NOT NULL,
  PRIMARY KEY (`numeros_alquiler`, `codigo_pelicula`, `codigo_amigo`),
  INDEX `fk_Prestamos_Peliculas_idx` (`Peliculas_codigo_pelicula` ASC) VISIBLE,
  INDEX `fk_Prestamos_Amigos1_idx` (`Amigos_codigo_amigo` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamos_Peliculas`
    FOREIGN KEY (`Peliculas_codigo_pelicula`)
    REFERENCES `mydb`.`Peliculas` (`codigo_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamos_Amigos1`
    FOREIGN KEY (`Amigos_codigo_amigo`)
    REFERENCES `mydb`.`Amigos` (`codigo_amigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
