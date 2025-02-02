<?php
namespace App\Livewire;

use App\Models\PertanyaanSoalCerita;
use App\Models\SoalCerita;
use Livewire\Component;

class LatihanKalam extends Component
{
    public $latihanKalam;
    public $currentPage = 1;
    public $answers = [];
    public $answerStatus = [];
    public $isListening = false;
    public $currentQuestionId = null;

    public function mount($latihan)
    {
        $this->latihanKalam = $latihan;
    }

    public function startListening($questionId)
    {
        $this->currentQuestionId = $questionId;
        $this->isListening = true;
        $this->dispatch('startRecognition', questionId: $questionId);
    }

    public function stopListening()
    {
        $this->isListening = false;
        $this->currentQuestionId = null;
        $this->dispatch('stopRecognition');
    }

    #[\Livewire\Attributes\On('update-answer')]
    public function updateAnswer($questionId, $jawaban)
    {
        $result = $this->AIHandler($questionId, $jawaban);

        // Simpan status jawaban (benar atau salah)
        if ($result == "1\n") {
            $this->answerStatus[$questionId] = true; // Jawaban benar
            $this->dispatch("putar-suara", benar:1);
        } else {
            $this->answerStatus[$questionId] = false; // Jawaban salah
            $this->dispatch("putar-suara", benar:0);
        }

        // Stop listening after getting the answer
        $this->stopListening();
    }

    #[\Livewire\Attributes\On('recognition-ended')]
    public function handleRecognitionEnded()
    {
        $this->isListening = false;
        $this->currentQuestionId = null;
    }

    #[\Livewire\Attributes\On('speech-error')]
    public function handleSpeechError($error)
    {
        $this->isListening = false;
        $this->currentQuestionId = null;
        // You could add error handling logic here if needed
    }

    public function AIHandler($questionId, $jawaban) {
        $BASE_URL_GEMINI="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=";
        $API_KEY_GEMINI="AIzaSyAfSq_2UzoRuu-oSbJuTDrzvyTeVf36yc0";
        $apiUrl = $BASE_URL_GEMINI.$API_KEY_GEMINI; 
        $pertanyaan = PertanyaanSoalCerita::where("id", $questionId)->first();
        // AI request body
        $requestBody = [
            "system_instruction" => [
                "parts" => [
                    "text" => "Kamu adalah AI yang bertugas untuk menjawab 1 / 0, cek jika user input sesuai dengan jawaban sesuai dengan yang benar. HANYA BERIKAN RESPON 1 atau 0, JANGAN YANG LAIN, JIKA JAWABAN MIRIP TAPI TIDAK TERLALU SEMPURNA PENULISAN NYA BENAR KAN, contoh ."
                ]
            ],
            "contents" => [
                [
                    "parts" => [
                        ["text" => "question:" . $pertanyaan->pertanyaan . " user_input:" . $jawaban . " jawaban:" . $pertanyaan->jawaban_benar]
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
            return "Error: " . curl_error($ch);
        } else {
            $data = json_decode($response, true);
            if (isset($data['candidates'][0]['content']['parts'][0]['text'])) {
                $botResponse = $data['candidates'][0]['content']['parts'][0]['text'];
                return $botResponse; // '1' or '0' from AI validation
            }
        }
    
        curl_close($ch);
    }

    public function nextCard()
    {
        $this->currentPage++;
    }

    public function previousCard()
    {
        if ($this->currentPage > 1) {
            $this->currentPage--;
        }
    }

    public function render()
    {
        $soal_cerita = SoalCerita::where('id_latihan_kalam', $this->latihanKalam->id)
            ->get()
            ->map(function ($data) {
                return [
                    "id" => $data->id,
                    "id_latihan_kalam" => $data->id_latihan_kalam,
                    "gambar" => $data->gambar,
                    "deskripsi" => $data->deskripsi,
                    "pertanyaan" => PertanyaanSoalCerita::where("id_soal_cerita", $data->id)->get()
                ];
            });

        // Paginasi manual
        $total = $soal_cerita->count();
        $soal_cerita_paginated = $soal_cerita->slice(($this->currentPage - 1), 1);

        return view('livewire.latihan-kalam', [
            'soal_cerita' => $soal_cerita_paginated,
            'currentPage' => $this->currentPage,
            'totalPages' => $total
        ]);
    }
}