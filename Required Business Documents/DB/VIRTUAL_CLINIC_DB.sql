-- Initial VIRTUAL_CLINIC Database script
-- 03/07/2020 
-- updates on schema to be added in incremental sql scripts

SET SQL_SAFE_UPDATES=0;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema VIRTUAL_CLINIC
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `VIRTUAL_CLINIC`;
CREATE SCHEMA IF NOT EXISTS `VIRTUAL_CLINIC` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `VIRTUAL_CLINIC` ;


-- -----------------------------------------------------
-- Table `VIRTUAL_CLINIC`.`USER_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VIRTUAL_CLINIC`.`USER_TYPE` (
  `ID` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_TYPE` VARCHAR(50) NOT NULL,
  `DESCRIPTION` VARCHAR(50) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `VIRTUAL_CLINIC`.`SPECIALITY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VIRTUAL_CLINIC`.`SPECIALITY` (
  `ID` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `SPECIALITY_NAME` VARCHAR(50) NOT NULL,
  `DESCRIPTION` VARCHAR(50) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VIRTUAL_CLINIC`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VIRTUAL_CLINIC`.`USER` (
  `ID` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(100) NOT NULL,
  `EMAIL` VARCHAR(100) NOT NULL,
  `CIVIL_ID` VARCHAR(50) NOT NULL,
  `PASSWORD` VARCHAR(250) NOT NULL,
  `USER_TYPE_ID` INT(8) UNSIGNED NOT NULL,
  `PHONE_NUM` VARCHAR(20)  NULL,
  `AGE`  INT(5) NULL,
  `ADDRESS` VARCHAR(100) NULL,  
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_USER_TYPE` FOREIGN KEY (`USER_TYPE_ID`) REFERENCES `VIRTUAL_CLINIC`.`USER_TYPE` (`ID`)
    ON DELETE CASCADE  ON UPDATE CASCADE 
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `VIRTUAL_CLINIC`.`DOCTOR_DETAILS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VIRTUAL_CLINIC`.`DOCTOR_DETAILS` (
  `ID` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_ID` INT(8) UNSIGNED NOT NULL,
  `SPECIALITY_ID` INT(8) UNSIGNED NOT NULL,
  `IMAGE` LONGBLOB  NULL,
  PRIMARY KEY (`ID`), 
  CONSTRAINT `fk_USER_DOCTOR` FOREIGN KEY (`USER_ID`) REFERENCES `VIRTUAL_CLINIC`.`USER` (`ID`)
    ON DELETE CASCADE  ON UPDATE CASCADE ,
  CONSTRAINT `fk_USER_DOCTOR_SPECIALITY` FOREIGN KEY (`SPECIALITY_ID`) REFERENCES `VIRTUAL_CLINIC`.`SPECIALITY` (`ID`)
    ON DELETE CASCADE  ON UPDATE CASCADE 
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `VIRTUAL_CLINIC`.`DOCOTR_SLOTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VIRTUAL_CLINIC`.`DOCOTR_SLOTS` (
  `ID` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_ID` INT(8) UNSIGNED NOT NULL,
  `FREE_DATE` DATE NOT NULL,
  `FREE_TIME` TIMESTAMP NOT NULL, 
  `RESERVED`  CHAR(1) NULL DEFAULT 'N',
  `IS_CLOSED` CHAR(1) NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_DOCTOR_SLOTS_USER` FOREIGN KEY (`USER_ID`) REFERENCES `VIRTUAL_CLINIC`.`USER` (`ID`)
    ON DELETE CASCADE  ON UPDATE CASCADE 
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `VIRTUAL_CLINIC`.`APPOINTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VIRTUAL_CLINIC`.`APPOINTMENT` (
  `ID` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PATIENT_ID` INT(8) UNSIGNED NOT NULL,
  `DOCTOR_ID` INT(8) UNSIGNED NOT NULL,
  `APP_DATE` DATE NOT NULL,
  `APP_TIME` TIMESTAMP NOT NULL,
  `APP_STATUS` VARCHAR(50) NOT NULL, -- ---{ CONFIRMED , DONE , CANCELED } 
  `PRESCRIPTION` VARCHAR(250) NULL, 
  `PRESCRIPTION_DELIVERED` CHAR(1) NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_APPOINTMENT_PATIENT_USER` FOREIGN KEY (`PATIENT_ID`) REFERENCES `VIRTUAL_CLINIC`.`USER` (`ID`)
    ON DELETE CASCADE  ON UPDATE CASCADE ,
  CONSTRAINT `fk_APPOINTMENT_DOCTOR_USER` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `VIRTUAL_CLINIC`.`USER` (`ID`)
    ON DELETE CASCADE  ON UPDATE CASCADE 
)ENGINE = InnoDB;


-- ---------------------------------------------
-- Insert into Speciality Table ---------------

INSERT INTO `virtual_clinic`.`speciality` (`SPECIALITY_NAME`, `DESCRIPTION`) VALUES ('Surgery', 'Surgery Doctor');
INSERT INTO `virtual_clinic`.`speciality` (`SPECIALITY_NAME`, `DESCRIPTION`) VALUES ('ENT', 'ENT Doctor');
INSERT INTO `virtual_clinic`.`speciality` (`SPECIALITY_NAME`, `DESCRIPTION`) VALUES ('General Medicen', 'General Medecin Doctor');
INSERT INTO `virtual_clinic`.`speciality` (`SPECIALITY_NAME`, `DESCRIPTION`) VALUES ('Family Medicin', 'Family Medicin Doctor');
INSERT INTO `virtual_clinic`.`speciality` (`SPECIALITY_NAME`, `DESCRIPTION`) VALUES ('Opthalmology', 'Opthalmology Doctor');
INSERT INTO `virtual_clinic`.`speciality` (`SPECIALITY_NAME`, `DESCRIPTION`) VALUES ('Chest', 'Checst Doctor');
INSERT INTO `virtual_clinic`.`speciality` (`SPECIALITY_NAME`, `DESCRIPTION`) VALUES ('Dermatology', 'Dermatology Doctor');

-- ----------------------------------------------
-- Insert into User Type ------------------------
INSERT INTO `virtual_clinic`.`user_type` (`USER_TYPE`, `DESCRIPTION`) VALUES ('Patient', 'Patient');
INSERT INTO `virtual_clinic`.`user_type` (`USER_TYPE`, `DESCRIPTION`) VALUES ('Doctor', 'Doctor');
INSERT INTO `virtual_clinic`.`user_type` (`USER_TYPE`, `DESCRIPTION`) VALUES ('MOH(Admin)', 'MOH(Admin)');

-- -----------------------------------


