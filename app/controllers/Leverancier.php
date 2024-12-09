<?php

class Leverancier extends BaseController
{
    private $leverancierModel;

    public function __construct()
    {
        $this->leveracierModel = $this->model('LeverancierModel');
    }

    public function index()
    {
        $data = [
            'title' => 'Overzicht Leveranciers Jamin',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $result = $this->magazijnModel->getAllLeveranciers();

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

        $this->view('leverancier/index', $data);
    }
}