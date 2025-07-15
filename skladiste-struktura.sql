CREATE DATABASE IF NOT EXISTS `audio_snimci_skladiste`;
USE `audio_snimci_skladiste`;

DROP TABLE IF EXISTS `vreme`;
CREATE TABLE `vreme` (
  `IdVre` int NOT NULL AUTO_INCREMENT,
  `Datum` date DEFAULT NULL,
  `Dan` int DEFAULT NULL,
  `Mesec` int DEFAULT NULL,
  `Godina` int DEFAULT NULL,
  `Vreme` time DEFAULT NULL,
  PRIMARY KEY (`IdVre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE `korisnik` (
  `IdKor` int NOT NULL AUTO_INCREMENT,
  `Godiste` int DEFAULT NULL,
  `Pol` varchar(45) DEFAULT NULL,
  `Mesto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdKor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `audio`;
CREATE TABLE `audio` (
  `IdAud` int NOT NULL AUTO_INCREMENT,
  `IdKor` int DEFAULT NULL,
  `Trajanje` int DEFAULT NULL,
  PRIMARY KEY (`IdAud`)  ,
  KEY `FK_Audio_IdKor_idx` (`IdKor`),
  CONSTRAINT `FK_Audio_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `kategorija`;
CREATE TABLE `kategorija` (
  `IdKat` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdKat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `slusanje`;
CREATE TABLE `slusanje` (
  `IdSlu` int NOT NULL AUTO_INCREMENT,
  `IdAud` int NOT NULL,
  `IdKor` int NOT NULL,
  `IdVre` int NOT NULL,
  `Trajanje` int DEFAULT NULL,
  PRIMARY KEY (`IdSlu`),
  KEY `FK_Slusanje_IdAud_idx` (`IdAud`),
  KEY `FK_Slusanje_IdKor_idx` (`IdKor`),
  KEY `FK_Slusanje_IdVre_idx` (`IdVre`),
  CONSTRAINT `FK_Slusanje_IdAud` FOREIGN KEY (`IdAud`) REFERENCES `audio` (`IdAud`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Slusanje_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Slusanje_IdVre` FOREIGN KEY (`IdVre`) REFERENCES `vreme` (`IdVre`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `ocena`;
CREATE TABLE `ocena` (
  `IdOce` int NOT NULL AUTO_INCREMENT,
  `IdKor` int NOT NULL,
  `IdAud` int NOT NULL,
  `IdKat` int NOT NULL,
  `IdVre` int NOT NULL,
  `MestoVlasnika` varchar(45) DEFAULT NULL,
  `Ocena` int DEFAULT NULL,
  PRIMARY KEY (`IdOce`),
  KEY `FK_Ocena_IdAud_idx` (`IdAud`),
  KEY `FK_Ocena_IdVre_idx` (`IdVre`),
  KEY `FK_Ocena_IdKat_idx` (`IdKat`),
  KEY `FK_Ocena_IdKor` (`IdKor`),
  CONSTRAINT `FK_Ocena_IdAud` FOREIGN KEY (`IdAud`) REFERENCES `audio` (`IdAud`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Ocena_IdKat` FOREIGN KEY (`IdKat`) REFERENCES `kategorija` (`IdKat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Ocena_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Ocena_IdVre` FOREIGN KEY (`IdVre`) REFERENCES `vreme` (`IdVre`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `pretplata`;
CREATE TABLE `pretplata` (
  `IdPre` int NOT NULL AUTO_INCREMENT,
  `IdKor` int NOT NULL,
  `IdVre` int NOT NULL,
  `PlacenaCena` int DEFAULT NULL,
  PRIMARY KEY (`IdPre`),
  KEY `FK_Pretplata_IdKor_idx` (`IdKor`),
  KEY `FK_Pretplata_IdVre_idx` (`IdVre`),
  CONSTRAINT `FK_Pretplata_IdKor` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Pretplata_IdVre` FOREIGN KEY (`IdVre`) REFERENCES `vreme` (`IdVre`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;