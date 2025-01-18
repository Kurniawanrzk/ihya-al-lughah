<?php

namespace App\Livewire;

use Livewire\Component;

class IsiMaharahKalam extends Component
{
    public $kalam;
    public $isi_kalam;
    public $showVideo = false; // Menyimpan status tampilan video

    // Method untuk menangani tombol Next
    public function showNext()
    {
        $this->showVideo = true; // Mengubah status untuk menampilkan video
    }

    public function showPrev()
    {
        $this->showVideo = false;
    }
    public function compact($kalam, $kalamisi) {
        $this->kalam = $kalam;
        $this->isi_kalam = $kalamisi;
    }
    public function render()
    {
        return view('livewire.isi-maharah-kalam', 
            [
                "kalam" => $this->kalam,
                "isi_kalam" => $this->isi_kalam
            ]
        );
    }
}
