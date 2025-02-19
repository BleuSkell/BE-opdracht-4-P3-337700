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
        $data = [
            'title' => 'Overzicht Magazijn Jamin',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'none',
            'dataRows' => NULL
        ];

        $this->view('allergeen/index', $data);
    }
}