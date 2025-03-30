<?php
namespace App\Livewire;

use App\Models\PertanyaanSoalCerita;
use App\Models\{SoalCerita, SoalPercakapan, AudioRecording, RekamanAudioSoalCerita, RekamanAudioSoalPercakapan};
use Livewire\Component;
use Illuminate\Support\Facades\Storage;

class LatihanKalam extends Component
{
    public $latihanKalam;
    public $currentPage = 1;
    public $answers = [];
    public $jawaban_cerita = [];
    public $answerStatus = [];
    public $isListening = false;
    public $currentQuestionId = null;
    public $activeTab = 'cerita'; // 'cerita' or 'percakapan'

    public $audioRecordingsCerita = [];
    public $audioRecordingsPercakapan = [];

    #[\Livewire\Attributes\On('saveAudioTemp')]
    public function saveAudioTemp($data)
    {
        if ($data['type'] === 'cerita') {
            $this->audioRecordingsCerita[$data['soalCeritaId']] = $data['audioUrl'];
        } else {
            $this->audioRecordingsPercakapan[$data['soalCeritaId']] = $data['audioUrl'];
        }
    }

    public function mount($latihan)
    {
        $this->latihanKalam = $latihan;
        foreach(SoalCerita::where("id_latihan_kalam", $this->latihanKalam->id)->get() as $cerita){
            $this->jawaban_cerita[$cerita->id] = null;
        }

        // Retrieve previously saved audio recordings from the database
        $this->retrieveAudioRecordings();

        for($i = 0; $i < SoalCerita::where("id_latihan_kalam", $this->latihanKalam->id)->count(); $i++) {
            $jawaban_cerita[$i] = 1;
        }
    }

    private function retrieveAudioRecordings()
    {
        // Retrieve audio recordings for Soal Cerita
        $ceritaRecordings = RekamanAudioSoalCerita::where('id_user', auth()->id())
            ->get();

        foreach ($ceritaRecordings as $recording) {
            $this->audioRecordingsCerita[$recording->id_soal_cerita] =  Storage::url('rekaman_audio/' . $recording->lokasi_audio);
        }

        // Retrieve audio recordings for Soal Percakapan
        $percakapanRecordings = RekamanAudioSoalPercakapan::where('id_user', auth()->id())
            ->get();

        foreach ($percakapanRecordings as $recording) {
            $this->audioRecordingsPercakapan[$recording->id_soal_percakapan] = Storage::url('rekaman_audio/' . $recording->lokasi_audio);
        }
    }

    public function startListening($questionId, $soalCeritaId)
    {
        $this->currentQuestionId = $questionId;
        $this->isListening = true;
        $this->dispatch('startRecognition', [
            'questionId' => $questionId,
            'soalCeritaId' => $soalCeritaId
        ]);
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
      

        $this->jawaban_cerita[$questionId] = $jawaban;

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

    public function setActiveTab($tab)
    {
        $this->activeTab = $tab;
        $this->currentPage = 1; // Reset pagination when switching tabs
    }

    public function saveAudio($soalId, $type)
    {
        $audioData = $type === 'cerita' 
            ? $this->audioRecordingsCerita[$soalId] ?? null
            : $this->audioRecordingsPercakapan[$soalId] ?? null;

        if (!$audioData) {
            return;
        }

        // Dispatch event ke JavaScript untuk menyimpan audio
        $this->dispatch('save-audio-js', [
            'soalId' => $soalId,
            'tipe' => $type,
            'userId' => auth()->id() // pastikan user sudah login
        ]);
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
                    "cerita" => $data->cerita,
                    "pertanyaan" => PertanyaanSoalCerita::where("id_soal_cerita", $data->id)->get()
                ];
            });

        $soal_percakapan = SoalPercakapan::where("id_latihan_kalam", $this->latihanKalam->id)
            ->get()
            ->map(function($data) {
                return [
                    "id" => $data->id,
                    "id_latihan_kalam" => $data->id_latihan_kalam,
                    "nomor" => $data->nomor,
                    "percakapan" => $data->percakapan,
                    "gambar" => $data->gambar
                ];
            });

        // Adjust pagination based on active tab
        $total = $this->activeTab === 'cerita' ? $soal_cerita->count() : $soal_percakapan->count();
        $soal_cerita_paginated = $soal_cerita->slice(($this->currentPage - 1), 1);
        $soal_percakapan_paginated = $soal_percakapan->slice(($this->currentPage - 1), 1);

        return view('livewire.latihan-kalam', [
            'soal_cerita' => $soal_cerita_paginated,
            'soal_percakapan' => $soal_percakapan_paginated,
            'currentPage' => $this->currentPage,
            'totalPages' => $total,
            "jawaban_cerita" => $this->jawaban_cerita
        ]);
    }
}