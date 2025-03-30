<?php

namespace App\Livewire;

use Livewire\Component;

class IsiKontenMufrodat extends Component
{
    public $kontenMufrodat;
    public $currentPage = 1; // Add this line
    protected $paginationTheme = 'tailwind';

    public function mount($konten_mufrodat)
    {
        $this->kontenMufrodat = $konten_mufrodat;
    }
    public function playSound($url)
    {
        $this->dispatch('play-audio', $url);
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
        $isi_konten = \App\Models\IsiKontenMufrodat::where('id_mufrodat', $this->kontenMufrodat->id)
            ->paginate(1, ['*'], 'page', $this->currentPage);

        return view('livewire.isi-konten-mufrodat', [
            'isi_konten' => $isi_konten,
        ]);
    }
}

