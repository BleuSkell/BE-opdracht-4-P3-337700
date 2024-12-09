/************************************************
-- Doel: Opvragen alle records uit de tabel
--       Leverancier, producten, magazijn
         en productperleverancier.
************************************************
-- Versie: 01
-- Datum:  9-12-2024
-- Auteur: Kyano Sowirono
-- Details: Stored procedure voor leverancier model method
************************************************/

-- Noem de database voor de stored procedure
use `jamin_a`;

-- Verwijder de bestaande stored procedure
DROP PROCEDURE IF EXISTS spGetAllProductenById;

DELIMITER //

CREATE PROCEDURE spGetAllProductenById(
    LeverancierId INT UNSIGNED
)
BEGIN

    SELECT      LEV.Id                      AS LeverancierId
                ,LEV.Naam                   AS LeverancierNaam
                ,LEV.ContactPersoon         AS LeverancierContact
                ,LEV.LeverancierNummer
                ,LEV.Mobiel                 AS LeverancierMobiel
                ,PROD.Id                    AS ProductId
                ,PROD.Naam                  AS ProductNaam
                ,MAG.Id                     AS MagazijnId
                ,MAG.AantalAanwezig      
                ,MAG.VerpakkingseenheidInKG AS VerpakkingsEenheid
                ,PPL.Id                     AS ProductPerLeverancierId
                ,PPL.DatumLevering          AS LaatsteLevering

    FROM        ProductPerLeverancier AS PPL

    INNER JOIN Product AS PROD
            ON PROD.Id = PPL.ProductId
            
    INNER JOIN Leverancier AS LEV
            ON LEV.Id = PPL.LeverancierId

    INNER JOIN Magazijn AS MAG
            ON MAG.Id = PROD.Id

    WHERE   PPL.LeverancierId = LeverancierId     
            
    ORDER BY PPL.DatumLevering ASC;


END //
DELIMITER ;

/**********debug code stored procedure***************
CALL spGetAllProductenById();
****************************************************/