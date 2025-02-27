<?php

class AllergeenModel
{
    private $db;

    public function __construct()
    {
        /**
         * Maak een nieuw database object die verbinding maakt met de 
         * MySQL server
         */
        $this->db = new Database();
    }   

    public function getAllAllergenen()
    {
        try {
            $sql = "CALL spGetAllAllergenenWithProducts()";
            
            $this->db->query($sql);

            return $this->db->resultSet();

        } catch (Exception $e) {
            logger(__LINE__, __METHOD__, __FILE__, $e->getMessage());            
        }
    }
}