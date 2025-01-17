/************************************************
-- Doel: Opvragen alle records uit de tabel
--       Leverancier.
************************************************
-- Versie: 01
-- Datum:  17-1-2025
-- Auteur: Kyano Sowirono
-- Details: Stored procedure voor leverancier model method
************************************************/

-- Noem de database voor de stored procedure
use `jamin_a`;

-- Verwijder de bestaande stored procedure
DROP PROCEDURE IF EXISTS spGetLeverancierById;

DELIMITER //

CREATE PROCEDURE spGetLeverancierById(
    LeverancierId INT UNSIGNED
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
        ON LEV.ContactId = CONT.Id;

END //
DELIMITER ;

/**********debug code stored procedure***************
CALL spGetLeverancierById();
****************************************************/