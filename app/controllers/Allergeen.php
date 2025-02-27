<?php

class Allergeen extends BaseController
{
    private $allergeenModel;

    public function __construct()
    {
        $this->allergeenModel = $this->model('AllergeenModel');
    }

    public function index()
    {   
        $allergeen = $_GET['allergeen'] ?? '';

        $data = [
            'title' => 'Overzicht Allergenen',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $result = $this->allergeenModel->getAllAllergenenWithFilter($allergeen);

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

        $this->view('allergeen/index', $data);
    }

    public function overview($leverancierId)
    {
        $data = [
            'title' => 'Overzicht Leverancier gegevens',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $result = $this->allergeenModel->getAllergeenProductLeverancierById($leverancierId);

        if (is_null($result)) {
            // Fout afhandelen
            $data['message'] = "Er is een fout opgetreden in de database";
            $data['messageColor'] = "danger";
            $data['messageVisibility'] = "flex";
            $data['dataRows'] = NULL;

            header('Refresh:3; url=' . URLROOT . '/Homepages/index');
        } else {
            $data['dataRows'] = $result[0];
        }

        $this->view('allergeen/overview', $data);
    }
}