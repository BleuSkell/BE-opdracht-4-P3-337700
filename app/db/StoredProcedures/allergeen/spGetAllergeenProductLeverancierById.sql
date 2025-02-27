/************************************************
-- Doel: Opvragen specifieke record uit de tabel
************************************************
-- Versie: 01
-- Datum:  17-1-2025
-- Auteur: Kyano Sowirono
-- Details: Stored procedure voor allergeen model method
************************************************/

-- Noem de database voor de stored procedure
use `jamin_a`;

-- Verwijder de bestaande stored procedure
DROP PROCEDURE IF EXISTS spGetAllergeenProductLeverancierById;

DELIMITER //

CREATE PROCEDURE spGetAllergeenProductLeverancierById(
    IN leverancierId INT UNSIGNED
)
BEGIN

    SELECT      LEV.Id                   AS LeverancierId
                ,LEV.ContactId
                ,LEV.Naam
                ,LEV.ContactPersoon
                ,LEV.LeverancierNummer
                ,LEV.Mobiel
                ,CONT.Straat             AS Straatnaam
                ,CONT.Huisnummer
                ,CONT.Postcode
                ,CONT.Stad

    FROM        Leverancier AS LEV

    INNER JOIN Contact AS CONT
        ON LEV.ContactId = CONT.Id
        
    WHERE LEV.Id = LeverancierId;

END //
DELIMITER ;

/**********debug code stored procedure***************
CALL spGetAllergeenProductLeverancierById();
****************************************************/