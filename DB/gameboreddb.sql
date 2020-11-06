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
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `address_id` INT NULL,
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
  `genre_id` INT NULL,
  `category_id` INT NULL,
  `publisher_id` INT NULL,
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
INSERT INTO `address` (`id`, `street`, `city`, `state_abbreviation`, `zip_code`) VALUES (4, '803 Devonshire Lane', 'Hagerstown', 'MD', '21740');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbreviation`, `zip_code`) VALUES (5, '7846 New Saddle Ave', 'Roselle', 'IL', '60172');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbreviation`, `zip_code`) VALUES (6, '7934 Cherry Ave', 'Owatonna', 'MN', '55060');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbreviation`, `zip_code`) VALUES (7, '8 Philmont Drive', 'Roanoke', 'VA', '24012');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (1, 'admin', 'admin', 1, 'ADMIN', 'Alan', 'Moon', 'adminuser@gamebored.com', 1, 'http://www.ibgcafe.com//wp-content/uploads/2016/11/Alan-R-Moon-300x225.jpg', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (2, 'ihasshoulders', 'ihasshoulders', 1, 'user', 'Shoulder', 'Person', 'ihasshoulders@gamebored.com', 2, 'https://images.ctfassets.net/cnu0m8re1exe/4KwrJVfCGeyOKwm8PS2tjI/30026753d97e3b41a50560063126ded8/shutterstock_135114548.jpg?w=650&h=433&fit=fill', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (3, 'disguisedhorse', 'disguisedhorse', 1, 'user', 'Disguised', 'Horse', 'disguisedhorse@gamebored.com', 4, 'https://cdn.vox-cdn.com/thumbor/7M0VT7djnd3jeXmKkdC02cgEH9o=/0x0:5600x3150/1200x675/filters:focal(2649x836:3545x1732)/cdn.vox-cdn.com/uploads/chorus_image/image/65183911/Onyxia_Key_Art.0.jpg', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (4, 'boardgames4life', 'boardgames', 1, 'ADMIN', 'Uber', 'Rex', 'boardgames4life@gamebored.com', 5, 'https://media.wgrz.com/assets/GANNETT/images/073f6a84-4ced-4ff2-9a9d-45a631973322/073f6a84-4ced-4ff2-9a9d-45a631973322_750x422.jpg', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (5, 'gamerlizard', 'gamerlizard', 1, 'user', 'Captain', 'Lizard', 'gamerlizard@gameboard.com', 6, 'https://vertexgraphics.co.uk/wp-content/uploads/LIZARDSPOCK.jpg', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (6, 'ottergirl', 'ottergirl', 1, 'user', 'Ms', 'Otter', 'ottergirl@gamebored.com', 7, 'https://hhltmaine.org/wp-content/uploads/2013/11/River-Otter-image-from-inte.jpg', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (7, 'operationsmaug', 'operationsmaug', 1, 'user', 'Lord', 'Smaug', 'lordsmaug@gamebored.com', NULL, 'https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2013/01/03/100352074-Smaug_2-tolkien.720x405.jpg', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (8, 'dancingdryad', 'dancingdryad', 1, 'user', 'Aspen', 'Rose', 'dancingdryad@gamebored.com', NULL, 'https://vignette.wikia.nocookie.net/lotrfanon/images/d/de/Dryad_by_exellero.jpg/revision/latest/scale-to-width-down/310?cb=20180809192241', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (9, 'tomkinsninja', 'tomkinsninja', 1, 'user', 'Charles', 'Tomkins', 'cdtomkins@gamebored.com', NULL, 'https://i.imgur.com/lixfsa3.jpg', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `address_id`, `profile_image_url`, `bio_description`, `create_date`) VALUES (10, 'snobeebowline', 'snobeebowline', 1, 'user', 'Snow', 'Bell', 'snowbell@gamebored.com', NULL, 'https://geekandsundry.com/wp-content/uploads/2017/09/vex-tess-fowler.jpg', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (1, 'Fantasy', 'Takes place in a world of magic');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (2, 'Medieval', 'Medieval games often have themes or storylines set in Europe or Asia between the 5th century and the 15th century');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (3, 'Industrial', 'Industry / Manufacturing games encourage players to build, manage and/or operate tools and machinery in order to manufacture raw materials into goods and products');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (4, 'Economy', 'Economic games encourage players to develop and manage a system of production, distribution, trade, and/or consumption of goods');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (5, 'Adventure', 'Adventure games often have themes of heroism, exploration, and puzzle-solving');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (6, 'Horror', 'Horror games often contain themes and imagery depicting morbid and supernatural elements');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (7, 'Civilization', 'Civilization games often have players developing and managing a society of people');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (8, 'Medical', 'Medical games have themes related to the science of natural healing');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (9, 'Take That', 'Competitive maneuvers that directly attack an opponent\'s progress toward victory');
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (10, 'Family Fun', 'Suitable for all ages at family get togethers');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Deck Builder', 'Build the deck you\'ll be using to play in turns');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'Area Control', 'Board games with some form of map or board defining a space that players compete to dominate');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'Campaign', 'Board games where the actions and outcome of one senario will usually affect the next');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (4, 'Drafting', 'Players are presented with a set of options from which they must pick one leaving the remainder for the next player to choose from');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (5, 'Eurogame', 'Strategy-focused board games that prioritise limited-randomness over theme. Usually competitive with interaction between players through passive competition rather than aggressive conflict.');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (6, 'Roll and Move', 'Board games where you roll one or more dice and move that many spaces - commonly on a looping track of spaces, or a path with a start and finish');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (7, 'Worker Placement', 'Board games where you choose actions from spaces on the board by assigning your pool of workers');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (8, 'Wargame', 'Players pit armies against each other represented by collections of miniatures or tokens on a map with a grid or actual measured distances for movement');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (9, 'Dexterity', 'Board games involving physical skill, whether using the whole body as in Twister or just the fingers for moving things about, as with removing blocks in Jenga');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (10, 'Roll and Write', 'Roll some dice and decide how to use the outcome, writing it into a personal scoring sheet');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (11, 'Cooperative', 'Players coordinate their actions to achieve a common win condition or conditions. Players all win or lose the game together.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `publisher`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (1, 'Libellud', 'https://cf.geekdo-images.com/j7t0qcxsrH2arhgAMnnbdw__imagepage/img/8iU8eYP2I3GlHvhr9hz232bnJgg=/fit-in/900x600/filters:no_upscale():strip_icc()/pic3868309.jpg', 'French board game publisher founded in 2008, Libellud quickly found success with its first game Dixit');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (2, 'Z-Man Games', 'https://casualgamerevolution.b-cdn.net/sites/default/files/styles/content/public/field/image/2.jpg?itok=3-GLbFun', 'At Z-Man Games, we create innovative games that become modern essentials. Since 1999, our studio has published a variety of critically acclaimed titles from casual to complex, cooperative to competitive, small bag to big box—and everything in between.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (3, 'Days of Wonder', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9d/Days_of_wonder_logo.png/440px-Days_of_wonder_logo.png', 'Days of Wonder consistently raises the bar with an unmatched string of hits that includes Ticket to Ride®, the world\'s best-selling train game; Small World®, the legendary fantasy game of epic conquests; and Memoir \'44®, the World War II saga with 20 expansions to its credit.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (4, 'Bezier Games, Inc.', 'https://cf.geekdo-images.com/sX0o8mg58tABZYuMjjZiYw__imagepage/img/-7dnL_uQZQ9OtgPkFsGT6lZ-2EA=/fit-in/900x600/filters:no_upscale():strip_icc()/pic5197396.jpg', 'Replayability is a hallmark of our games. With more options than you can fit in a single play, you’ll always have new things to try. Castles of Mad King Ludwig allows you to build a different castle every game. Whistle Stop uses the same core rules to play on a different board every time. Our component overkill makes every play new, every time.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (5, 'Fantasy Flight Games', 'https://mlpnk72yciwc.i.optimole.com/cqhiHLc.WqA8~2eefa/w:574/h:405/q:75/https://bleedingcool.com/wp-content/uploads/2020/01/fantasy-flight-games-logo.jpg', 'We publish a massive array of board and card games, roleplaying games, Living Card Games®, miniatures games and digital games.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (6, 'Catan GmbH', 'https://www.catan.com/files/catanlogo_new2_0.png', 'We are part of the entertainment and gaming industry. Today, our primary product is the successful board game CATAN® (formerly The Settlers of Catan®), which comes with an array of expansions, extensions, editions, and spin-offs.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (7, 'Renegade Game Studios', 'https://images.squarespace-cdn.com/content/54148cdae4b05a3412bfa19b/1547681239697-2I9WJ4TW7QOFZX0TE11O/RenegadeLogo_2019_ForDarkBackgrounds_RGB.png?content-type=image%2Fpng', 'Renegade Game Studios mission is to publish games that are fun, challenging, and unique.  We believe that gaming is for everybody and that everybody is a gamer; you may have just not found that right game yet.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (8, 'Space Cowboys', 'https://static.wixstatic.com/media/59baa2_fe106c0eda7a480e9a1135d076a1f274~mv2_d_5016_5051_s_4_2.png/v1/fill/w_112,h_112,al_c,q_85,usm_0.66_1.00_0.01/Logo_SPACE_COWBOYS.webp', '\nTo infinity and beyond!\nSPACE Cowboys is a game publishing studio created in 2014 by industry old-timers. Driven by its first success, Splendor, finalist of the famous Spiel des Jahres, the studio has since accumulated many successful titles.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (9, 'Arcane Wonders', 'https://www.arcanewonders.com/wp-content/themes/arcanewonders/assets/images/arcane-wonders-logo.png', NULL);
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (10, 'Paizo Publishing', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/122012/paizo.png?itok=MgOXvjO-', 'Paizo Inc. is publisher of the award-winning Pathfinder Roleplaying Game, Pathfinder Adventure Card Game, Pathfinder Tales novels, Starfinder science-fantasy roleplaying game, as well as numerous board games and accessories. In the 15+ years since its founding, Paizo has received more than 100 major awards and has grown to become one of the most influential companies in the hobby games industry.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (11, 'Rio Grande Games', 'https://www.riograndegames.com/wp-content/themes/riograndegames/images/rio-grande-games-logo.svg', 'The mission of Rio Grande Games is to promote the playing of games, which offer the players choices. We do so by publishing adult and family strategy games, although children with appropriate parental supervision will enjoy playing many of these games.');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (12, 'Repos Production', 'https://corporate.asmodee.com/smd-content/uploads/2020/01/logo-repos-production-247x300.png', 'Repos Production is a European board game publisher, Belgian to be precise, having started its activity by importing Time\'s Up! in our countries');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (13, 'Hasbro', 'https://e7.pngegg.com/pngimages/945/425/png-clipart-logo-hasbro-toy-brand-nasdaq-has-produce-101-blue-text.png', 'Step into any of our Hasbro offices and you will feel the energy and passion of our employees in areas such as Design, Engineering, Marketing, Finance, IT, Human Resources and other functions, as they work together to bring our mission to life');
INSERT INTO `publisher` (`id`, `name`, `logo_url`, `description`) VALUES (14, 'Cephalofair Games', 'https://www.cephalofair.com/wp-content/uploads/2017/03/Cephalofair-Logo.png', 'A very wise man (well, he had a British accent, so maybe he only seemed wise) once told me long ago that a “cephalofair” was a headless ghost. Maybe it was his British accent, or maybe my memory just got a little fuzzy by the time I latched onto it as a good company name, but he was actually saying the word “cephalophore.”');

COMMIT;


-- -----------------------------------------------------
-- Data for table `board_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (1, 'Seasons', 'Play 12 seasons', 2, 4, 45, 35.99, 1, 1, 1, NULL, 'https://cf.geekdo-images.com/awmZ9rYy-hTgea6Vdp_OoQ__imagepage/img/g9s85mrGdcUm5AWfRSH1GdD0Bts=/fit-in/900x600/filters:no_upscale():strip_icc()/pic1299390.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (2, 'Carcassonne', 'Shape the medieval landscape of France, claiming cities, monasteries and farms', 2, 5, 45, 45.08, 2, 5, 2, NULL, 'https://images.zmangames.com/filer_public/bd/f1/bdf146eb-90f0-43d6-b3c5-a55503c04cbb/zm7810_box_front.png');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (3, 'Ticket To Ride', 'Build your railroad across North America to connect cities and collect tickets!', 2, 5, 60, 44.89, 3, 2, 3, NULL, 'https://ncdn0.daysofwonder.com/tickettoride/en/img/tt-box-296.png');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (4, 'Castles of Mad King Ludwig', 'Choose and play tiles to satisfy the king\'s whims and build the best fantasy castle', 1, 4, 90, 54.95, 2, 5, 4, NULL, 'https://images-na.ssl-images-amazon.com/images/I/81oPItAnpGL._AC_SX466_.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (5, 'Small World', 'Control one fantasy race after another to expand quickly throughout the land', 2, 5, 80, 49.99, 1, 2, 3, NULL, 'https://cf.geekdo-images.com/opengraph/img/H_klqnJiye4r0UmiuK11jaaXv1I=/fit-in/1200x630/filters:strip_icc()/pic428828.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (6, 'Merchants and Marauders', 'Live the life of an influential merchant or a dreaded pirate in the Caribbean', 2, 4, 180, 49.97, 4, 8, 2, NULL, 'https://images.zmangames.com/filer_public/f7/a9/f7a96814-6943-4825-90ef-99383404089b/zm7062_box-front.png');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (7, 'Runebound', 'Adventure and gain life experience until you can beat the Dragon!', 2, 6, 240, 64.59, 5, 3, 5, NULL, 'https://cf.geekdo-images.com/Zo4slt6oCCOFamxoR1ExcQ__imagepage/img/_hcTFNnN_csT_aknezns2DgZ6GE=/fit-in/900x600/filters:no_upscale():strip_icc()/pic2625790.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (8, 'Catan', 'Collect and trade resources to build up the island of Catan in this modern classic', 3, 4, 120, 43.97, 4, 7, 6, NULL, 'https://cf.geekdo-images.com/W3Bsga_uLP9kO91gZ7H8yw__imagepage/img/M_3Vg1j2HlNgkv7PL2xl2BJE2bw=/fit-in/900x600/filters:no_upscale():strip_icc()/pic2419375.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (9, 'Clank!', 'Claim your treasures but don\'t attract the dragon in this deck-building dungeon race', 2, 5, 60, 60.22, 1, 1, 7, NULL, 'https://cf.geekdo-images.com/DPjV1iI0ygo5Bl3XLNRiIg__imagepage/img/R9z8w4GndbY-r3fG_LK1LvBvLc0=/fit-in/900x600/filters:no_upscale():strip_icc()/pic4449526.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (10, 'Pandemic', 'Your team of experts must prevent the world from succumbing to a viral pandemic', 2, 4, 45, 42.07, 8, 3, 2, NULL, 'https://cf.geekdo-images.com/S3ybV1LAp-8SnHIXLLjVqA__imagepage/img/kIBu-2Ljb_ml5n-S8uIbE6ehGFc=/fit-in/900x600/filters:no_upscale():strip_icc()/pic1534148.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (11, '7 Wonders', 'You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes and affirm your military supremacy', 2, 7, 30, 45.99, 7, 4, 12, NULL, 'https://images-na.ssl-images-amazon.com/images/I/611O0iEzPPL._AC_SX425_.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (12, 'Monopoly', 'Buy properties, trade for sets, build houses, and run everyone else out of the game', 2, 8, 180, 19.99, 9, 6, 13, NULL, 'https://media.kohlsimg.com/is/image/kohls/3012864?wid=1200&hei=1200&op_sharpen=1');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (13, 'Jenga', 'Jenga is a game of physical skill created by British board game designer and author Leslie Scott, and currently marketed by Hasbro', 1, 8, 20, 12.99, 9, 9, 13, NULL, 'https://jenga.com/images/jengagame.png');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (14, 'Yatzee', 'Yes the dice are fickle, but score your combos strategically to max out on points', 2, 10, 30, 7.99, 10, 10, 13, NULL, 'https://images-na.ssl-images-amazon.com/images/I/61ov9uJv78L._AC_SY450_.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (15, 'Arkham Horror', 'Work as a team to save the town of Arkham from monsters and a Great Old One.', 1, 8, 240, 69.99, 6, 11, 5, NULL, 'https://cf.geekdo-images.com/9cJf4kd_HZQo6NunfJlo9w__imagepage/img/4fGg2gHz6qyElFGShhz5LOUjxuU=/fit-in/900x600/filters:no_upscale():strip_icc()/pic175966.jpg');
INSERT INTO `board_game` (`id`, `name`, `description`, `min_players`, `max_players`, `play_time_minutes`, `cost`, `genre_id`, `category_id`, `publisher_id`, `logo_url`, `box_art_url`) VALUES (16, 'Gloomhaven', 'Vanquish monsters with strategic cardplay. Fulfill your quest to leave your legacy', 1, 4, 120, 125.99, 5, 3, 14, NULL, 'https://images-na.ssl-images-amazon.com/images/I/81crhhZd63L._AC_SL1500_.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_board_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (1, 1);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (1, 3);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (1, 7);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (1, 8);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (1, 13);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (2, 4);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (2, 5);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (2, 7);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (2, 8);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (2, 16);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (3, 2);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (3, 4);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (3, 6);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (3, 9);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (3, 14);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (5, 1);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (5, 2);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (5, 11);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (5, 15);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (5, 16);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (6, 5);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (6, 6);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (6, 11);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (6, 12);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (6, 13);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (7, 4);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (7, 7);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (7, 8);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (7, 10);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (7, 15);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (7, 16);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (8, 5);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (8, 7);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (8, 4);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (8, 10);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (9, 2);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (9, 4);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (9, 11);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (10, 12);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (10, 13);
INSERT INTO `favorite_board_game` (`user_id`, `board_game_id`) VALUES (10, 9);

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
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (2, NULL, 'Anyone want to play this? I love to use the farmer expansion', 10, 2);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (3, NULL, 'Oh? Are you one of those that ends up stealing lots of points in the end, while no one notices? ', 8, 2);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (4, NULL, 'Pshhh...No...It\'s a completely legitimate strategy!', 10, 2);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (5, NULL, 'Thanks, I\'ll pass though. Haha Unless you want to throw the river in, then I\'d be down.', 8, 2);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (6, NULL, 'Hey snobee I see you love this game too. Do you know anyone who owns it that we could play with?', 3, 9);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (7, NULL, 'No, I wish. It\'s on my list for next games to buy. I played it at a convention once and it was a blast.', 10, 9);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (8, NULL, 'Does anyone still play this game, or did enough older brothers torture everyone that it\'s no longer liked? ', 7, 12);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (9, NULL, 'Hey! I love this game! It does remind me of playing board games with my family when I was young though.', 10, 12);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (10, NULL, 'I love it too! Gotta love getting that extra money when you pass go!', 6, 12);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (11, NULL, 'I bought this game in February, ironically right before the lockdown', 2, 10);
INSERT INTO `board_game_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `board_game_id`) VALUES (12, NULL, 'Good timing. Heh. At least you had something to keep you busy.', 7, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `community_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `gameboreddb`;
INSERT INTO `community_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `in_reply_to_id`) VALUES (1, '2020-10-10 12:30:16', 'I love board games!!', 1, NULL);
INSERT INTO `community_comment` (`id`, `comment_date`, `comment_text`, `user_id`, `in_reply_to_id`) VALUES (2, '2020-10-15 01:24:07', 'You and me both', 9, NULL);

COMMIT;

