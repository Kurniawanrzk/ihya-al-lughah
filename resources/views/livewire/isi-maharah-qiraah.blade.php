<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="bg-white rounded-xl shadow-sm p-8 relative">
        @php
            $cleanText = strip_tags($isi_qiraah->teks_bacaan);
            $cleanText = html_entity_decode($cleanText);
            $cleanText = preg_replace('/\s+/', ' ', $cleanText);
            $cleanText = preg_replace('/[\r\n\t]+/', ' ', $cleanText);
            $cleanText = trim($cleanText);
        @endphp

        <!-- Tombol Voice dengan desain yang lebih modern -->
        <button 
            class="absolute top-6 right-6 p-3 bg-blue-50 hover:bg-blue-100 rounded-full transition-colors duration-200"
            onclick="responsiveVoice.speak({{ Js::from($cleanText) }}, 'Indonesian Female')"
            title="Putar Audio"
        >
            <i class="fa fa-volume-up text-blue-600" aria-hidden="true"></i>
        </button>

        <div class="max-w-3xl mx-auto">
            <!-- Teks Bacaan dengan styling yang lebih baik -->
            <div class="prose prose-lg prose-blue max-w-none mb-8 text-gray-800">
                {!! $isi_qiraah->teks_bacaan !!}
            </div>

            <!-- Tombol Selesai dengan style yang konsisten -->
            <div class="text-center mt-8">
                <a href="{{ Route('list_qiraah_index') }}"
                    class="inline-block px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200"
                >
                    Selesai
                </a>
            </div>
        </div>
    </div>
</div>