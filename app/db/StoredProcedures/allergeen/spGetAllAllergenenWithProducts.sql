/******************************************************
-- Doel: oproepen van alle allergenen met de 
         bijbehorende producten en magazijn gegevens
*******************************************************
-- Versie:  07
-- Datum:   27-02-2025
-- Auteur:  Kyano Sowirono
******************************************************/

-- Selecteer de juiste database voor je stored procedure
use `jamin_a`;

-- Verwijder de oude stored procedure
DROP PROCEDURE IF EXISTS spGetAllAllergenenWithProducts;

-- Verander even tijdelijk de opdrachtprompt naar //
DELIMITER //

CREATE PROCEDURE spGetAllAllergenenWithProducts(
    IN allergeenFilter VARCHAR(255)
)
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
            MAGA.AantalAanwezig     AS MagazijnAantalAanwezig,
            PPL.LeverancierId       AS ProductPerLeverancierLeverancierId,
            LEV.Id                  AS LeverancierId
    FROM    productperallergeen     AS PPALLR
    INNER JOIN allergeen            AS ALLR
        ON     PPALLR.AllergeenId = ALLR.Id
    INNER JOIN product              AS PROD
        ON     PPALLR.ProductId = PROD.Id
    LEFT JOIN magazijn             AS MAGA
        ON     PROD.Id = MAGA.ProductId
    INNER JOIN productperleverancier        AS PPL
        ON     PROD.Id = PPL.ProductId
    INNER JOIN leverancier           AS LEV
        ON     PPL.LeverancierId = LEV.Id
    WHERE   (allergeenFilter IS NULL OR allergeenFilter = '' OR ALLR.Naam = allergeenFilter)
    ORDER BY PROD.Naam DESC;
END //
DELIMITER ;

/************* debug code stored procedure **************

CALL spGetAllAllergenenWithProducts();

********************************************************/