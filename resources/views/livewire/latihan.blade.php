<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    @if(!$isFinished)
        @if($isLatihan)
        <div class="grid grid-cols-1 md:grid-cols-12 gap-6">
            <!-- Card Soal -->
            <div class="md:col-span-9">
                <div class="bg-white rounded-xl shadow-sm p-6">
                    <!-- Nomor Soal -->
                    <div class="mb-6">
                        <h4 class="text-xl font-semibold {{
                            $benarSoalLatihan[$currentQuestion]['benar'] == 1 ? 'text-green-600' : 
                            ($benarSoalLatihan[$currentQuestion]['benar'] == 0 ? 'text-red-600' : 'text-gray-800')
                        }}" id="nomor_q_{{$currentQuestion}}">
                            Nomor: {{ $currentQuestionData['nomor'] }}
                        </h4>
                    </div>

                    <!-- Pertanyaan -->
                    <div class="mb-6">
                        <p class="text-lg {{
                            $benarSoalLatihan[$currentQuestion]['benar'] == 1 ? 'text-green-600' : 
                            ($benarSoalLatihan[$currentQuestion]['benar'] == 0 ? 'text-red-600' : 'text-gray-800')
                        }}">
                            {{ $currentQuestionData['pertanyaan'] }}
                        </p>
                    </div>

                    <!-- Pilihan Jawaban -->
                    <div class="space-y-4 pl-6">
                        @foreach($currentQuestionData['jawaban'] as $jawaban)
                        <div class="flex items-center">
                            <input class="w-4 h-4 text-blue-600 border-gray-300 focus:ring-blue-500" 
                                {{ '' !== $benarSoalLatihan[$currentQuestion]['benar'] ? 'disabled' : '' }}
                                type="radio" 
                                name="question_{{ $currentQuestion }}" 
                                id="answer_{{ $jawaban['id'] }}"
                                wire:click="selectAnswer({{ $currentQuestion }}, {{ $jawaban['id'] }})"
                                @if($selectedAnswers[$currentQuestion] == $jawaban['id']) checked @endif>
                            <label class="ml-3 text-gray-700" for="answer_{{ $jawaban['id'] }}">
                                {{ $jawaban['jawaban'] }}
                                @if($jawaban['benar'] == 1 && ($benarSoalLatihan[$currentQuestion]['benar'] != '')) 
                                    <i class="fa fa-check text-green-600 ml-2"></i>
                                @elseif($jawaban['benar'] == 0 && ($benarSoalLatihan[$currentQuestion]['benar'] != ''))
                                    <i class="fa fa-times text-red-600 ml-2"></i>
                                @endif
                            </label>
                        </div>
                        @endforeach
                    </div>

                    <!-- Navigation Buttons -->
                    <div class="flex justify-between mt-8">
                        <button 
                            class="px-4 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200"
                            wire:click="previousQuestion" 
                            @if($currentQuestion == 0) disabled @endif
                        >
                            Previous
                        </button>
                        @if($currentQuestion == $totalQuestions - 1)
                            <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-200"
                                wire:click="benarSalah">
                                Benar Salah
                            </button>
                        @else
                            <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-200"
                                wire:click="nextQuestion">
                                Next
                            </button>
                        @endif
                    </div>
                </div>
            </div>

            <!-- Nomor Soal Grid -->
            <div class="md:col-span-3">
                <div class="bg-white rounded-xl shadow-sm p-4">
                    <div class="grid grid-cols-4 gap-2">
                        @for($i = 0; $i < $totalQuestions; $i++)
                        <button 
                            wire:click="goToQuestion({{ $i }})"
                            class="aspect-square flex items-center justify-center text-lg font-medium rounded-lg transition-colors duration-200
                            {{ $currentQuestion == $i ? 'bg-blue-600 text-white' : 'bg-gray-100' }}
                            {{ isset($selectedAnswers[$i]) && $selectedAnswers[$i] !== '' && $benarSoalLatihan[$i]['benar'] == 1 
                                ? 'bg-green-600 text-white' 
                                : (isset($selectedAnswers[$i]) && $selectedAnswers[$i] !== '' && $benarSoalLatihan[$i]['benar'] == 0 
                                    ? 'bg-red-600 text-white' 
                                    : '') }}"
                        >
                            {{ $i + 1 }}
                        </button>
                        @endfor
                    </div>
                </div>
            </div>
        </div>
        @endif

        @if($isBenarSalah)
        <div class="grid grid-cols-1 md:grid-cols-12 gap-6">
            <!-- Card Soal Benar Salah -->
            <div class="md:col-span-9">
                <div class="bg-white rounded-xl shadow-sm p-6">
                    <div class="mb-6">
                        <h4 class="text-xl font-semibold {{
                            $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 1 ? 'text-green-600' : 
                            ($benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 0 ? 'text-red-600' : 'text-gray-800')
                        }}">
                            Nomor: {{ $currentQuestionBenarSalahData['nomor'] }}
                        </h4>
                    </div>

                    <div class="mb-6">
                        <p class="text-lg {{
                            $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 1 ? 'text-green-600' : 
                            ($benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 0 ? 'text-red-600' : 'text-gray-800')
                        }}">
                            {{ $currentQuestionBenarSalahData['pertanyaan'] }}
                        </p>
                    </div>

                    <div class="flex gap-6 pl-6">
                        <div class="flex items-center">
                            <input class="w-4 h-4 text-blue-600 border-gray-300 focus:ring-blue-500"
                                id="benar_salah_check_benar_{{$currentQuestionBenarSalah}}"
                                {{ '' !== $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] ? 'disabled' : '' }}
                                type="radio" 
                                wire:click="selectAnswerBenarSalah({{ $currentQuestionBenarSalah }}, {{ 1 }})"
                                name="question_benar_salah_{{ $currentQuestionBenarSalah }}" />
                            <label class="ml-3 text-gray-700">Benar</label>
                        </div>
                        <div class="flex items-center">
                            <input class="w-4 h-4 text-blue-600 border-gray-300 focus:ring-blue-500"
                                id="benar_salah_check_salah_{{$currentQuestionBenarSalah}}"
                                {{ '' !== $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] ? 'disabled' : '' }}
                                type="radio" 
                                wire:click="selectAnswerBenarSalah({{ $currentQuestionBenarSalah }}, {{ 0 }})"
                                name="question_benar_salah_{{ $currentQuestionBenarSalah }}" />
                            <label class="ml-3 text-gray-700">Salah</label>
                        </div>
                    </div>

                    <!-- Navigation Buttons -->
                    <div class="flex justify-between mt-8">
                        <button 
                            class="px-4 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200"
                            wire:click="previousQuestion" 
                            @if($currentQuestion == 0) disabled @endif
                        >
                            Previous
                        </button>
                        @if($currentQuestionBenarSalah == $totalQuestionsBenarSalah - 1)
                            <button 
                                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200"
                                @if($totalSelectedAnswerElim != $totalQuestions + $totalQuestionsBenarSalah) disabled @endif 
                                wire:click="submitQuiz"
                            >
                                Submit
                            </button>
                        @else
                            <button 
                                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-200"
                                wire:click="nextQuestion"
                            >
                                Next
                            </button>
                        @endif
                    </div>
                </div>
            </div>

            <!-- Nomor Soal Grid -->
            <div class="md:col-span-3">
                <div class="bg-white rounded-xl shadow-sm p-4">
                    <div class="grid grid-cols-4 gap-2">
                        @for($i = 0; $i < $totalQuestionsBenarSalah; $i++)
                        <button 
                            wire:click="goToQuestion({{ $i }})"
                            class="aspect-square flex items-center justify-center text-lg font-medium rounded-lg transition-colors duration-200
                            {{ $currentQuestionBenarSalah == $i ? 'bg-blue-600 text-white' : 'bg-gray-100' }}
                            {{ isset($selectedAnswersBenarSalah[$i]) && $selectedAnswersBenarSalah[$i] !== '' && $benarSoalBenarSalah[$i]['benar'] == 1 
                                ? 'bg-green-600 text-white' 
                                : (isset($selectedAnswersBenarSalah[$i]) && $selectedAnswersBenarSalah[$i] !== '' && $benarSoalBenarSalah[$i]['benar'] == 0 
                                    ? 'bg-red-600 text-white' 
                                    : '') }}"
                        >
                            {{ $i + 1 }}
                        </button>
                        @endfor
                    </div>
                </div>
            </div>
        </div>
        @endif
    @else
        <div class="bg-white rounded-xl shadow-sm p-8">
            <h3 class="text-2xl font-bold text-gray-800">Quiz Completed!</h3>
        </div>
    @endif
</div>

<script>
    document.addEventListener('livewire:initialized', () => {
        const audio = new Audio();
        
        Livewire.on('putar-suara', (data) => {
            audio.src = data.benar ? 
                "{{ asset('sound/correct.mp3') }}" : 
                "{{ asset('sound/wrong.mp3') }}";
                
            audio.currentTime = 0;
            
            audio.play().catch(error => {
                console.log("Audio playback failed:", error);
            });
        });
    });
</script>