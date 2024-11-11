<?php

class Magazijn extends BaseController
{
    private $magazijnModel;

    public function __construct()
    {
        $this->magazijnModel = $this->model('MagazijnModel');
    }

    public function index()
    {
        $data = [
            'title' => 'Overzicht Magazijn Jamin',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $result = $this->magazijnModel->getAllMagazijnProducts();

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

        $this->view('magazijn/index', $data);
    }

    public function leverancier()
    {
        $data = [
            'title' => 'Leverings Informatie'
        ];

        $this->view('magazijn/leverancier', $data);
    }
}