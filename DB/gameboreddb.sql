-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gameboreddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gameboreddb` ;

-- -----------------------------------------------------
-- Schema gameboreddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameboreddb` DEFAULT CHARACTER SET utf8 ;
USE `gameboreddb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_abbreviation` CHAR(2) NULL,
  `zip_code` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL DEFAULT 'user',
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `address_id` INT NOT NULL,
  `profile_image_url` VARCHAR(5000) NULL,
  `bio_description` TEXT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publisher` ;

CREATE TABLE IF NOT EXISTS `publisher` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `logo_url` VARCHAR(5000) NULL,
  `description` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `board_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `board_game` ;

CREATE TABLE IF NOT EXISTS `board_game` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(5000) NULL,
  `min_players` INT NOT NULL,
  `max_players` INT NULL,
  `play_time_minutes` INT NULL,
  `cost` DECIMAL(9,2) NULL,
  `genre_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `publisher_id` INT NOT NULL,
  `logo_url` VARCHAR(5000) NULL,
  `box_art_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_game_genre1_idx` (`genre_id` ASC),
  INDEX `fk_board_game_category1_idx` (`category_id` ASC),
  INDEX `fk_board_game_publisher1_idx` (`publisher_id` ASC),
  CONSTRAINT `fk_board_game_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_game_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_game_publisher1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_board_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_board_game` ;

CREATE TABLE IF NOT EXISTS `favorite_board_game` (
  `user_id` INT NOT NULL,
  `board_game_id` INT NOT NULL,
  INDEX `fk_favorite_board_game_board_game1_idx` (`board_game_id` ASC),
  PRIMARY KEY (`user_id`, `board_game_id`),
  CONSTRAINT `fk_favorite_board_game_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_board_game_board_game1`
    FOREIGN KEY (`board_game_id`)
    REFERENCES `board_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `board_game_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `board_game_category` ;

CREATE TABLE IF NOT EXISTS `board_game_category` (
  `category_id` INT NOT NULL,
  `board_game_id` INT NOT NULL,
  INDEX `fk_board_game_category_category1_idx` (`category_id` ASC),
  INDEX `fk_board_game_category_board_game1_idx` (`board_game_id` ASC),
  CONSTRAINT `fk_board_game_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_game_category_board_game1`
    FOREIGN KEY (`board_game_id`)
    REFERENCES `board_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meetup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meetup` ;

CREATE TABLE IF NOT EXISTS `meetup` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `address_id` INT NOT NULL,
  `board_game_id` INT NOT NULL,
  `meetup_date` DATE NOT NULL,
  `start_time` TIME NOT NULL,
  `user_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meetup_address1_idx` (`address_id` ASC),
  INDEX `fk_meetup_board_game1_idx` (`board_game_id` ASC),
  INDEX `fk_meetup_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_meetup_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meetup_board_game1`
    FOREIGN KEY (`board_game_id`)
    REFERENCES `board_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meetup_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owned_board_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `owned_board_game` ;

CREATE TABLE IF NOT EXISTS `owned_board_game` (
  `user_id` INT NOT NULL,
  `board_game_id` INT NOT NULL,
  INDEX `fk_owned_board_game_user1_idx` (`user_id` ASC),
  INDEX `fk_owned_board_game_board_game1_idx` (`board_game_id` ASC),
  PRIMARY KEY (`user_id`, `board_game_id`),
  CONSTRAINT `fk_owned_board_game_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_owned_board_game_board_game1`
    FOREIGN KEY (`board_game_id`)
    REFERENCES `board_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `board_game_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `board_game_genre` ;

CREATE TABLE IF NOT EXISTS `board_game_genre` (
  `board_game_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  INDEX `fk_board_game_genre_board_game1_idx` (`board_game_id` ASC),
  INDEX `fk_board_game_genre_genre1_idx` (`genre_id` ASC),
  CONSTRAINT `fk_board_game_genre_board_game1`
    FOREIGN KEY (`board_game_id`)
    REFERENCES `board_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_game_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meetup_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meetup_has_user` ;

CREATE TABLE IF NOT EXISTS `meetup_has_user` (
  `meetup_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`meetup_id`, `user_id`),
  INDEX `fk_meetup_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_meetup_has_user_meetup1_idx` (`meetup_id` ASC),
  CONSTRAINT `fk_meetup_has_user_meetup1`
    FOREIGN KEY (`meetup_id`)
    REFERENCES `meetup` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meetup_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `board_game_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `board_game_comment` ;

CREATE TABLE IF NOT EXISTS `board_game_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_date` DATETIME NULL,
  `comment_text` TEXT NULL,
  `user_id` INT NOT NULL,
  `board_game_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_game_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_board_game_comment_board_game1_idx` (`board_game_id` ASC),
  CONSTRAINT `fk_board_game_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_game_comment_board_game1`
    FOREIGN KEY (`board_game_id`)
    REFERENCES `board_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `community_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `community_comment` ;

CREATE TABLE IF NOT EXISTS `community_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_date` DATETIME NULL,
  `comment_text` TEXT NULL,
  `user_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_community_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_community_comment_community_comment1_idx` (`in_reply_to_id` ASC),
  CONSTRAINT `fk_community_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_community_comment_community_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `community_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS gameboreduser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'gameboreduser'@'localhost' IDENTIFIED BY 'gameboreduser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'gameboreduser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `address` (`id`, `street`, `city`, `state_abbreviation`, `zip_code`) VALUES (1, '123 Sesame St', 'Aurora', 'CO', '80013');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbreviation`, `zip_code`) VALUES (2, '808 Rainbow Road', 'Denver', 'CO', '80203');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbreviation`, `zip_code`) VALUES (3, '5150 Park Place', 'Aurora', 'CO', '80013');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (1, 'admin', 'admin', 1, 'ADMIN', 'Game', 'Bored', 'adminuser@gamebored.com', 1, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (2, 'ihasshoulders', 'ihasshoulders', 1, 'user', 'Shoulder', 'Person', 'ihasshoulders@gamebored.com', 2, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (1, 'Fantasy', 'Takes place in a world of magic');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Deck Builder', 'Build the deck you\'ll be using to play in turns');

COMMIT;


-- -----------------------------------------------------
-- Data for table `publisher`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (1, 'Libellud', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `board_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (1, 'Seasons', 'Play 12 seasons', 2, 4, 45, 35.99, 1, 1, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_board_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meetup`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `meetup` (`id`, `title`, `description`, `address_id`, `board_game_id`, `meetup_date`, `start_time`, `user_id`, `create_date`) VALUES (1, 'Games at the Park', 'Play games at the park', 3, 1, '2020-10-10', '12:00:00', 1, '2020-10-10 10:10:10');

COMMIT;


-- -----------------------------------------------------
-- Data for table `owned_board_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `owned_board_game` (`user_id`, `board_game_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meetup_has_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `meetup_has_user` (`meetup_id`, `user_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `board_game_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (1, '2020-10-30 12:30:16', 'This game is good with some houserules', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `community_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `community_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `in_reply_to_id`) VALUES (1, '2020-10-10 12:30:16', 'I love board games!!', 1, NULL);

COMMIT;

