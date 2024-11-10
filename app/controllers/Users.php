<?php

class Users extends BaseController 
{
    private $countryModel;

    public function __construct()
    {
        $this->countryModel = $this->model('Country');
    }

    public function index()
    {
        $data = [
            'title' => 'Account index'
        ];

        $this->view('users/index', $data);
    }

    public function login()
    {
        $data = [
            'title' => 'Login'
        ];

        $this->view('users/login', $data);
    }

    public function register()
    {
        $data = [
            'title' => 'Registering'
        ];

        $this->view('users/register', $data);
    }
}