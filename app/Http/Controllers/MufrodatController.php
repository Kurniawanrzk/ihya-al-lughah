<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Mufrodat, KontenMufrodat, HasilMufrodat, IsiKontenMufrodat};

class MufrodatController extends Controller
{
    public function index() 
    {
        $guestId = session("guest_id");
        $userId = auth()->check() ? auth()->user()->id : null;

        $mufrodat = Mufrodat::all()->map(function ($mufrodat) use ($guestId, $userId) {
            $mufrodatCount = KontenMufrodat::where("id_mufrodat", $mufrodat->id)->count();

            $hasilCount = $guestId && !$userId
                ? HasilMufrodat::where("guest_id", 'like', "%{$guestId}%")->count()
                : ($userId ? HasilMufrodat::where("id_user", $userId)->count() : 0);

            $presentase = $mufrodatCount > 0 ? ($hasilCount / $mufrodatCount) * 100 : 0;

            return [
                "nama_materi" => $mufrodat->nama_materi,
                "thumbnail" => $mufrodat->thumbnail,
                "deskripsi" => $mufrodat->deskripsi,
                "keys" => $mufrodat->keys,
                "urutan_bab" => $mufrodat->urutan_bab,
                "presentase" => $presentase,
            ];
        });
        return view("page.mufrodat.index", compact("mufrodat"));
    }


    public function isiKontenMufrodat($urutan_bab)
    {
        $konten_mufrodat = Mufrodat::where("urutan_bab", $urutan_bab)->first();
        return view("page.mufrodat.isi_konten", compact("konten_mufrodat"));

    }
}
