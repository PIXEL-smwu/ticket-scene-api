-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TicketScene
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TicketScene
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TicketScene` DEFAULT CHARACTER SET utf8 ;
USE `TicketScene` ;

-- -----------------------------------------------------
-- Table `TicketScene`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketScene`.`User` (
  `id` INT NOT NULL,
  `email` VARCHAR(320) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `badges` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TicketScene`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketScene`.`Movie` (
  `movieCd` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `openDt` YEAR(4) NULL,
  `rating` FLOAT NULL,
  `imgUrl` VARCHAR(100) NULL,
  `director` VARCHAR(45) NULL,
  `actor` VARCHAR(45) NULL,
  `genre` VARCHAR(45) NULL,
  PRIMARY KEY (`movieCd`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TicketScene`.`UserMovie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketScene`.`UserMovie` (
  `userId` INT NOT NULL,
  `movieCd` INT NOT NULL,
  `selectType` CHAR(4) NULL DEFAULT 'want',
  INDEX `movieCd_idx` (`movieCd` ASC) VISIBLE,
  INDEX `fk_UserMovie_User1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_UserMovie_Movie1`
    FOREIGN KEY (`movieCd`)
    REFERENCES `TicketScene`.`Movie` (`movieCd`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_UserMovie_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `TicketScene`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TicketScene`.`UserTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketScene`.`UserTicket` (
  `ticketId` VARCHAR(45) NOT NULL,
  `userId` INT NOT NULL,
  `movieCd` INT NOT NULL,
  `date` DATE NULL,
  `bgImg` VARCHAR(100) NULL,
  INDEX `fk_UserTicket_User1_idx` (`userId` ASC) VISIBLE,
  PRIMARY KEY (`ticketId`),
  INDEX `fk_UserTicket_Movie1_idx` (`movieCd` ASC) VISIBLE,
  CONSTRAINT `fk_UserTicket_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `TicketScene`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_UserTicket_Movie1`
    FOREIGN KEY (`movieCd`)
    REFERENCES `TicketScene`.`Movie` (`movieCd`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TicketScene`.`UserRelationship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketScene`.`UserRelationship` (
  `user1` INT NOT NULL,
  `user2` INT NOT NULL,
  `relationship` CHAR(6) NULL COMMENT '1requested2\n2requested1\n1blocked2\n2blocked1\nfriends',
  PRIMARY KEY (`user1`, `user2`),
  INDEX `fk_User_has_User_User2_idx` (`user2` ASC) VISIBLE,
  INDEX `fk_User_has_User_User1_idx` (`user1` ASC) VISIBLE,
  CONSTRAINT `fk_UserRelationship_User1`
    FOREIGN KEY (`user1`)
    REFERENCES `TicketScene`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_UserRelationship_User2`
    FOREIGN KEY (`user2`)
    REFERENCES `TicketScene`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
