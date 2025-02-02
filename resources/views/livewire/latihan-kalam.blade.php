<div>
    <div class="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8">
        <div class="max-w-2xl mx-auto">
            <div class="bg-white rounded-xl shadow-xl overflow-hidden transform transition-all hover:scale-[1.02] duration-300">
                <div class="p-6 space-y-4">
                    <!-- Navigation Info -->
                    <div class="flex justify-between items-center mb-6">
                        <span class="text-sm text-gray-500">السؤال {{ $currentPage }} من {{ $totalPages }}</span>
                        <a href="{{ route('index') }}" class="px-4 py-2 text-sm text-gray-600 hover:text-gray-900 rounded-md hover:bg-gray-100">
                            خروج
                        </a>
                    </div>

                    @foreach($soal_cerita as $soal)
                        <div class="space-y-6">
                            <!-- Image Container -->
                            <div class="relative aspect-video bg-gray-100 rounded-xl overflow-hidden shadow-inner">
                                <img
                                    src="{{ Storage::url('isi_mufrodat/' . $soal['gambar']) }}"
                                    alt="Ilustrasi soal"
                                    class="w-full h-full object-cover"
                                >
                            </div>

                            <!-- Deskripsi Soal -->
                            @if($soal['deskripsi'])
                                <div class="text-center">
                                    <i>                                    <p class="text-lg text-gray-700">{{ $soal['deskripsi'] }}</p>
                                    </i>
                                </div>
                            @endif

                            <!-- Questions -->
                            <div class="space-y-8">
                                @foreach($soal['pertanyaan'] as $index => $pertanyaan)
                                <div class="space-y-4">
                                    <div class="text-center">
                                        <h2 class="text-xl font-bold"
                                            style="font-family: 'Traditional Arabic', serif;"
                                            wire:key="question-{{ $pertanyaan['id'] }}"
                                            :class="{ 'text-green-600': @json($answerStatus[$pertanyaan['id']] ?? null) === true, 
                                                     'text-red-600': @json($answerStatus[$pertanyaan['id']] ?? null) === false }">
                                            {{ $index + 1 }}. {{ $pertanyaan['pertanyaan'] }}
                                        </h2>
                                    </div>
                                    
                                    <!-- Modified Input Group with smaller sizes -->
                                    <div class="relative flex items-start gap-2">
                                        <!-- Textarea with reduced height -->
                                        <div class="flex-grow relative">
                                            <textarea 
                                                wire:model="answers.{{ $pertanyaan['id'] }}" 
                                                id="answer-{{ $pertanyaan['id'] }}" 
                                                class="w-full border rounded-lg p-2 text-right min-h-[60px] max-h-[60px] resize-none" 
                                                dir="rtl"
                                            ></textarea>
                                        </div>
                                        
                                        <!-- Smaller Mic Button -->
                                        <button 
                                            wire:click="{{ $isListening && $currentQuestionId === $pertanyaan['id'] 
                                                ? 'stopListening' 
                                                : 'startListening(' . $pertanyaan['id'] . ')' }}"
                                            class="flex items-center justify-center p-2 h-[60px] w-12 rounded-lg transition-all duration-200 {{ $isListening && $currentQuestionId === $pertanyaan['id'] 
                                                ? 'bg-red-500 hover:bg-red-600' 
                                                : 'bg-blue-500 hover:bg-blue-600' }} text-white shadow-sm hover:shadow-md"
                                        >
                                            <div class="flex flex-col items-center">
                                                <span class="text-lg {{ $isListening && $currentQuestionId === $pertanyaan['id'] ? 'animate-pulse' : '' }}">
                                                    🎤
                                                </span>
                                                @if($isListening && $currentQuestionId === $pertanyaan['id'])
                                                    <span class="relative flex h-2 w-2 mt-1">
                                                        <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
                                                        <span class="relative inline-flex rounded-full h-2 w-2 bg-red-500"></span>
                                                    </span>
                                                @endif
                                            </div>
                                        </button>
                                    </div>
                                </div>
                                </div>
                            @endforeach
                            
                            </div>
                        </div>
                    @endforeach

                    <!-- Navigation Controls -->
                    <div class="flex justify-between items-center pt-4">
                        @if($currentPage > 1)
                        <button wire:click="previousCard" class="px-6 py-2 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors">
                            السابق
                        </button>
                    @endif
                    
                    @if($currentPage < $totalPages)
                        <button wire:click="nextCard" class="px-6 py-2 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors">
                            التالي
                        </button>
                    @endif
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
    let recognition;
    if ('webkitSpeechRecognition' in window) {
        recognition = new webkitSpeechRecognition();
    } else if ('SpeechRecognition' in window) {
        recognition = new SpeechRecognition();
    } else {
        alert('متصفحك لا يدعم التعرف على الكلام');
        return;
    }

    recognition.continuous = false;
    recognition.interimResults = false;
    recognition.lang = 'ar-SA';

    Livewire.on('startRecognition', (data) => {
        const questionId = data.questionId;
        const textareaId = `answer-${questionId}`;
        recognition.start();
        recognition.onresult = function (event) {
            try {
                const transcript = event.results[0][0].transcript;
                const textareaElement = document.getElementById(textareaId);
                    if (textareaElement) {
                        textareaElement.value = transcript;
                    }

                // Dispatch the update-answer event to Livewire
                Livewire.dispatch('update-answer', {
                    questionId: questionId,
                    jawaban: transcript
                });
            } catch (error) {
                console.error('Error processing speech recognition result:', error);
                Livewire.dispatch('speech-error', { error: error.message });
            }
        };
    });

    Livewire.on('stopRecognition', () => {
        recognition.stop();
    });

    recognition.onerror = function (event) {
        console.error("Speech recognition error", event.error);
        Livewire.dispatch('speech-error', { error: event.error });
    };

    recognition.onend = function() {
        console.log('Speech recognition ended');
        Livewire.dispatch('recognition-ended');
    };
});

// Your existing sound playback code remains unchanged
document.addEventListener('livewire:initialized', () => {
    const audio = new Audio();
    
    Livewire.on('putar-suara', (data) => {
        audio.src = data.benar ? 
            "/sound/correct.mp3" : 
            "/sound/wrong.mp3";
            
        audio.currentTime = 0;
        
        audio.play().catch(error => {
            console.log("Audio playback failed:", error);
        });
    });
});
    </script>
</div>