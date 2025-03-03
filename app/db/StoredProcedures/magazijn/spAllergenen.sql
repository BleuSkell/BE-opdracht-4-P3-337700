/************************************************
-- Doel: Opvragen alle records uit de tabel
--       Magazijn en Product.
************************************************
-- Versie: 01
-- Datum:  12-11-2024
-- Auteur: Kyano Sowirono
-- Details: Stored procedure voor allergenen model method
************************************************/

-- Noem de database voor de stored procedure
use `jamin_a`;

-- Verwijder de bestaande stored procedure
DROP PROCEDURE IF EXISTS spAllergenen;

DELIMITER //

CREATE PROCEDURE spAllergenen(
    productId INT UNSIGNED
)
BEGIN

    SELECT       PPA.Id                     AS      PPAId
                ,PPA.ProductId              AS      PPAProductId
                ,PPA.AllergeenId            AS      PPAAllergeenId
                ,PROD.Naam                  AS      ProductNaam
                ,PROD.Barcode               AS      ProductBarcode
                ,ALLERG.Naam                AS      AllergeenNaam
                ,ALLERG.Omschrijving        AS      AllergeenOmschrijving

    FROM        ProductPerAllergeen AS PPA

    INNER JOIN Product AS PROD
            ON PROD.Id = PPA.ProductId
            
    INNER JOIN Allergeen AS ALLERG
            ON ALLERG.Id = PPA.AllergeenId

    WHERE   PPA.ProductId = productId     
            
    ORDER BY ALLERG.Naam ASC;


END //
DELIMITER ;

/**********debug code stored procedure***************
CALL spAllergenen();
****************************************************/