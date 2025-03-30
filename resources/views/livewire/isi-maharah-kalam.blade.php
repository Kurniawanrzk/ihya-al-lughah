<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="bg-white rounded-xl shadow-sm p-8 relative">
        @if(!$showVideo)  
            @php
                $cleanText = strip_tags($isi_kalam->teks_percakapan);
                $cleanText = html_entity_decode($cleanText);
                $cleanText = preg_replace('/\s+/', ' ', $cleanText);
                $cleanText = preg_replace('/[\r\n\t]+/', ' ', $cleanText);
                $cleanText = trim($cleanText);
            @endphp

            <!-- Tombol Voice -->
            <button 
            class="absolute top-6 right-6 p-3 bg-blue-50 hover:bg-blue-100 rounded-full transition-colors duration-200"
             wire:click="playAudio('{{ Storage::url('isi_kalam/' . $isi_kalam->suara_percakapan) }}')"
            title="Putar Audio"
        >
                <i class="fa fa-volume-up text-blue-600" aria-hidden="true"></i>
            </button>

            <div class="max-w-3xl mx-auto">
                <!-- Teks Percakapan -->
                <div class="prose prose-lg prose-blue max-w-none mb-8 text-gray-800 arabic-text" style="direction: rtl; font-family: 'Traditional Arabic', serif; font-size: 2rem;">
                    {!! $isi_kalam->teks_percakapan !!}
                </div>

                <!-- Tombol Navigasi -->
                <div class="flex justify-center gap-4 mt-8">
                    <button 
                        class="px-6 py-3 bg-red-600 text-white font-medium rounded-lg transition-colors duration-200 disabled:opacity-50 disabled:cursor-not-allowed hover:bg-red-700"
                        @if(!$showVideo) disabled @endif 
                        wire:click="showPrev"
                    >
                        Kembali
                    </button>
                    <button 
                        class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200"
                        wire:click="showNext"
                    >
                        Selanjutnya
                    </button>
                </div>
            </div>
        @endif

        @if($showVideo)
            <div class="max-w-3xl mx-auto">
                <!-- Video Section -->
                <div class="mt-8">
                    <div class="text-center mb-6">
                        <h2 class="text-2xl font-bold text-gray-800">Video Percakapan</h2>
                    </div>
                    <div class="rounded-xl overflow-hidden shadow-sm">
                        <video class="w-full" controls>
                            <source src="{{ $isi_kalam['video'] }}" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    </div>
                </div>

                <!-- Tombol Navigasi -->
                <div class="flex justify-center gap-4 mt-8">
                    <button 
                        class="px-6 py-3 bg-red-600 text-white font-medium rounded-lg transition-colors duration-200 disabled:opacity-50 disabled:cursor-not-allowed hover:bg-red-700"
                        @if(!$showVideo) disabled @endif 
                        wire:click="showPrev"
                    >
                        Kembali
                    </button>
                    <a 
                        href="{{ Route('list_kalam_index') }}"
                        class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200"
                        wire:click="showNext"
                    >
                        Selesai
                    </a>
                </div>
            </div>
        @endif
    </div>
</div>

<script>
    document.addEventListener('livewire:initialized', () => {
        Livewire.on('playAudio', (data) => {
            const audio = new Audio(data.audioUrl);
            audio.play();
        });
    });
</script>
