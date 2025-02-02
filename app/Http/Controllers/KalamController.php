<?php

namespace App\Http\Controllers;

use App\Models\{Kalam, KalamIsi};

class KalamController extends Controller
{
    public function index()
    {
        $kalam =  Kalam::all();
        return view("page.kalam.index", compact("kalam"));
    }

    public function isi_konten($urutan_bab)
    {
        $kalam = Kalam::where("urutan_bab", $urutan_bab)->first();
        $kalamisi = KalamIsi::where("id_kalam", $kalam->id)->first();

        return view("page.kalam.isi_konten", compact("kalamisi", 'kalam'));
    }
}

