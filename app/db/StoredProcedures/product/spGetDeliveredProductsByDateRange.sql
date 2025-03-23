DROP PROCEDURE IF EXISTS spGetDeliveredProductsByDateRange;

DELIMITER //

CREATE PROCEDURE spGetDeliveredProductsByDateRange(
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT
        PPL.Id AS ProductPerLeverancierId
        ,LEV.Id AS LeverancierId
        ,LEV.Naam AS LeverancierNaam
        ,LEV.ContactPersoon AS LeverancierContactPersoon
        ,PROD.Id AS ProductId
        ,PROD.Naam AS ProductNaam
        ,SUM(PPL.Aantal) AS TotaalGeleverd
    FROM ProductPerLeverancier AS PPL
    JOIN Leverancier AS LEV
        ON PPL.LeverancierId = LEV.Id
    JOIN Product AS PROD
        ON PPL.ProductId = PROD.Id
    WHERE PPL.DatumLevering BETWEEN startDate AND endDate
    GROUP BY LEV.Naam;
END //

DELIMITER ;