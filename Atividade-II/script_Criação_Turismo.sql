-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema turismo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema turismo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `turismo` DEFAULT CHARACTER SET utf8 ;
USE `turismo` ;

-- -----------------------------------------------------
-- Table `turismo`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismo`.`cidade` (
  `idCidade` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `Estado` VARCHAR(45) NULL DEFAULT NULL,
  `Website` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCidade`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `turismo`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismo`.`hotel` (
  `idHotel` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `ValorDiaria` DECIMAL(10,2) NULL DEFAULT NULL,
  `Cidade_idCidade` INT(11) NOT NULL,
  PRIMARY KEY (`idHotel`),
  CONSTRAINT `fk_Hotel_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `turismo`.`cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `turismo`.`restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismo`.`restaurante` (
  `idRestaurante` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `ValorRefeicao` DECIMAL(10,2) NULL DEFAULT NULL,
  `Cidade_idCidade` INT(11) NOT NULL,
  PRIMARY KEY (`idRestaurante`),
  CONSTRAINT `fk_Restaurante_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `turismo`.`cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `turismo`.`pacoteturismo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismo`.`pacoteturismo` (
  `idPacoteTurismo` INT(11) NOT NULL AUTO_INCREMENT,
  `dataCriacao` DATETIME NOT NULL,
  `dataViagem` DATE NOT NULL,
  `diasPerman` INT(11) NOT NULL,
  `incluiRestaurante` TINYINT(4) NOT NULL,
  `refeicaoDiaria` INT(11) NULL DEFAULT NULL,
  `servicoAdicional` VARCHAR(45) NULL DEFAULT NULL,
  `valorTotalPacote` DECIMAL(10,2) NOT NULL,
  `Cidade_idCidade` INT(11) NOT NULL,
  `Hotel_idHotel` INT(11) NOT NULL,
  `Restaurante_idRestaurante` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPacoteTurismo`),
  CONSTRAINT `fk_PacoteTurismo_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `turismo`.`cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PacoteTurismo_Hotel1`
    FOREIGN KEY (`Hotel_idHotel`)
    REFERENCES `turismo`.`hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PacoteTurismo_Restaurante1`
    FOREIGN KEY (`Restaurante_idRestaurante`)
    REFERENCES `turismo`.`restaurante` (`idRestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `turismo`.`passeioturistico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismo`.`passeioturistico` (
  `idPasseioTuristico` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  `valor` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`idPasseioTuristico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Pacote_passeio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turismo`.`Pacote_passeio` (
  `pacoteturismo_idPacoteTurismo` INT(11) NOT NULL,
  `passeioturistico_idPasseioTuristico` INT(11) NOT NULL,
  PRIMARY KEY (`pacoteturismo_idPacoteTurismo`, `passeioturistico_idPasseioTuristico`),
  CONSTRAINT `fk_Pacote_passeio_pacoteturismo`
    FOREIGN KEY (`pacoteturismo_idPacoteTurismo`)
    REFERENCES `turismo`.`pacoteturismo` (`idPacoteTurismo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacote_passeio_passeioturistico1`
    FOREIGN KEY (`passeioturistico_idPasseioTuristico`)
    REFERENCES `turismo`.`passeioturistico` (`idPasseioTuristico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `turismo`.`pacotes_turisticos_alterados` (
    `PacoteTuristicoID` INT(11),
    `CampoAlterado` VARCHAR(255),
    `ValorAntigo` DECIMAL(10, 2),
    `ValorNovo` DECIMAL(10, 2),
    `Usuario` VARCHAR(255),
    `DataAlteracao` DATETIME
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
