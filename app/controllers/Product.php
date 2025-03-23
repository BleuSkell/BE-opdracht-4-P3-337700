<?php

class Product extends BaseController
{
    private $productModel;

    public function __construct()
    {
        $this->productModel = $this->model('ProductModel');
    }

    public function index($startDate = NULL, $endDate = NULL)
    {   
        $startDate = isset($_GET['startDate']) ? $_GET['startDate'] : '2000-01-01';
        $endDate = isset($_GET['endDate']) ? $_GET['endDate'] : date('Y-m-d');

        $data = [
            'title' => 'Overzicht geleverde producten',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL,
            'startDate' => $startDate,
            'endDate' => $endDate
        ];

        $result = $this->productModel->getDeliveredProductsByDateRange($startDate, $endDate);

        if (is_null($result)) {
            // Fout afhandelen
            $data['message'] = "Er is een fout opgetreden in de database";
            $data['messageColor'] = "danger";
            $data['messageVisibility'] = "flex";
            $data['dataRows'] = NULL;

            header('Refresh:3; url=' . URLROOT . '/Homepages/index');
        } else {
            $data['dataRows'] = $result;
        }

        $this->view('product/index', $data);
    }

    public function details($productPerLeverancierId)
    {      
        $startDate = isset($_GET['startDate']) ? $_GET['startDate'] : '2000-01-01';
        $endDate = isset($_GET['endDate']) ? $_GET['endDate'] : date('Y-m-d');

        $data = [
            'title' => 'Specificatie geleverde producten',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL,
            'startDate' => $startDate,
            'endDate' => $endDate
        ];

        $result = $this->productModel->deliveredProductsDetailsById($productPerLeverancierId);

        if (is_null($result)) {
            // Fout afhandelen
            $data['message'] = "Er is een fout opgetreden in de database";
            $data['messageColor'] = "danger";
            $data['messageVisibility'] = "flex";
            $data['dataRows'] = NULL;

            header('Refresh:3; url=' . URLROOT . '/Homepages/index');
        } else {
            $data['dataRows'] = $result;
        }

        $this->view('product/details', $data);
    }
}