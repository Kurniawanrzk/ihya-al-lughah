    <!-- resources/views/livewire/partials/audio-controls.blade.php -->
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
            <span>{{ $isListening && $currentQuestionId === $soal['id'] ? 'إيقاف التسجيل' : 'ابدأ التسجيل' }}</span>
            @if($isListening && $currentQuestionId === $soal['id'])
                <span class="relative flex h-2 w-2">
                    <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
                    <span class="relative inline-flex rounded-full h-2 w-2 bg-red-500"></span>
                </span>
            @endif
        </button>
    </div>

    <!-- Audio Preview -->
    @if(isset($audioRecordings[$soal['id']]))
        <div class="bg-gray-50 rounded-lg p-3">
            <audio 
                id="audio-preview-{{$soal['id']}}" 
                controls 
                src="{{ $audioRecordings[$soal['id']] ?? Storage::url($soal['user_answer']['audio_path']) }}"
                class="w-full"
            ></audio>
        </div>
        <button 
            id="save-audio-{{$soal['id']}}"
            wire:click="saveAudio({{ $soal['id'] }})"
            class="w-full px-4 py-2 bg-green-500 hover:bg-green-600 text-white rounded-lg transition-colors duration-200 shadow-md hover:shadow-lg"
        >
            حفظ التسجيل
        </button>
    @endif
</div>
