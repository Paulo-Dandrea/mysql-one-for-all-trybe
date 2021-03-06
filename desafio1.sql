-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `valor_plano` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`plano_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
    CONSTRAINT `fk_usuario_plano1`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`plano` (`plano_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `cancoes_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`cancoes_id`),
    CONSTRAINT `fk_cancoes_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`album_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_de_reproducoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducoes` (
  `usuario_id` INT NOT NULL,
  `cancoes_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancoes_id`),
    CONSTRAINT `fk_historico_de_reproducoes_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`),
  CONSTRAINT `fk_historico_de_reproducoes_cancoes1`
    FOREIGN KEY (`cancoes_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancoes_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguindo_artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
    CONSTRAINT `fk_seguindo_artistas_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`),
  CONSTRAINT `fk_seguindo_artistas_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`))
ENGINE = InnoDB;


INSERT INTO plano(name, valor_plano) VALUES
('gratuito', 0.00),
('universit??rio', 5.99),
('familiar', 7.99);

INSERT INTO usuario(name, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artista(name) VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO album(name, artista_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes(name, album_id) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
("Sweetie, Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO historico_de_reproducoes(usuario_id, cancoes_id) VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);

INSERT INTO seguindo_artistas(usuario_id, artista_id) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
