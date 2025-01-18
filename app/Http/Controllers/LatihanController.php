<?php
namespace App\Http\Controllers;

use App\Models\{HasilSoalBenarSalah,LatihanQiraah,SoalBenarSalah, JawbanBenarSalah, HasilBenarSalah, SoalLatihan, JawabanSoalLatihan, HasilSoalLatihan};
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert; 

class LatihanController extends Controller
{

    public function index()
    {
        $latihan = LatihanQiraah::all();

        return view("page.latihan_qiraah.index", compact("latihan"));
    }
    public function isiKontenLatihan($urutan_bab) {

        $latihan = LatihanQiraah::where("urutan_bab", $urutan_bab)->first();
        $jawaban_soal_latihan = SoalLatihan::where("id_latihan", $latihan->id)
            ->get()
            ->map(function($data){
                return [
                   "id" => $data->id,
                    "nomor" => $data->nomor,
                    "pertanyaan" => $data->pertanyaan,
                    "benar" => $data->benar,
                    "jawaban" => JawabanSoalLatihan::where("id_soal_latihan", $data->id)
                        ->inRandomOrder()
                        ->get()
                        ->toArray(),
                    "id_jawaban_benar" => JawabanSoalLatihan::where("id_soal_latihan", $data->id)->where("benar", 1)->first()->id
                ];
            })->toArray();

        $jawaban_soal_benar_salah = SoalBenarSalah::where("id_latihan", $latihan->id)
        ->get()
        ->map(function($data){
            return [
                "id" => $data->id,
                "nomor" => $data->nomor,
                "pertanyaan" => $data->pertanyaan,
                "benar" => $data->benar,
            ];
        })->toArray();
        
        return view("page.latihan_qiraah.isi_konten", compact("jawaban_soal_latihan","jawaban_soal_benar_salah", "latihan"));
    }
}
