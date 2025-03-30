<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\RekamanAudioSoalCerita;
use App\Models\RekamanAudioSoalPercakapan;

class AudioController extends Controller
{
    public function store(Request $request)
    {
        // $request->validate([
        //     'audio' => 'required|file|mimes:mp3,wav',
        //     'id_soal_cerita' => 'required|integer'
        // ]);

        try {
            // Generate nama file unik dengan tipe soal
            $tipe = $request->tipe ?? 'cerita'; // default to 'cerita' if not specified
            $namaFile = time() . '_' . $request->id_soal_cerita . '_' . $tipe . '.mp3';
            
            // Simpan file audio
            $path = $request->file('audio')->storeAs(
                'public/rekaman_audio',
                $namaFile
            );

            // Buat record database berdasarkan tipe
            if ($tipe === 'cerita') {
                RekamanAudioSoalCerita::create([
                    'id_soal_cerita' => $request->id_soal_cerita,
                    'lokasi_audio' => $namaFile,
                    'id_user' => $request->id,
                ]);
            } elseif ($tipe === 'percakapan') {
                RekamanAudioSoalPercakapan::create([ // Pastikan model ini ada
                    'id_soal_percakapan' => $request->id_soal_cerita, // Ganti dengan field yang sesuai
                    'lokasi_audio' => $namaFile,
                    'id_user' => $request->id,
                ]);
            }

            return response()->json([
                'sukses' => true, 
                'pesan' => 'Rekaman berhasil disimpan',
                'path' => $path
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'sukses' => false,
                'pesan' => 'Gagal menyimpan rekaman: ' . $e->getMessage()
            ], 500);
        }
    }
}