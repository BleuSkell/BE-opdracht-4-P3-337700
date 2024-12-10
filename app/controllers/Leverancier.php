<?php

class Leverancier extends BaseController
{
    private $leverancierModel;

    public function __construct()
    {
        $this->leverancierModel = $this->model('LeverancierModel');
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

        $result = $this->leverancierModel->getAllLeveranciers();

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

    public function producten($leverancierId)
    {
        $data = [
            'title' => 'Overzicht Leveranciers Jamin',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $result = $this->leverancierModel->getAllProductenById($leverancierId);

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

        $this->view('leverancier/producten', $data);
    }

    public function levering($ProductId)
    {
        $data = [
            'title' => 'Levering product',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $result = $this->leverancierModel->getAllProductDetailsById($ProductId);

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

        $this->view('leverancier/levering', $data);
    }

    public function nieuweLevering()
    {
        $data = [
            'title' => 'Levering product',
            'message' => null,
            'messageColor' => null,
            'messageVisibility' => 'none',
        ];

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Verwerk formulierdata
            $productId = $_POST['ProductId'];
            $leverancierId = $_POST['LeverancierId'];
            $aantal = $_POST['Aantal'];
            $datumEerstVolgendeLevering = !empty($_POST['DatumEerstVolgendeLevering']) ? $_POST['DatumEerstVolgendeLevering'] : null;

            // Voeg nieuwe levering toe
            $result = $this->leverancierModel->nieuweLevering($leverancierId, $productId, $aantal, $datumEerstVolgendeLevering);

            if ($result) {
                $data['message'] = "De nieuwe levering is succesvol toegevoegd.";
                $data['messageColor'] = "success";
                // Redirect terug naar leverancierspagina (of een andere locatie)
                header('Location: ' . URLROOT . '/leverancier/producten');
            } else {
                $data['message'] = "Er is een fout opgetreden bij het toevoegen van de levering.";
                $data['messageColor'] = "danger";
            }

            $data['messageVisibility'] = "flex";
            exit;
        } else {
            // Indien geen POST, stuur de gebruiker terug naar leverancierspagina
            header('Location: ' . URLROOT . '/leverancier/index');
            exit;
        }
    }
}