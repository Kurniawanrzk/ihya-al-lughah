<div>
    <div class="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8">
        <div class="max-w-2xl mx-auto">
            <div class="bg-white rounded-xl shadow-xl overflow-hidden transform transition-all hover:scale-[1.02] duration-300">
                <div class="p-6 space-y-4">
                    <!-- Navigation Info -->
                    <div class="flex justify-between items-center mb-6">
                        <span class="text-sm text-gray-500">Soal {{ $currentPage }} dari {{ $totalPages }}</span>
                        <a href="{{ route('index') }}" class="px-4 py-2 text-sm text-gray-600 hover:text-gray-900 rounded-md hover:bg-gray-100">
                            خروج
                        </a>
                    </div>

                    <!-- Tab Navigation -->
                    <div class="flex space-x-4 border-b mb-6">
                        <button
                            wire:click="setActiveTab('cerita')"
                            class="px-4 py-2 -mb-px {{ $activeTab === 'cerita' ? 'border-b-2 border-blue-500 text-blue-600' : 'text-gray-500' }}"
                        >
                            Soal Cerita
                        </button>
                        <button
                            wire:click="setActiveTab('percakapan')"
                            class="px-4 py-2 -mb-px {{ $activeTab === 'percakapan' ? 'border-b-2 border-blue-500 text-blue-600' : 'text-gray-500' }}"
                        >
                            Soal Percakapan
                        </button>
                    </div>

                    @if($activeTab === 'cerita')
                        @foreach($soal_cerita as $soal)
                            <div class="space-y-6">
                                <!-- Image Container -->
                                <div class="relative aspect-video bg-gray-100 rounded-xl overflow-hidden shadow-inner">
                                    <img
                                        src="{{  $soal['gambar'] }}"
                                        alt="Ilustrasi soal"
                                        class="w-full h-full object-cover"
                                    >
                                </div>

                                <!-- Deskripsi Soal -->
                                @if($soal['cerita'])
                                <div >
                                            <h2  class="text-xl"
                                                style="font-family: 'Traditional Arabic', serif;text-align:left">
                                                {!! $soal['cerita'] !!}
                                            </h2>
                                        </div>
                                @endif

                                <!-- Questions Display (Read-only) -->
                              

                                <!-- Story Creation Input Section -->
                                <div class="mt-8 space-y-4">
                                    <div class="relative flex flex-col gap-4">
                                        <!-- Textarea -->
                                        <div class="w-full">
                                            <textarea
                                                wire:model="answers.{{ $soal['id'] }}"
                                                id="answer-{{ $soal['id'] }}"
                                                class="w-full border rounded-lg p-4 text-right min-h-[150px] resize-none shadow-sm focus:ring-2 focus:ring-blue-200 focus:border-blue-400"
                                                dir="rtl"
                                                placeholder="اكتب قصتك هنا..."
                                            ></textarea>
                                        </div>

                                        <!-- Audio Controls Section -->
                                        <div class="flex flex-col gap-3">
                                            <!-- Recording Button -->
                                            <div class="flex justify-center">
                                                <button
                                                    wire:click="{{ $isListening && $currentQuestionId === $soal['id']
                                                        ? 'stopListening'
                                                        : 'startListening(' . $soal['id'] . ', ' . $soal['id'] . ')' }}"
                                                    class="flex items-center justify-center px-6 py-3 rounded-lg transition-all duration-200
                                                    {{ $isListening && $currentQuestionId === $soal['id']
                                                        ? 'bg-red-500 hover:bg-red-600'
                                                        : 'bg-blue-500 hover:bg-blue-600' }} text-white shadow-md hover:shadow-lg gap-2"
                                                >
                                                    <span class="text-lg">🎤</span>
                                                    <span>{{ $isListening && $currentQuestionId === $soal['id'] ? 'Stop Merekam' : 'Mulai Merekam' }}</span>
                                                    @if($isListening && $currentQuestionId === $soal['id'])
                                                        <span class="relative flex h-2 w-2">
                                                            <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
                                                            <span class="relative inline-flex rounded-full h-2 w-2 bg-red-500"></span>
                                                        </span>
                                                    @endif
                                                </button>
                                            </div>

                                            <!-- Debugging Output -->
                                         

                                            <!-- Audio Preview and Save Button -->
                                            <div class="space-y-3">
                                                <div class="{{ isset($audioRecordingsCerita[$soal['id']]) ? 'block' : 'hidden' }} bg-gray-50 rounded-lg p-3">
                                                    <audio
                                                        id="audio-preview-cerita-{{$soal['id']}}"
                                                        controls
                                                        src="{{ isset($audioRecordingsCerita[$soal['id']]) ? $audioRecordingsCerita[$soal['id']] : '' }}"
                                                        class="w-full"
                                                    ></audio>
                                                </div>
                                                <button
                                                    wire:click="saveAudio({{$soal['id']}}, 'cerita')"
                                                    class="{{ isset($audioRecordingsCerita[$soal['id']]) ? 'block' : 'hidden' }} w-full px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg transition-colors duration-200 shadow-md hover:shadow-lg"
                                                >
                                                    حفظ التسجيل
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @else
                        @foreach($soal_percakapan as $soal)
                            <div class="space-y-6">
                                <!-- Nomor Percakapan -->
                                <div class="text-center">
                                    <h3 class="text-xl font-semibold text-gray-700 mb-2">
                                        المحادثة {{ $soal['nomor'] }}
                                    </h3>
                                </div>

                                <!-- Image Container -->
                                <div class="relative aspect-video bg-gray-100 rounded-xl overflow-hidden shadow-inner">
                                    <img
                                        src="{{  $soal['gambar']}}"
                                        alt="Ilustrasi percakapan"
                                        class="w-full h-full object-cover"
                                    >
                                </div>

                                <!-- Percakapan Content -->
                                <div class="bg-gray-50 p-6 rounded-lg">
                                    <div class="text-right" dir="rtl">
                                        <p class="text-xl leading-relaxed" style="font-family: 'Traditional Arabic', serif;">
                                            {!! nl2br(e($soal['percakapan'])) !!}
                                        </p>
                                    </div>
                                </div>

                                <!-- Audio Recording Section (similar to soal cerita) -->
                                <div class="mt-8 space-y-4">
                                    <div class="relative flex flex-col gap-4">
                                        <!-- Recording Button -->
                                        <div class="flex justify-center">
                                            <button
                                                wire:click="{{ $isListening && $currentQuestionId === $soal['id']
                                                    ? 'stopListening'
                                                    : 'startListening(' . $soal['id'] . ', ' . $soal['id'] . ')' }}"
                                                class="flex items-center justify-center px-6 py-3 rounded-lg transition-all duration-200
                                                {{ $isListening && $currentQuestionId === $soal['id']
                                                    ? 'bg-red-500 hover:bg-red-600'
                                                    : 'bg-blue-500 hover:bg-blue-600' }} text-white shadow-md hover:shadow-lg gap-2"
                                            >
                                                <span class="text-lg">🎤</span>
                                                <span>{{ $isListening && $currentQuestionId === $soal['id'] ? 'Stop Merekam' : 'Mulai Merekam' }}</span>
                                                @if($isListening && $currentQuestionId === $soal['id'])
                                                    <span class="relative flex h-2 w-2">
                                                        <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
                                                        <span class="relative inline-flex rounded-full h-2 w-2 bg-red-500"></span>
                                                    </span>
                                                @endif
                                            </button>
                                        </div>

                                        <!-- Audio Preview and Save Button -->
                                        <div class="space-y-3">
                                            <div class="{{ isset($audioRecordingsPercakapan[$soal['id']]) ? 'block' : 'hidden' }} bg-gray-50 rounded-lg p-3">
                                                <audio
                                                    id="audio-preview-percakapan-{{$soal['id']}}"
                                                    controls
                                                    src="{{ isset($audioRecordingsPercakapan[$soal['id']]) ? $audioRecordingsPercakapan[$soal['id']] : '' }}"
                                                    class="w-full"
                                                ></audio>
                                            </div>
                                            <button
                                                wire:click="saveAudio({{$soal['id']}}, 'percakapan')"
                                                class="{{ isset($audioRecordingsPercakapan[$soal['id']]) ? 'block' : 'hidden' }} w-full px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg transition-colors duration-200 shadow-md hover:shadow-lg"
                                            >
                                                حفظ التسجيل
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif

                    <!-- Navigation Controls -->
                    <div class="flex justify-between items-center pt-4">
                        @if($currentPage > 1)
                            <button wire:click="previousCard" class="px-6 py-2 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors">
                               Sebelumnya
                            </button>
                        @endif

                        @if($currentPage < $totalPages)
                            <button wire:click="nextCard" class="px-6 py-2 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors">
                                Selanjutnya
                            </button>
                        @else
                            <!-- Change "Next" button to "Selesai" when on the last card -->
                            <button wire:click="finish" class="px-6 py-2 bg-green-500 hover:bg-green-600 text-white rounded-md transition-colors">
                                Selesai
                            </button>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    let idSoalCeritaAPI = 0;
document.addEventListener('DOMContentLoaded', function () {
    let recognition;
    let mediaRecorders = {};  // Store multiple mediaRecorders
    let audioChunksMap = {};  // Store audio chunks for each recording
    let audioBlobMap = {};    // Store blobs for each recording

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

    Livewire.on('startRecognition', async (data) => {
        const questionId = data[0].questionId;
        const soalCeritaId = data[0].soalCeritaId;
        const textareaId = `answer-${questionId}`;
        idSoalCeritaAPI = data[0].questionId;

        try {
            const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
            mediaRecorders[soalCeritaId] = new MediaRecorder(stream);
            audioChunksMap[soalCeritaId] = [];

            mediaRecorders[soalCeritaId].ondataavailable = (event) => {
                audioChunksMap[soalCeritaId].push(event.data);
            };

            mediaRecorders[soalCeritaId].onstop = () => {
                audioBlobMap[soalCeritaId] = new Blob(audioChunksMap[soalCeritaId], { type: 'audio/mp3' });
                const audioURL = URL.createObjectURL(audioBlobMap[soalCeritaId]);

                const activeTab = document.querySelector('[wire\\:click^="setActiveTab"]').classList.contains('border-blue-500') ? 'cerita' : 'percakapan';
                const audioPreview = document.getElementById(`audio-preview-${activeTab}-${soalCeritaId}`);

                if (audioPreview) {
                    audioPreview.src = audioURL;
                    audioPreview.closest('div').classList.remove('hidden');
                }

                Livewire.dispatch('saveAudioTemp', {
                    data: {
                        soalCeritaId: soalCeritaId,
                        audioUrl: audioURL,
                        type: activeTab
                    }
                });
            };

            mediaRecorders[soalCeritaId].start();
        } catch (err) {
            console.error('Error accessing microphone:', err);
        }

        recognition.start();
        recognition.onresult = function (event) {
            try {
                const transcript = event.results[0][0].transcript;
                const textareaElement = document.getElementById(textareaId);
                if (textareaElement) {
                    textareaElement.value = transcript;
                }

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
        Object.values(mediaRecorders).forEach(recorder => {
            if (recorder && recorder.state === 'recording') {
                recorder.stop();
                recorder.stream.getTracks().forEach(track => track.stop());
            }
        });
        recognition.stop();
    });

    // Add this event listener
    Livewire.on('save-audio-js', (data) => {
        const soalId = data[0].soalId;
        const tipe = data[0].tipe;
        const userId = data[0].userId;

        const audioBlob = audioBlobMap[soalId];
        if (!audioBlob) {
            console.error('No audio blob found for this recording');
            return;
        }

        const formData = new FormData();
        formData.append('audio', audioBlob);
        formData.append('id_soal_cerita', soalId);
        formData.append('id', userId);
        formData.append('tipe', tipe);

        fetch('http://localhost:8000/api/save-audio', {
            method: 'POST',
            headers: {
                "Accept": "application/json",
            },
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            alert('Audio berhasil disimpan!');
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Gagal menyimpan audio!');
        });
    });

    recognition.onerror = function (event) {
        console.error("Speech recognition error", event.error);
        Livewire.dispatch('speech-error', { error: event.error });
    };

    recognition.onend = function () {
        console.log('Speech recognition ended');
        Livewire.dispatch('recognition-ended');
    };

    // Update the tab change handler
    Livewire.on('tab-changed', () => {
        // Clear all stored audio data
        mediaRecorders = {};
        audioChunksMap = {};
        audioBlobMap = {};

        // Stop any ongoing recordings
        Object.values(mediaRecorders).forEach(recorder => {
            if (recorder && recorder.state === 'recording') {
                recorder.stop();
                recorder.stream.getTracks().forEach(track => track.stop());
            }
        });

        // Clear audio previews for both tabs
        document.querySelectorAll('audio[id^="audio-preview-cerita-"], audio[id^="audio-preview-percakapan-"]').forEach(audio => {
            audio.src = '';
            audio.closest('div').classList.add('hidden');
        });

        // Clear all save buttons
        document.querySelectorAll('button[wire\\:click^="saveAudio"]').forEach(button => {
            button.classList.add('hidden');
        });

        // Revoke any existing object URLs
        Object.values(audioBlobMap).forEach(blob => {
            if (blob instanceof Blob) {
                URL.revokeObjectURL(URL.createObjectURL(blob));
            }
        });
    });
});
</script>
</div>
