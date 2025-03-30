<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HasilSoalLatihan;
use App\Models\{HasilBenarSalah, LatihanQiraah};
use Illuminate\Support\Facades\Auth;

class UserProfileController extends Controller
{
    public function show()
    {
        $userId = Auth::id();
        
        // Get unique latihan_id for the user from HasilSoalLatihan
        $pilganAttempt = HasilSoalLatihan::where('user_id', $userId)
            ->distinct('latihan_id')
            ->pluck('latihan_id');
    
        // Get unique latihan_id for the user from HasilBenarSalah
        $benarSalahAttempt = HasilBenarSalah::where('user_id', $userId)
            ->distinct('latihan_id')
            ->pluck('latihan_id');
    
        // Combine and get unique latihan_id from both attempts
        $allAttempts = $pilganAttempt->merge($benarSalahAttempt)->unique();
    
        // Initialize the result array
        $hasilQiraah = [];
    
        // Get LatihanQiraah data for the attempted latihan_id
        $latihanQiraahData = LatihanQiraah::whereIn("id", $allAttempts)
            ->get()
            ->keyBy('id'); // Key by id for easy lookup
    
        // Process each latihan_id
        foreach ($allAttempts as $latihanId) {
            // Get LatihanQiraah details
            $latihanDetail = $latihanQiraahData->get($latihanId);
    
            // Initialize counters for pilgan
            $totalPilgan = 0;
            $jumlahBenarPilgan = 0;
            $jumlahSalahPilgan = 0;
            $nilaiPilgan = 0;
    
            // Process HasilSoalLatihan data
            $hasilLatihan = HasilSoalLatihan::where("latihan_id", $latihanId)
                ->where("user_id", $userId)
                ->get();
    
            if ($hasilLatihan->isNotEmpty()) {
                $totalPilgan = $hasilLatihan->count();
                $jumlahBenarPilgan = $hasilLatihan->sum('benar'); // Sum of 'benar' field (1 for correct, 0 for wrong)
                $jumlahSalahPilgan = $totalPilgan - $jumlahBenarPilgan;
                $nilaiPilgan = ($totalPilgan > 0) ? ($jumlahBenarPilgan / $totalPilgan) * 100 : 0;
            }
    
            // Initialize counters for benar/salah
            $totalBenarSalah = 0;
            $jumlahBenarBenarSalah = 0;
            $jumlahSalahBenarSalah = 0;
            $nilaiBenarSalah = 0;
    
            // Process HasilBenarSalah data
            $hasilBenarSalah = HasilBenarSalah::where("latihan_id", $latihanId)
                ->where("user_id", $userId)
                ->get();
    
            if ($hasilBenarSalah->isNotEmpty()) {
                $totalBenarSalah = $hasilBenarSalah->count();
                $jumlahBenarBenarSalah = $hasilBenarSalah->sum('benar'); // Sum of 'benar' field (1 for correct, 0 for wrong)
                $jumlahSalahBenarSalah = $totalBenarSalah - $jumlahBenarBenarSalah;
                $nilaiBenarSalah = ($totalBenarSalah > 0) ? ($jumlahBenarBenarSalah / $totalBenarSalah) * 100 : 0;
            }
    
            // Calculate totals
            $total = $totalPilgan + $totalBenarSalah;
            $jumlahBenar = $jumlahBenarPilgan + $jumlahBenarBenarSalah;
            $jumlahSalah = $jumlahSalahPilgan + $jumlahSalahBenarSalah;
    
            // Add data to the result array
            $hasilQiraah[] = [
                "latihan_id" => $latihanId,
                "urutan_bab" => $latihanDetail->urutan_bab ?? null, // Add urutan_bab
                "nama_latihan" => $latihanDetail->nama_latihan ?? null, // Add deskripsi
                "total" => $total,
                "jumlah_benar" => $jumlahBenar,
                "jumlah_salah" => $jumlahSalah,
                "nilai_pilgan" => $nilaiPilgan, // Nilai untuk soal pilgan
                "nilai_benar_salah" => $nilaiBenarSalah // Nilai untuk soal benar/salah
            ];
        }
    
        return view('profil', [
            'hasilQiraah' => $hasilQiraah, // Pastikan ini adalah array
            'totalLatihan' => count($hasilQiraah),
            'rataRataSkor' => count($hasilQiraah) > 0 ? array_sum(array_column($hasilQiraah, 'nilai_pilgan')) / count($hasilQiraah) : 0,
            'materiSelesai' => count($hasilQiraah)
        ]);
    }
}