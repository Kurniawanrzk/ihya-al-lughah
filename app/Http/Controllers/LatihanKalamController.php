<?php

namespace App\Http\Controllers;

use App\Models\LatihanKalam;
use Illuminate\Http\Request;

class LatihanKalamController extends Controller
{
    public function index()
    {
        $latihan = LatihanKalam::all();
        return view("page.latihan_kalam.index", compact("latihan"));
    }
    public function isiKontenLatihan($urutan_bab)
    {
        $latihan_kalam = LatihanKalam::where("urutan_bab", $urutan_bab)->first();
        return view("page.latihan_kalam.isi_konten", compact("latihan_kalam"));
    }

    public function AIHandler(Request $request) {
        $apiUrl = env("BASE_URL_GEMINI") . env("API_KEY_GEMINI") ; 
        $requestBody = [
            "system_instruction" => [
                "parts" => [
                    "text" => "Kamu adalah AI, yang bertugas untuk menjawab 1 / 0, nanti saya akan dikirimkan user input dengan contoh seperti ini: 'question:dokter bekerja dimana?, user_input:rumah sakit atau apotek, jawaban:rumah sakit', jika user_input masuk akal dengan jawaban benar nya, jawab dengan angka 1 jika tidak 0"
                ]
            ],
            "contents" => [
                [
                    "parts" => [
                        ["text" => $request->userInput]
                    ]
                ]
            ]
        ];
    
        $ch = curl_init($apiUrl);
    
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json'
        ]);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($requestBody));
    
        $response = curl_exec($ch);
    
        if (curl_errno($ch)) {
            echo "Error: " . curl_error($ch);
        } else {
            $data = json_decode($response, true);
            if (isset($data['candidates'][0]['content']['parts'][0]['text'])) {
                $botResponse = $data['candidates'][0]['content']['parts'][0]['text'];
                return response()->json([
                    "status" => true,
                    "data" => [
                        "text" => $botResponse
                    ]
                ], 200);
            } else {
                return response()->json([
                    "status" => false,
                    "data" => [
                        "text" => "Error"
                    ]
                ], 200);
            }
        }
    
        curl_close($ch);
    
}
}
