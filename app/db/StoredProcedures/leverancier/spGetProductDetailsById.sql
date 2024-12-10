DROP PROCEDURE IF EXISTS spGetProductDetailsById;

DELIMITER //

CREATE PROCEDURE spGetProductDetailsById(
    IN ProductId INT
)
BEGIN
    SELECT      LEV.Id                  AS LeverancierId,
                LEV.Naam                AS LeverancierNaam,
                LEV.ContactPersoon      AS LeverancierContact,
                LEV.Mobiel              AS LeverancierMobiel,
                PROD.Id                 AS ProductId,
                PROD.Naam               AS ProductNaam,
                PPL.DatumLevering       AS LaatsteLevering,
                MAG.AantalAanwezig      AS AantalInMagazijn,
                MAG.VerpakkingseenheidInKG
    FROM        ProductPerLeverancier AS PPL
    INNER JOIN  Leverancier AS LEV ON PPL.LeverancierId = LEV.Id
    INNER JOIN  Product AS PROD ON PPL.ProductId = PROD.Id
    INNER JOIN  Magazijn AS MAG ON MAG.Id = PROD.Id
    WHERE       PROD.Id = ProductId
    ORDER BY    LaatsteLevering DESC
    LIMIT 1;
END //
DELIMITER ;