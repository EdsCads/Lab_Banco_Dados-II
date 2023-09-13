-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Turismo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Turismo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Turismo` DEFAULT CHARACTER SET utf8 ;
USE `Turismo` ;

-- -----------------------------------------------------
-- Table `Turismo`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Cidade` (
  `idCidade` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `Website` VARCHAR(45) NULL,
  PRIMARY KEY (`idCidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Restaurante` (
  `idRestaurante` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `ValorRefeicao` DECIMAL(10,2) NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idRestaurante`, `Cidade_idCidade`),
  CONSTRAINT `fk_Restaurante_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `Turismo`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Hotel` (
  `idHotel` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `ValorDiaria` DECIMAL(10,2) NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idHotel`, `Cidade_idCidade`),
  CONSTRAINT `fk_Hotel_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `Turismo`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`PacoteTurismo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`PacoteTurismo` (
  `idPacoteTurismo` INT NOT NULL AUTO_INCREMENT,
  `dataCriacao` DATETIME NOT NULL,
  `dataViagem` DATE NOT NULL,
  `diasPerman` INT NOT NULL,
  `incluiRestaurante` TINYINT NOT NULL,
  `refeicaoDiaria` INT NULL,
  `servicoAdicional` VARCHAR(45) NULL,
  `valorTotalPacote` DECIMAL(10,2) NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  `Hotel_idHotel` INT NOT NULL,
  `Restaurante_idRestaurante` INT NULL,
  PRIMARY KEY (`idPacoteTurismo`),
  CONSTRAINT `fk_PacoteTurismo_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `Turismo`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PacoteTurismo_Hotel1`
    FOREIGN KEY (`Hotel_idHotel`)
    REFERENCES `Turismo`.`Hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PacoteTurismo_Restaurante1`
    FOREIGN KEY (`Restaurante_idRestaurante`)
    REFERENCES `Turismo`.`Restaurante` (`idRestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`PasseioTuristico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`PasseioTuristico` (
  `idPasseioTuristico` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `valor` DECIMAL NULL,
  `PacoteTurismo_idPacoteTurismo` INT NOT NULL,
  PRIMARY KEY (`idPasseioTuristico`, `PacoteTurismo_idPacoteTurismo`),
  CONSTRAINT `fk_PasseioTuristico_PacoteTurismo1`
    FOREIGN KEY (`PacoteTurismo_idPacoteTurismo`)
    REFERENCES `Turismo`.`PacoteTurismo` (`idPacoteTurismo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
