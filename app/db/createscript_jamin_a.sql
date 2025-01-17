DROP DATABASE IF EXISTS jamin_a;
CREATE DATABASE jamin_a;
USE jamin_a;


CREATE TABLE Product (
  Id INT UNSIGNED NOT NULL AUTO_INCREMENT
  ,Naam VARCHAR(100) NOT NULL
  ,Barcode INT UNSIGNED NOT NULL
  ,IsActief BIT NOT NULL DEFAULT 1
  ,Opmerking VARCHAR(250) NULL DEFAULT NULL
  ,DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6)
  ,DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6)
    
  ,PRIMARY KEY(Id)
)ENGINE=InnoDB;

INSERT INTO Product
(
   Naam
  ,Barcode
  ,IsActief
  ,Opmerking
  ,DatumAangemaakt
  ,DatumGewijzigd
)
VALUES
('Mintnopjes', '8719587231278', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Schoolkrijt', '8719587326713', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Honingdrop', '8719587327836', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Zure Beren', '8719587321441', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Cola Flesjes', '8719587321237', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Turtles', '8719587322245', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Witte Muizen', '8719587328256', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Reuzen Slangen', '8719587325641', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Zoute Rijen', '8719587322739', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Winegums', '8719587327527', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Drop Munten', '8719587322345', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Kruis Drop', '8719587322265', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Zoute Ruitjes', '8719587323256', 1, NULL, SYSDATE(6), SYSDATE(6));




CREATE TABLE Magazijn (
  Id INT UNSIGNED NOT NULL AUTO_INCREMENT
  ,ProductId INT UNSIGNED NOT NULL
  ,VerpakkingseenheidInKG DECIMAL(6,2) UNSIGNED NOT NULL
  ,AantalAanwezig SMALLINT UNSIGNED NULL DEFAULT NULL
  ,IsActief BIT NOT NULL DEFAULT 1
  ,Opmerking VARCHAR(250) NULL DEFAULT NULL
  ,DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6)
  ,DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6)
    
  ,PRIMARY KEY(Id)
  ,CONSTRAINT FK_Magazijn_Product FOREIGN KEY (ProductId) REFERENCES Product(Id)
)ENGINE=InnoDB;

INSERT INTO Magazijn
(
   ProductId
  ,VerpakkingseenheidInKG
  ,AantalAanwezig
  ,IsActief
  ,Opmerking
  ,DatumAangemaakt
  ,DatumGewijzigd
)

VALUES
(1, 5, 453, 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 2.5, 400, 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 5, 1, 1, NULL, SYSDATE(6), SYSDATE(6)),
(4, 1, 800, 1, NULL, SYSDATE(6), SYSDATE(6)),
(5, 3, 234, 1, NULL, SYSDATE(6), SYSDATE(6)),
(6, 2, 345, 1, NULL, SYSDATE(6), SYSDATE(6)),
(7, 1, 795, 1, NULL, SYSDATE(6), SYSDATE(6)),
(8, 10, 233, 1, NULL, SYSDATE(6), SYSDATE(6)),
(9, 2.5, 123, 1, NULL, SYSDATE(6), SYSDATE(6)),
(10, 3, 0, 1, NULL, SYSDATE(6), SYSDATE(6)),
(11, 2, 367, 1, NULL, SYSDATE(6), SYSDATE(6)),
(12, 1, 467, 1, NULL, SYSDATE(6), SYSDATE(6)),
(13, 5, 20, 1, NULL, SYSDATE(6), SYSDATE(6));



CREATE TABLE Allergeen (
  Id INT UNSIGNED NOT NULL AUTO_INCREMENT
  ,Naam VARCHAR(100) NOT NULL
  ,Omschrijving VARCHAR(100) NOT NULL
  ,IsActief BIT NOT NULL DEFAULT 1
  ,Opmerking VARCHAR(250) NULL DEFAULT NULL
  ,DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6)
  ,DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6)
    
  ,PRIMARY KEY(Id)
)ENGINE=InnoDB;

INSERT INTO Allergeen
(
   Naam
  ,Omschrijving
  ,IsActief
  ,Opmerking
  ,DatumAangemaakt
  ,DatumGewijzigd
)

VALUES
('Gluten', 'Dit product bevat Glucose', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Gelatine', 'Dit product bevat Gelatine', 1, NULL, SYSDATE(6), SYSDATE(6)),
('AZO-kleurstof', 'Dit product bevat AZO-kleurstof', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Lactose', 'Dit product bevat Lactose', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Soja', 'Dit product bevat Soja', 1, NULL, SYSDATE(6), SYSDATE(6));



CREATE TABLE ProductPerAllergeen (
  Id INT UNSIGNED NOT NULL AUTO_INCREMENT
  ,ProductId INT UNSIGNED NOT NULL
  ,AllergeenId INT UNSIGNED NOT NULL
  ,IsActief BIT NOT NULL DEFAULT 1
  ,Opmerking VARCHAR(250) NULL DEFAULT NULL
  ,DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6)
  ,DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6)
    
  ,PRIMARY KEY(Id)
  ,CONSTRAINT FK_ProductPerAllergeen_Product FOREIGN KEY (ProductId) REFERENCES Product(Id)
  ,CONSTRAINT FK_ProductPerAllergeen_Allergeen FOREIGN KEY (AllergeenId) REFERENCES Allergeen(Id)
)ENGINE=InnoDB;

INSERT INTO ProductPerAllergeen
(
   ProductId
  ,AllergeenId
  ,IsActief
  ,Opmerking
  ,DatumAangemaakt
  ,DatumGewijzigd
)

VALUES
(1, 2, 1, NULL, SYSDATE(6), SYSDATE(6)),
(1, 1, 1, NULL, SYSDATE(6), SYSDATE(6)),
(1, 3, 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 4, 1, NULL, SYSDATE(6), SYSDATE(6)),
(6, 5, 1, NULL, SYSDATE(6), SYSDATE(6)),
(9, 2, 1, NULL, SYSDATE(6), SYSDATE(6)),
(10, 2, 1, NULL, SYSDATE(6), SYSDATE(6)),
(12, 4, 1, NULL, SYSDATE(6), SYSDATE(6)),
(13, 1, 1, NULL, SYSDATE(6), SYSDATE(6)),
(13, 4, 1, NULL, SYSDATE(6), SYSDATE(6)),
(13, 5, 1, NULL, SYSDATE(6), SYSDATE(6));



CREATE TABLE Contact (
  Id INT UNSIGNED NOT NULL AUTO_INCREMENT
  ,Straat VARCHAR(70) NOT NULL
  ,Huisnummer SMALLINT NOT NULL
  ,Postcode VARCHAR(40) NOT NULL
  ,Stad VARCHAR(70) NOT NULL
  ,IsActief BIT NOT NULL DEFAULT 1
  ,Opmerking VARCHAR(250) NULL DEFAULT NULL
  ,DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6)
  ,DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6)

  ,PRIMARY KEY(Id)
)ENGINE=InnoDB;

INSERT INTO Contact (
  Straat
  ,Huisnummer
  ,Postcode
  ,Stad
  ,IsActief
  ,Opmerking
  ,DatumAangemaakt
  ,DatumGewijzigd
)

VALUES
('Van Gilslaan', 34, '1045CB', 'Hilvarenbeek', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Den Dolderpad', 2, '1067RC', 'Utrecht', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Fredo Raalteweg', 257, '1236OP', 'Nijmegen', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Bertrand Russellhof', 21, '2034AP', 'Den Haag', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Leon van Bonstraat', 213, '145XC', 'Lunteren', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Bea van Lingenlaan', 234, '2197FG', 'Sint Pancras', 1, NULL, SYSDATE(6), SYSDATE(6));



CREATE TABLE Leverancier (
  Id INT UNSIGNED NOT NULL AUTO_INCREMENT
  ,ContactId INT UNSIGNED NOT NULL
  ,Naam VARCHAR(100) NOT NULL
  ,ContactPersoon VARCHAR(100) NOT NULL
  ,LeverancierNummer VARCHAR(100) NOT NULL
  ,Mobiel VARCHAR(100) NOT NULL
  ,IsActief BIT NOT NULL DEFAULT 1
  ,Opmerking VARCHAR(250) NULL DEFAULT NULL
  ,DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6)
  ,DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6)
    
  ,PRIMARY KEY(Id)
  ,CONSTRAINT FK_Leverancier_Contact FOREIGN KEY (ContactId) REFERENCES Contact(Id)
)ENGINE=InnoDB;

INSERT INTO Leverancier
( 
  ContactId
  ,Naam
  ,ContactPersoon
  ,LeverancierNummer
  ,Mobiel
  ,IsActief
  ,Opmerking
  ,DatumAangemaakt
  ,DatumGewijzigd
)

VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', 1, NULL, SYSDATE(6), SYSDATE(6)),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', 1, NULL, SYSDATE(6), SYSDATE(6)),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', 1, NULL, SYSDATE(6), SYSDATE(6)),
(6, 'Quality Street', 'Johan Nooij', 'L1029234586', '06-23458456', 1, NULL, SYSDATE(6), SYSDATE(6));



CREATE TABLE ProductPerLeverancier (
  Id INT UNSIGNED NOT NULL AUTO_INCREMENT
  ,LeverancierId INT UNSIGNED NOT NULL
  ,ProductId INT UNSIGNED NOT NULL
  ,MagazijnId INT UNSIGNED NOT NULL
  ,DatumLevering DATE NOT NULL
  ,Aantal SMALLINT UNSIGNED NOT NULL
  ,DatumEerstVolgendeLevering DATE NULL DEFAULT NULL
  ,IsActief BIT NOT NULL DEFAULT 1
  ,Opmerking VARCHAR(250) NULL DEFAULT NULL
  ,DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6)
  ,DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6) ON UPDATE NOW(6)

  ,PRIMARY KEY(Id)
  ,CONSTRAINT FK_Leverancier_ProductPerLeverancier FOREIGN KEY (LeverancierId) REFERENCES Leverancier(Id)
  ,CONSTRAINT FK_Product_ProductPerLeverancier FOREIGN KEY (ProductId) REFERENCES Product(Id)
  ,CONSTRAINT FK_Magazijn_ProductPerLeverancier FOREIGN KEY (MagazijnId) REFERENCES Magazijn(Id)
)ENGINE=InnoDB;

INSERT INTO ProductPerLeverancier
(
   LeverancierId
  ,ProductId
  ,MagazijnId
  ,DatumLevering
  ,Aantal
  ,DatumEerstVolgendeLevering
  ,IsActief
  ,Opmerking
  ,DatumAangemaakt
  ,DatumGewijzigd
)
VALUES
(1, 1, 1, '2024-10-09', 23, '2024-10-16', 1, NULL, SYSDATE(6), SYSDATE(6)),
(1, 1, 1, '2024-10-18', 21, '2024-10-25', 1, NULL, SYSDATE(6), SYSDATE(6)),
(1, 2, 2, '2024-10-09', 12, '2024-10-16', 1, NULL, SYSDATE(6), SYSDATE(6)),
(1, 3, 3, '2024-10-10', 11, '2024-10-17', 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 4, 4, '2024-10-14', 16, '2024-10-21', 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 4, 4, '2024-10-21', 23, '2024-10-28', 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 5, 5, '2024-10-14', 45, '2024-10-21', 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 6, 6, '2024-10-14', 30, '2024-10-21', 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 7, 7, '2024-10-12', 12, '2024-10-19', 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 7, 7, '2024-10-19', 23, '2024-10-26', 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 8, 8, '2024-10-10', 12, '2024-10-17', 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 9, 9, '2024-10-11', 1, '2024-10-18', 1, NULL, SYSDATE(6), SYSDATE(6)),
(4, 10, 10, '2024-10-16', 24, '2024-10-30', 1, NULL, SYSDATE(6), SYSDATE(6)),
(5, 11, 11, '2024-10-10', 47, '2024-10-17', 1, NULL, SYSDATE(6), SYSDATE(6)),
(5, 11, 11, '2024-10-19', 60, '2024-10-26', 1, NULL, SYSDATE(6), SYSDATE(6)),
(5, 12, 12, '2024-10-11', 45, NULL, 1, NULL, SYSDATE(6), SYSDATE(6)),
(5, 13, 13, '2024-10-12', 23, NULL, 1, NULL, SYSDATE(6), SYSDATE(6));