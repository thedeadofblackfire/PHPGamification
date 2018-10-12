-- MySQL Script generated by MySQL Workbench
-- Mon Sep  7 19:49:25 2015
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `gm_user_alerts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_user_alerts` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` INT(11) UNSIGNED NOT NULL,
  `id_badge` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_level` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_user` (`id_user` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gm_user_badges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_user_badges` (
  `id_user` INT(11) UNSIGNED NOT NULL,
  `id_badge` INT(10) UNSIGNED NOT NULL,
  `id_event` INT(10) UNSIGNED NOT NULL,
  `badges_counter` INT(10) UNSIGNED NOT NULL,
  `grant_date` DATETIME NOT NULL,
  PRIMARY KEY (`id_user`, `id_badge`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gm_user_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_user_events` (
  `id_user` INT(11) UNSIGNED NOT NULL,
  `id_event` INT(10) UNSIGNED NOT NULL,
  `event_counter` INT(10) UNSIGNED NOT NULL,
  `points_counter` INT(10) UNSIGNED NOT NULL default '0',
  PRIMARY KEY (`id_user`, `id_event`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gm_user_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_user_logs` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` INT(11) UNSIGNED NOT NULL,
  `id_event` INT(10) UNSIGNED NULL DEFAULT NULL,
  `event_date` DATETIME NOT NULL,
  `id_badge` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_level` INT(10) UNSIGNED NULL DEFAULT NULL,
  `points` INT(10) UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
  INDEX `id_user` (`id_user` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gm_user_scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_user_scores` (
  `id_user` INT(11) UNSIGNED NOT NULL,
  `points` INT(10) UNSIGNED NOT NULL,
  `id_level` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gm_badges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_badges` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `alias` VARCHAR(32) NOT NULL,
  `title` VARCHAR(64) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(96) NULL,
  `custom_image` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gm_levels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_levels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(64) NOT NULL,
  `description` TEXT NULL,
  `points` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gm_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gm_events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `alias` VARCHAR(32) NOT NULL,
  `description` TEXT NULL,
  `allow_repetitions` TINYINT(1) NULL DEFAULT 1,
  `reach_required_repetitions` INT NULL,
  `max_points` INT NULL,
  `id_each_badge` INT NULL COMMENT '	',
  `id_reach_badge` INT NULL,
  `each_points` INT NULL,
  `reach_points` INT NULL,
  `each_callback` VARCHAR(64) NULL,
  `reach_callback` VARCHAR(64) NULL,
`multiple_reach_required_repetitions` TEXT NULL,
    `combinable` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'event_callback';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
