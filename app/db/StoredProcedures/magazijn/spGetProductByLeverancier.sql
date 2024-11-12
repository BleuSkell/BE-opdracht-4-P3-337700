/************************************************
-- Doel: Opvragen alle records uit de tabel
--       Magazijn en Product.
************************************************
-- Versie: 01
-- Datum:  11-11-2024
-- Auteur: Kyano Sowirono
-- Details: Stored procedure voor leverancier model method
************************************************/

-- Noem de database voor de stored procedure
use `jamin_a`;

-- Verwijder de bestaande stored procedure
DROP PROCEDURE IF EXISTS spGetProductByLeverancier;

DELIMITER //

CREATE PROCEDURE spGetProductByLeverancier(
    productId INT UNSIGNED
)
BEGIN

    SELECT       PPL.Id                    AS      PPLId
                ,PPL.LeverancierId         AS      PPLLeverancierId
                ,PPL.ProductId             AS      PPLProductId
                ,PPL.DatumLevering
                ,PPL.Aantal
                ,PPL.DatumEerstVolgendeLevering
                ,PROD.Id                    AS      ProductId
                ,PROD.Naam                  AS      ProductNaam
                ,LEVER.Id                   AS      LeverId
                ,LEVER.Naam                 AS      LeverancierNaam
                ,LEVER.ContactPersoon
                ,LEVER.LeverancierNummer
                ,LEVER.Mobiel

    FROM        ProductPerLeverancier AS PPL

    INNER JOIN Product AS PROD
            ON PROD.Id = PPL.ProductId
            
    INNER JOIN Leverancier AS LEVER
            ON LEVER.Id = PPL.LeverancierId

    WHERE   PPL.ProductId = productId     
            
    ORDER BY PPL.DatumLevering ASC;


END //
DELIMITER ;

/**********debug code stored procedure***************
CALL spGetProductByLeverancier();
****************************************************/