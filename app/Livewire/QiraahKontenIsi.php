<?php

namespace App\Livewire;

use App\Models\KontenIsiQiraah;
use App\Models\KontenQiraah;
use Livewire\Component;
use Livewire\WithPagination;
class QiraahKontenIsi extends Component
{
    use WithPagination;
 
    protected $paginationTheme = 'simple-bootstrap';
    public $konten_qiraah; // Properti untuk menyimpan data konten qiraah

    public function mount($konten_qiraah)
    {
        // Inisialisasi data berdasarkan parameter yang diterima
        $this->konten_qiraah = KontenQiraah::where('nama_konten_qiraah', $konten_qiraah)->first();
    }

   

    public function render()
    {
        // Ambil isi konten berdasarkan konten qiraah yang telah diinisialisasi
        $isi_konten_qiraah = KontenIsiQiraah::where('id_konten_qiraah', $this->konten_qiraah->id)->paginate(1);

        return view('livewire.qiraah-konten-isi', [
            'isi_konten' => $isi_konten_qiraah
        ]);
    }
}
