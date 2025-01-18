<?php

namespace App\Http\Controllers;

use App\Models\Qiraah;
use App\Models\IsiQiraah;
use Illuminate\Http\Request;

class QiraahController extends Controller
{
    public function index()
    {
        $qiraah = Qiraah::all();

        return view("page.qiraah.index", compact("qiraah"));
    }

    public function isi_konten($urutan_bab)
    {
        $qiraah = Qiraah::where("urutan_bab", $urutan_bab)->first();
        $qiraahisi = IsiQiraah::where("id_qiraah", $qiraah->id)->first();

        return view("page.qiraah.isi_konten", compact("qiraahisi", 'qiraah'));
    }
}