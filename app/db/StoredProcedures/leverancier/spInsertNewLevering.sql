DROP PROCEDURE IF EXISTS spInsertNewLevering;

-- DELIMITER //

-- CREATE PROCEDURE spInsertNewLevering(
--     IN pLeverancierId INT,
--     IN pProductId INT,
--     IN pAantal INT,
--     IN pDatumEerstVolgendeLevering DATE
-- )
-- BEGIN
--     INSERT INTO ProductPerLeverancier (
--         LeverancierId, 
--         ProductId, 
--         Aantal, 
--         DatumLevering
--     )
--     VALUES (
--         pLeverancierId, 
--         pProductId, 
--         pAantal, 
--         IFNULL(pDatumEerstVolgendeLevering, NOW())
--     );
-- END //

-- DELIMITER ;

DELIMITER //

CREATE PROCEDURE spInsertNewLevering(
    IN pLeverancierId INT,
    IN pProductId INT,
    IN pAantal INT,
    IN pDatumEerstVolgendeLevering DATE
)
BEGIN
    -- Voeg de nieuwe levering toe
    INSERT INTO ProductPerLeverancier (
        LeverancierId, 
        ProductId, 
        Aantal, 
        DatumLevering,
        DatumEerstVolgendeLevering
    )
    VALUES (
        pLeverancierId, 
        pProductId, 
        pAantal, 
        NOW(), -- Gebruik de huidige datum en tijd voor de levering
        IFNULL(pDatumEerstVolgendeLevering, NOW()) -- Gebruik de ingevoerde datum of de huidige datum als deze niet is ingevuld
    );

    -- Update het aantal in het magazijn
    UPDATE Magazijn
    SET AantalAanwezig = AantalAanwezig + pAantal
    WHERE ProductId = pProductId;

    -- Update de laatste levering voor het product
    -- Alleen de DatumLevering updaten naar de huidige datum, de DatumEerstVolgendeLevering blijft ongewijzigd
    UPDATE ProductPerLeverancier
    SET DatumLevering = NOW() -- Gebruik de huidige datum en tijd voor de levering
    WHERE LeverancierId = pLeverancierId AND ProductId = pProductId
    ORDER BY DatumLevering DESC
    LIMIT 1;
END //

DELIMITER ;