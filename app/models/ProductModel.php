<?php

class ProductModel
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

    public function getDeliveredProductsByDateRange($startDate, $endDate)
    {
        try {
            $sql = "CALL spGetDeliveredProductsByDateRange(:startDate, :endDate)";
            
            $this->db->query($sql);
            $this->db->bind(':startDate', $startDate, PDO::PARAM_STR);
            $this->db->bind(':endDate', $endDate, PDO::PARAM_STR);

            return $this->db->resultSet();

        } catch (Exception $e) {
            logger(__LINE__, __METHOD__, __FILE__, $e->getMessage());            
        }
    }

}