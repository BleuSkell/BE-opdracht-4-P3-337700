DROP PROCEDURE IF EXISTS spUpdateLeverancier;
DELIMITER //

CREATE PROCEDURE spUpdateLeverancier(
    IN pLeverancierId INT,
    IN pNaam VARCHAR(255),
    IN pContactPersoon VARCHAR(255),
    IN pLeverancierNummer VARCHAR(50),
    IN pMobiel VARCHAR(15),
    IN pStraat VARCHAR(255),
    IN pHuisnummer VARCHAR(10),
    IN pPostcode VARCHAR(20),
    IN pStad VARCHAR(100)
)
BEGIN
    -- Controleer of de LeverancierId bestaat in de leverancier tabel
    IF EXISTS (SELECT 1 FROM leverancier WHERE Id = pLeverancierId) THEN
        
        -- Update de contactgegevens
        UPDATE contact
        SET
            Straat = pStraat,
            Huisnummer = pHuisnummer,
            Postcode = pPostcode,
            Stad = pStad
        WHERE Id = (SELECT ContactId FROM leverancier WHERE Id = pLeverancierId);

        -- Update de leveranciergegevens
        UPDATE leverancier
        SET
            Naam = pNaam,
            ContactPersoon = pContactPersoon,
            LeverancierNummer = pLeverancierNummer,
            Mobiel = pMobiel
        WHERE Id = pLeverancierId;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'LeverancierId bestaat niet';
    END IF;
END //

DELIMITER ;