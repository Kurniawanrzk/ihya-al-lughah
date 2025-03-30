<div>
    <div class="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8">
        <div class="max-w-2xl mx-auto">
            <div class="bg-white rounded-xl shadow-xl overflow-hidden transform transition-all hover:scale-[1.02] duration-300">
                <div class="p-6 space-y-4">
                    <!-- Navigation Info -->
                    <div class="flex justify-between items-center mb-6">
                        <span class="text-sm text-gray-500">Card {{ $isi_konten->currentPage() }} of {{ $isi_konten->total() }}</span>
                        <a href="{{ route('index') }}" class="px-4 py-2 text-sm text-gray-600 hover:text-gray-900 rounded-md hover:bg-gray-100">
                            Exit
                        </a>
                    </div>

                    <!-- Flashcard Content -->
                    @foreach($isi_konten as $ik)
                        <div class="space-y-6">
                            <!-- Image Container -->
                            <div class="relative aspect-video bg-gray-100 rounded-xl overflow-hidden shadow-inner">
                                <img 
                                    src="{{ Storage::url('isi_mufrodat/' . $ik->gambar) }}"
                                    alt="Vocabulary illustration"
                                    class="w-full h-full object-cover"
                                >
                            </div>

                            <!-- Word Display -->
                            <div class="flex items-center justify-center space-x-4 py-4">
                                <h2 class="text-4xl font-bold text-gray-800 text-right" 
                                    style="font-family: 'Traditional Arabic', serif; direction: rtl; unicode-bidi: bidi-override; text-align: center;"
                                >
                                    {{ $ik->kosakata }}
                                </h2>
                                <button 
                                wire:click="playSound('{{ Storage::url('isi_mufrodat/' . $ik->suara) }}')"
                                class="p-2 rounded-full hover:bg-blue-50 transition-colors"
                                >
                                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z" />
                                    </svg>
                                </button>
                            
                            </div>
                        </div>
                    @endforeach

                    <!-- Navigation Controls -->
                    <div class="flex justify-between items-center pt-4">
                        @if($isi_konten->currentPage() > 1)
                            <button wire:click="previousCard" class="px-6 py-2 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors">
                                Previous
                            </button>
                        @else
                            <div></div>
                        @endif

                        @if($isi_konten->hasMorePages())
                            <button wire:click="nextCard" class="px-6 py-2 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors">
                                Next
                            </button>
                        @else
                            <a href="{{ Route('list_mufrodat_index') }}" class="px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors">
                                Selesai
                            </a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        Livewire.on('play-audio', (url) => {
            let audio = new Audio(url);
            audio.play();
        });
    });
</script>
