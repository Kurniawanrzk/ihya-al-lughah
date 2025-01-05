<?php

namespace App\Http\Controllers;

use App\Models\AttemptQiraah;
use App\Models\KontenIsiQiraah;
use App\Models\KontenQiraah;
use App\Models\Qiraah;
use Illuminate\Http\Request;

class QiraahController extends Controller
{
    public function index()
    {
        $qiraah = Qiraah::all()->map(function($qiraah) {
              if(null !== session("guest_id") && auth()->user() == null) {
                $attempt_guest_count = AttemptQiraah::where('guest_id', 'like', '%'.session("guest_id").'%')->count();
                $qiraah_count = KontenQiraah::where("id_qiraah", $qiraah->id)->count();
                return [
                    "nama_qiraah" => $qiraah->nama_qiraah,
                    "thumbnail" => $qiraah->thumbnail,
                    "deskripsi" => $qiraah->deskripsi,
                    "keys" => $qiraah->keys,
                    "presentase" => $qiraah_count > 0 ? ($attempt_guest_count / $qiraah_count) * 100 : 0
                ];
              } else if(auth()->user() && null == session("guest_id")) {
                $attempt_guest_count = AttemptQiraah::where('id_user', auth()->user()->id)->count();
                $qiraah_count = KontenQiraah::where("id_qiraah", $qiraah->id)->count();
                return [
                    "nama_qiraah" => $qiraah->nama_qiraah,
                    "thumbnail" => $qiraah->thumbnail,
                    "deskripsi" => $qiraah->deskripsi,
                    "keys" => $qiraah->keys,
                    "presentase" => $qiraah_count > 0 ? ($attempt_guest_count / $qiraah_count) * 100 : 0
                ];
              }
        });
        return view("page.qiraah.index", compact("qiraah"));
    }

    public function kontenQiraah($nama_qiraah) {
        $qiraah = Qiraah::where("nama_qiraah", 'like', '%'.$nama_qiraah.'%')->first();
        $konten_qiraah = KontenQiraah::where("id_qiraah", $qiraah->id)
        ->get()
        ->map(function($konten_qiraah){
            if(null !== session("guest_id") && auth()->user() == null) {
                return [
                    "nama_konten_qiraah" => $konten_qiraah->nama_konten_qiraah,
                    "thumbnail" => $konten_qiraah->thumbnail,
                    "status" => AttemptQiraah::where("guest_id", 'like', '%'.session("guest_id").'%')
                        ->where("id_konten_qiraah", $konten_qiraah->id)
                        ->exists()
                ];
            } else if(auth()->user() && null == session("guest_id")) {
                return [
                    "nama_konten_qiraah" => $konten_qiraah->nama_konten_qiraah,
                    "thumbnail" => $konten_qiraah->thumbnail,
                    "status" => AttemptQiraah::where("id_user", auth()->user()->id)
                        ->where("id_konten_qiraah", $konten_qiraah->id)
                        ->exists()
                ];
            }
        });

        return view("page.qiraah.konten", compact("konten_qiraah", "nama_qiraah"));
    }

    public function isiKontenQiraah($nama_qiraah, $konten_qiraah) {
        $kontenQiraah = KontenQiraah::where("nama_konten_qiraah", $konten_qiraah)->first();
        if(!$kontenQiraah || !KontenIsiQiraah::where("id_konten_qiraah", $kontenQiraah->id)->exists()) {
            return redirect()->back()->with("error", "Terjadi Kesalahan, silahkan tunggu sesaat");
        }

        // Check if user has attempted this content before
        if(null !== session("guest_id") && auth()->user() == null) {
            $hasAttempted = AttemptQiraah::where("guest_id", 'like', '%'.session("guest_id").'%')
                ->where("id_konten_qiraah", $kontenQiraah->id)
                ->exists();
        } else if(auth()->user() && null == session("guest_id")) {
            $hasAttempted = AttemptQiraah::where("id_user", auth()->user()->id)
                ->where("id_konten_qiraah", $kontenQiraah->id)
                ->exists();
        }

        return view("page.qiraah.isi_konten", compact("nama_qiraah", 'konten_qiraah', 'hasAttempted'));
    }

    public function postAttemptQiraah($id_konten_qiraah) {
        $kontenQiraah = KontenQiraah::where("id", $id_konten_qiraah)->first();
        if(!$kontenQiraah) {
            return redirect()->back()->with("error", "Konten tidak ditemukan");
        }

        // Check existing attempt based on auth status
        if(null !== session("guest_id") && auth()->user() == null) {
            if(AttemptQiraah::where("id_konten_qiraah", $id_konten_qiraah)
                ->where("guest_id", session("guest_id"))
                ->exists()) {
                return redirect()->route('qiraah_index', 
                    Qiraah::where("id", $kontenQiraah->id_qiraah)->first()->nama_qiraah);
            }
            
            $attemptData = [
                "id_konten_qiraah" => $id_konten_qiraah,
                "guest_id" => session("guest_id"),
                "id_user" => null
            ];
        } else if(auth()->user() && null == session("guest_id")) {
            if(AttemptQiraah::where("id_konten_qiraah", $id_konten_qiraah)
                ->where("id_user", auth()->user()->id)
                ->exists()) {
                return redirect()->route('qiraah_index', 
                    Qiraah::where("id", $kontenQiraah->id_qiraah)->first()->nama_qiraah);
            }

            $attemptData = [
                "id_konten_qiraah" => $id_konten_qiraah,
                "guest_id" => null,
                "id_user" => auth()->user()->id
            ];
        } else {
            return redirect()->back()->with("error", "Status autentikasi tidak valid");
        }

        $create = AttemptQiraah::create($attemptData);

        if($create) {
            return redirect()->route('qiraah_index', 
                Qiraah::where("id", $kontenQiraah->id_qiraah)->first()->nama_qiraah);
        }

        return redirect()->back()->with("error", "Gagal menyimpan attempt");
    }
}