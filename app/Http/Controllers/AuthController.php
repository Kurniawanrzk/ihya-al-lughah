<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function loginIndex() 
    {
        return view("page.auth.login");
    }

    public function login()
    {

    }

    public function registerIndex()
    {

        return view("page.auth.register");
    }
    public function register()
    {
        
    }

}
