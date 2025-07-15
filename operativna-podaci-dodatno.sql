USE audio_snimci_operativna;

INSERT INTO mesto (Mesto) VALUES
('Grocka'),
('Tutin');

INSERT INTO korisnik (Ime, Email, Godiste, Pol, IdMes) VALUES
('Slavica Stasevic', 'slavica.stasevic@gmail.com', 2003, 'zenski', 11),
('Sanja Stasevic', 'sanja.stasevic@gmail.com', 2003, 'zenski', 11),
('Elena Stasevic', 'elena.stasevic@gmail.com', 2012, 'zenski', 11),
('Jovana Ljubenovic', null , 2002, 'zenski', 12);

INSERT INTO kategorija (Naziv) VALUES
('tuning'),
('bas');

INSERT INTO audio (Naziv, Trajanje, IdKor, Datum, Vreme) VALUES
('Sve po starom', 220, 11, DATE(NOW()), TIME(NOW())),
('Dam dam dam', 201, 13, DATE(NOW()), TIME(NOW()));

INSERT INTO audio_kategorija (IdAud, IdKat) VALUES
(16, 11),
(16, 3),
(17, 12);

INSERT INTO paket (MesecnaCena) VALUES
(1500),
(2500);

INSERT INTO pretplata (IdKor, IdPak, Datum, Vreme, PlacenaCena) VALUES
(11, 11, DATE(NOW()), TIME(NOW()), 1500),
(13, 11, DATE(NOW()), TIME(NOW()), 1450),
(12, 12, DATE(NOW()), TIME(NOW()), 2380),
(13, 11, DATE(NOW()), TIME(NOW()), 1465);

INSERT INTO slusanje (IdAud, IdKor, Datum, Vreme, PocetniSekund, TrajanjeUSekundama) VALUES
(16, 11, DATE(NOW()), TIME(NOW()), 0, 100),
(16, 13, DATE(NOW()), TIME(NOW()), 8, 158);

INSERT INTO ocena (IdKor, IdAud, Ocena, Datum, Vreme) VALUES
(11, 16, 5, DATE(NOW()), TIME(NOW())),
(13, 16, 8, DATE(NOW()), TIME(NOW()));