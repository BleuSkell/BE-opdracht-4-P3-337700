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
        $data = [
            'title' => 'Overzicht Allergenen',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $startDate = isset($_GET['startDate']) ? $_GET['startDate'] : '2000-01-01';
        $endDate = isset($_GET['endDate']) ? $_GET['endDate'] : date('Y-m-d');

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
}