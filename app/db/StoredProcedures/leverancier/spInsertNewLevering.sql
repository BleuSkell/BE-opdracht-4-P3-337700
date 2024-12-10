DROP PROCEDURE IF EXISTS spInsertNewLevering;

DELIMITER //

CREATE PROCEDURE spInsertNewLevering(
    IN pLeverancierId INT,
    IN pProductId INT,
    IN pAantal INT,
    IN pDatumEerstVolgendeLevering DATE
)
BEGIN
    INSERT INTO ProductPerLeverancier (
        LeverancierId, 
        ProductId, 
        Aantal, 
        DatumLevering
    )
    VALUES (
        pLeverancierId, 
        pProductId, 
        pAantal, 
        IFNULL(pDatumEerstVolgendeLevering, NOW())
    );
END //

DELIMITER ;
