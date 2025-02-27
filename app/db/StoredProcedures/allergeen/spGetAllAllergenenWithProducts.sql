/******************************************************
-- Doel: oproepen van alle allergenen met de 
         bijbehorende producten en magazijn gegevens
*******************************************************
-- Versie:  03
-- Datum:   27-02-2025
-- Auteur:  Kyano Sowirono
******************************************************/

-- Selecteer de juiste database voor je stored procedure
use `jamin_a`;

-- Verwijder de oude stored procedure
DROP PROCEDURE IF EXISTS spGetAllAllergenenWithProducts;

-- Verander even tijdelijk de opdrachtprompt naar //
DELIMITER //

CREATE PROCEDURE spGetAllAllergenenWithProducts()
BEGIN
    SELECT  
            PPALLR.Id               AS ProductPerAllergeenId,
            PPALLR.ProductId        AS ProductPerAllergeenProductId,
            PPALLR.AllergeenId      AS ProductPerAllergeenAllergeenId,
            ALLR.Id                 AS AllergeenId,
            ALLR.Naam               AS AllergeenNaam,
            ALLR.Omschrijving       AS AllergeenOmschrijving,
            PROD.Id                 AS ProductId,
            PROD.Naam               AS ProductNaam,
            PROD.Barcode            AS ProductBarcode,
            MAGA.Id                 AS MagazijnId,
            MAGA.ProductId          AS MagazijnProductId,
            MAGA.AantalAanwezig     AS MagazijnAantalAanwezig
    FROM    productperallergeen     AS PPALLR
    INNER JOIN allergeen            AS ALLR
        ON     PPALLR.AllergeenId = ALLR.Id
    INNER JOIN product              AS PROD
        ON     PPALLR.ProductId = PROD.Id
    INNER JOIN magazijn             AS MAGA
        ON     PROD.Id = MAGA.ProductId
    ORDER BY PROD.Naam DESC;
END //
DELIMITER ;

/************* debug code stored procedure **************

CALL spGetAllAllergenenWithProducts();

********************************************************/