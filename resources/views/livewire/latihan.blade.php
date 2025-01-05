<!-- resources/views/livewire/latihan.blade.php -->
<div>
@if(!$isFinished)
  @if($isLatihan)
  <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 p-1 gap-3 justify-content-center">
    <div class="col col-sm col-md-8 card rounded-0 ps-1 shadow-sm">
          <div class="p-3">
              <h4 class="{{ $benarSoalLatihan[$currentQuestion]['benar'] == 1 ? 'text-success' : ($benarSoalLatihan[$currentQuestion]['benar'] == 0 ? 'text-danger' : '') }}" id="nomor_q_{{$currentQuestion}}">Nomor: {{ $currentQuestionData['nomor'] }}</h4>
          </div>
          <div class="col p-2">
              <p class="p-2 {{ $benarSoalLatihan[$currentQuestion]['benar'] == 1 ? 'text-success' : ($benarSoalLatihan[$currentQuestion]['benar'] == 0 ? 'text-danger' : '') }}">{{ $currentQuestionData['pertanyaan'] }}</p>
              <div class="col form-container ps-5 d-grid gap-3">
                  @foreach($currentQuestionData['jawaban'] as $jawaban)
                  <div class="form-check">
                      <input class="form-check-input" 
                             {{ '' !== $benarSoalLatihan[$currentQuestion]['benar']  ? 'disabled' : '' }}
                             type="radio" 
                             name="question_{{ $currentQuestion }}" 
                             id="answer_{{ $jawaban['id'] }}"
                             wire:click="selectAnswer({{ $currentQuestion }}, {{ $jawaban['id'] }})"
                             @if($selectedAnswers[$currentQuestion] == $jawaban['id']) checked @endif>
                      <label class="form-check-label" for="answer_{{ $jawaban['id'] }}">
                          {{ $jawaban['jawaban'] }} 
                          @if($jawaban['benar'] == 1 && ($benarSoalLatihan[$currentQuestion]['benar'] != '')) 
                            <i class="fa fa-check text-success" aria-hidden="true"></i>
                          @elseif($jawaban['benar'] == 0 && ($benarSoalLatihan[$currentQuestion]['benar'] != ''))
                          <i class="fa fa-times text-danger" aria-hidden="true"></i>
                          @endif
                      </label>
                  </div>
                  @endforeach
              </div>
          </div>
          <div class="p-3 d-flex justify-content-between">
              <button class="btn btn-secondary" wire:click="previousQuestion" @if($currentQuestion == 0) disabled @endif>
                  Previous
              </button>
              @if($currentQuestion == $totalQuestions - 1)
                  <button class="btn btn-primary" wire:click="benarSalah">Benar Salah</button>
              @else
                  <button class="btn btn-primary" wire:click="nextQuestion">Next</button>
              @endif
          </div>
      </div>
      <div class="col col-sm col-md-2 card rounded-0 shadow-sm" style="height: fit-content">
          <div class="row row-cols-4 text-center p-2">
              @for($i = 0; $i < $totalQuestions; $i++)
              <div class="border fs-5 p-3 {{ $currentQuestion == $i ? 'bg-primary text-white' : '' }} 
                         {{ isset($selectedAnswers[$i]) && $selectedAnswers[$i] !== '' && $benarSoalLatihan[$i]['benar'] == 1 ? 'bg-success text-white' : (isset($selectedAnswers[$i]) && $selectedAnswers[$i] !== '' && $benarSoalLatihan[$i]['benar'] == 0 ? 'bg-danger text-white' : '') }}"
                   wire:click="goToQuestion({{ $i }})">
                  {{ $i + 1 }}
              </div>
              @endfor
          </div>
      </div>
    </div>
  @endif

  @if($isBenarSalah)
  <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 p-1 gap-3 justify-content-center">
      <div class="col col-sm col-md-8 card rounded-0 ps-1 shadow-sm">
          <div class="p-3">
              <h4 class="{{ $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 1 ? 'text-success' : ($benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 0 ? 'text-danger' : '') }}" id="nomor_q_{{$currentQuestion}}">Nomor: {{ $currentQuestionBenarSalahData['nomor'] }}</h4>
          </div>
          <div class="col p-2">
              <p class="{{ $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 1 ? 'text-success' : ($benarSoalBenarSalah[$currentQuestionBenarSalah]['benar'] == 0 ? 'text-danger' : '') }} p-2">{{ $currentQuestionBenarSalahData['pertanyaan'] }}</p>
              <div class="col form-container ps-5 d-flex gap-3">
                  <div class="form-check">
                    <input class="form-check-input"
                            id="benar_salah_check_benar_{{$currentQuestionBenarSalah}}"
                             {{ '' !== $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar']  ? 'disabled' : '' }}
                             type="radio" 
                             wire:click="selectAnswerBenarSalah({{ $currentQuestionBenarSalah }}, {{ 1 }})"
                             name="question_benar_salah_{{ $currentQuestionBenarSalah }}" />
                    <label for="">Benar</label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input"
                            id="benar_salah_check_salah_{{$currentQuestionBenarSalah}}"
                             {{ '' !== $benarSoalBenarSalah[$currentQuestionBenarSalah]['benar']  ? 'disabled' : '' }}
                             type="radio" 
                             wire:click="selectAnswerBenarSalah({{ $currentQuestionBenarSalah }}, {{ 0 }})"
                             name="question_benar_salah_{{ $currentQuestionBenarSalah }}" />
                    <label for="">Salah</label>
                  </div>


              </div>
          </div>
          <div class="p-3 d-flex justify-content-between">
              <button class="btn btn-secondary" wire:click="previousQuestion" @if($currentQuestion == 0) disabled @endif>
                  Previous
              </button>
              @if($currentQuestionBenarSalah == $totalQuestionsBenarSalah - 1)
                  <button  class="btn btn-primary" @if($totalSelectedAnswerElim != $totalQuestions + $totalQuestionsBenarSalah) disabled @endif wire:click="submitQuiz">Submit</button>
              @else
                  <button class="btn btn-primary" wire:click="nextQuestion">Next</button>
              @endif
          </div>
      </div>
      <div class="col col-sm col-md-2 card rounded-0 shadow-sm" style="height: fit-content">
          <div class="row row-cols-4 text-center p-2">
              @for($i = 0; $i < $totalQuestionsBenarSalah; $i++)
              <div class="border fs-5 p-3 {{ $currentQuestionBenarSalah == $i ? 'bg-primary text-white' : '' }} 
                         {{ isset($selectedAnswersBenarSalah[$i]) && $selectedAnswersBenarSalah[$i] !== '' && $benarSoalBenarSalah[$i]['benar'] == 1 ? 'bg-success text-white' : (isset($selectedAnswersBenarSalah[$i]) && $selectedAnswersBenarSalah[$i] !== '' && $benarSoalBenarSalah[$i]['benar'] == 0 ? 'bg-danger text-white' : '') }}"
                   wire:click="goToQuestion({{ $i }})">
                  {{ $i + 1 }}
              </div>
              @endfor
          </div>
      </div>
  </div>
  @endif
  @else
  <div class="card p-4">
      <h3>Quiz Completed!</h3>
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