DROP PROCEDURE IF EXISTS spDeliveredProductsDetailsById;

DELIMITER //

CREATE PROCEDURE spDeliveredProductsDetailsById(
    IN productPerLeverancierId INT UNSIGNED
)
BEGIN
    SELECT
        PPL.Id AS ProductPerLeverancierId
        ,PPL.DatumLevering
        ,PPL.Aantal
        ,PROD.Id AS ProductId
        ,PROD.Naam AS ProductNaam
        ,ALG.Id AS AllergeenId
        ,ALG.Naam AS AllergeenNaam
    FROM ProductPerLeverancier AS PPL
    JOIN Product AS PROD
        ON PPL.ProductId = PROD.Id
    LEFT JOIN ProductPerAllergeen AS PPA
        ON PROD.Id = PPA.ProductId
     LEFT JOIN Allergeen AS ALG
        ON PPA.AllergeenId = ALG.Id
    WHERE PPL.Id = productPerLeverancierId;
END //

DELIMITER ;