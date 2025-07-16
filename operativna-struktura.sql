CREATE DATABASE IF NOT EXISTS `audio_snimci_operativna`;
USE `audio_snimci_operativna`;

DROP TABLE IF EXISTS `mesto`;
CREATE TABLE `mesto` (
  `IdMes` int NOT NULL AUTO_INCREMENT,
  `Mesto` varchar(45) DEFAULT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdMes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE `korisnik` (
  `IdKor` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Godiste` int DEFAULT NULL,
  `Pol` varchar(45) DEFAULT NULL,
  `IdMes` int NOT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdKor`),
  KEY `FK_IdMes_idx` (`IdMes`),
  CONSTRAINT `FK_Korisnik_IdMes` FOREIGN KEY (`IdMes`) REFERENCES `mesto` (`IdMes`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `kategorija`;
CREATE TABLE `kategorija` (
  `IdKat` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) DEFAULT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdKat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `audio`;
CREATE TABLE `audio` (
  `IdAud` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) DEFAULT NULL,
  `Trajanje` int DEFAULT NULL,
  `IdKor` int NOT NULL,
  `Datum` date DEFAULT NULL,
  `Vreme` time DEFAULT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdAud`),
  KEY `FK_IdKor_idx` (`IdKor`),
  CONSTRAINT `FK_Audio_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `audio_kategorija`;
CREATE TABLE `audio_kategorija` (
  `IdAud` int NOT NULL,
  `IdKat` int NOT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdAud`,`IdKat`),
  KEY `FK_IdKat_idx` (`IdKat`),
  CONSTRAINT `FK_AudioKategorija_IdAud` FOREIGN KEY (`IdAud`) REFERENCES `audio` (`IdAud`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_AudioKategorija_IdKat` FOREIGN KEY (`IdKat`) REFERENCES `kategorija` (`IdKat`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `paket`;
CREATE TABLE `paket` (
  `IdPak` int NOT NULL AUTO_INCREMENT,
  `MesecnaCena` int DEFAULT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdPak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `pretplata`;
CREATE TABLE `pretplata` (
  `IdPre` int NOT NULL AUTO_INCREMENT,
  `IdKor` int NOT NULL,
  `IdPak` int NOT NULL,
  `Datum` date DEFAULT NULL,
  `Vreme` time DEFAULT NULL,
  `PlacenaCena` int DEFAULT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdPre`),
  KEY `FK_IdKor_idx` (`IdKor`),
  KEY `FK_IdPak_idx` (`IdPak`),
  CONSTRAINT `FK_Pretplata_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Pretplata_IdPak` FOREIGN KEY (`IdPak`) REFERENCES `paket` (`IdPak`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `slusanje`;
CREATE TABLE `slusanje` (
  `IdSlu` int NOT NULL AUTO_INCREMENT,
  `IdAud` int NOT NULL,
  `IdKor` int NOT NULL,
  `Datum` date DEFAULT NULL,
  `Vreme` time DEFAULT NULL,
  `PocetniSekund` int DEFAULT NULL,
  `TrajanjeUSekundama` int DEFAULT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdSlu`),
  KEY `FK_Slusanje_IdAud_idx` (`IdAud`),
  KEY `FK_Slusanje_IdKor_idx` (`IdKor`),
  CONSTRAINT `FK_Slusanje_IdAud` FOREIGN KEY (`IdAud`) REFERENCES `audio` (`IdAud`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Slusanje_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `ocena`;
CREATE TABLE `ocena` (
  `IdKor` int NOT NULL,
  `IdAud` int NOT NULL,
  `Ocena` int DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `Vreme` time DEFAULT NULL,
  `PoslednjaIzmena` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdKor`,`IdAud`),
  KEY `FK_Ocena_IdAud_idx` (`IdAud`),
  CONSTRAINT `FK_Ocena_IdAud` FOREIGN KEY (`IdAud`) REFERENCES `audio` (`IdAud`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Ocena_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
