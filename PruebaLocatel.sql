-- MySQL Script generated by MySQL Workbench
-- Sat Jun  4 11:25:04 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PruebaLocatel
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PruebaLocatel` ;

-- -----------------------------------------------------
-- Schema PruebaLocatel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PruebaLocatel` DEFAULT CHARACTER SET utf8 ;
USE `PruebaLocatel` ;

-- -----------------------------------------------------
-- Table `PruebaLocatel`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PruebaLocatel`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `PruebaLocatel`.`Usuario` (
  `iIDUsuario` INT NOT NULL AUTO_INCREMENT,
  `tAliasUsuario` VARCHAR(100) NOT NULL,
  `tPassword` VARCHAR(200) NOT NULL,
  `tNombreUsuario` VARCHAR(400) NOT NULL,
  `bActivo` BOOLEAN NOT NULL,
  PRIMARY KEY (`iIDUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PruebaLocatel`.`Cuenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PruebaLocatel`.`Cuenta` ;

CREATE TABLE IF NOT EXISTS `PruebaLocatel`.`Cuenta` (
  `iIDCuenta` INT NOT NULL AUTO_INCREMENT,
  `iValorInicial` INT NOT NULL,
  `DSaldo` DECIMAL(50,2) NOT NULL,
  `DNumeroCuenta` DECIMAL(30,0) NOT NULL,
  `bActivo` BOOLEAN NOT NULL,
  `Usuario_iIDUsuario` INT NOT NULL,
  PRIMARY KEY (`iIDCuenta`, `Usuario_iIDUsuario`,`DNumeroCuenta`),
  INDEX `fk_Cuenta_Usuario1_idx` (`Usuario_iIDUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Cuenta_Usuario1`
    FOREIGN KEY (`Usuario_iIDUsuario`)
    REFERENCES `PruebaLocatel`.`Usuario` (`iIDUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PruebaLocatel`.`Movimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PruebaLocatel`.`Movimiento` ;

CREATE TABLE IF NOT EXISTS `PruebaLocatel`.`Movimiento` (
  `iIDMovimiento` INT NOT NULL AUTO_INCREMENT,
  `dValorMovimiento` DECIMAL(40,2) NOT NULL,
  `tTipoMovimiento` VARCHAR(50) NOT NULL,
  `bActivo` BOOLEAN NOT NULL,
  `Cuenta_iIDCuenta` INT NOT NULL,
  PRIMARY KEY (`iIDMovimiento`, `Cuenta_iIDCuenta`),
  INDEX `fk_Movimiento_Cuenta1_idx` (`Cuenta_iIDCuenta` ASC) VISIBLE,
  CONSTRAINT `fk_Movimiento_Cuenta1`
    FOREIGN KEY (`Cuenta_iIDCuenta`)
    REFERENCES `PruebaLocatel`.`Cuenta` (`iIDCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into usuario(`tAliasUsuario`,
  `tPassword`,
  `tNombreUsuario`,
  `bActivo`) values("Josele2015","Josele2015","Herman José García Pacheco",true);

insert into Usuario (
  `tAliasUsuario` ,
  `tPassword` ,
  `tNombreUsuario` ,
  `bActivo`) values("Josele2015","Josele2015","Herman Jose Garcia Pacheco",true);

insert into Cuenta (`iValorInicial`,
`DSaldo`,
`DNumeroCuenta`,
`bActivo`,
`Usuario_iIDUsuario`) 
  values(2000000,'2000000.00','1020782211',true,1);

insert into Cuenta values(1,2000000,'2000000.00',"1020782031",true,1);
insert into Cuenta values(1,2000000,'2000000.00','8166332136',true,1);
    
insert into Movimiento(`dValorMovimiento`,
  `tTipoMovimiento`,
  `bActivo`,
  `Cuenta_iIDCuenta`) values('2000000.00',"Consignación",true,1);
    