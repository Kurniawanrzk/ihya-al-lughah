<?php

namespace App\Http\Controllers;

use App\Models\QiraahBab;
use Illuminate\Http\Request;

class QiraahBabController extends Controller
{
    public function index()
    {
        $qiraahBab = QiraahBab::all();
        return view('page.qiraah.index', compact('qiraahBab'));
    }
}