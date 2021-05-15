-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema VirtualStore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema VirtualStore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VirtualStore` DEFAULT CHARACTER SET utf8 ;
USE `VirtualStore` ;

-- -----------------------------------------------------
-- Table `VirtualStore`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VirtualStore`.`provider` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `cnpj` CHAR(18) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(11) NOT NULL,
  `representativeName` VARCHAR(50) NOT NULL,
  `representativePhone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VirtualStore`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VirtualStore`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(80) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VirtualStore`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VirtualStore`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(70) NOT NULL,
  `value` DOUBLE NOT NULL,
  `stockQuantity` INT NOT NULL,
  `photo` VARCHAR(250) NULL,
  `provider_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`, `provider_id`, `category_id`),
  FOREIGN KEY (`provider_id`)
  REFERENCES `VirtualStore`.`provider` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`category_id`)
  REFERENCES `VirtualStore`.`category` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VirtualStore`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VirtualStore`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `phone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VirtualStore`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VirtualStore`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(50) NOT NULL,
  `number` VARCHAR(8) NOT NULL,
  `neighborhood` VARCHAR(40) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`, `client_id`),
  FOREIGN KEY (`client_id`)
  REFERENCES `VirtualStore`.`client` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
