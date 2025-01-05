<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MainController extends Controller
{
    public function index() {
        if(null == auth()->user()) {
            alert()->html('Informasi',"Kamu saat ini belum registrasi / login, jika ingin <a href='".route('oauth.google')."'>klik disini<a/> untuk login lewat google",'info');
        }
        return view("page.main.index");
    }
}
