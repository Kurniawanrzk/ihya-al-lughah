<?php

namespace App\Livewire;

use Livewire\Component;

class IsiMaharahQiraah extends Component
{
    public $qiraah;
    public $isi_qiraah;

    public function compact($qiraah, $qiraahisi) {
        $this->qiraah = $qiraah;
        $this->isi_qiraah = $qiraahisi;
    }
    public function render()
    {
        return view('livewire.isi-maharah-qiraah', 
            [
                "qiraah" => $this->qiraah,
                "isi_qiraah" => $this->isi_qiraah
            ]
        );
    }
}
