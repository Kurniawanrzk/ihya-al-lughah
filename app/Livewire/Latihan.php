<?php
namespace App\Livewire;

use Livewire\Component;
use App\Models\{HasilBenarSalah, HasilSoalLatihan, JawabanSoalLatihan, JawbanBenarSalah};
use RealRashid\SweetAlert\Facades\Alert;

class Latihan extends Component
{
    public $jawabanSoalLatihan;
    public $latihan;
    public $currentQuestion = 0;
    public $currentQuestionBenarSalah = 0;
    public $selectedAnswers = [];
    public $isFinished = false;
    public $isLatihan = true;
    public $isBenarSalah = false;
    public $jawabanSoalBenarSalah;
    public $selectedAnswersBenarSalah= [];
    public $totalSelectedAnswerElim = 0;
    public $benarSoalLatihan = [];
    public $benarSoalBenarSalah = [];
    
    public function mount($jawaban_soal_latihan, $latihan, $jawaban_soal_benar_salah)
    {
        $this->jawabanSoalLatihan = $jawaban_soal_latihan;
        $this->latihan = $latihan;
        $this->jawabanSoalBenarSalah = $jawaban_soal_benar_salah;
        
        // Get saved answers from session if they exist
        $savedAnswers = session('quiz_answers_' . $this->latihan->id, []);
        $savedAnswersBenarSalah = session('quiz_answers_benar_salah_' . $this->latihan->id, []);
        $savedBenarSoalLatihan = session('benar_soal_latihan_' . $this->latihan->id, []);
        $savedBenarSoalBenarSalah = session('benar_soal_benar_salah_' . $this->latihan->id, []);
        
        // Initialize arrays with saved values or empty defaults
        foreach ($this->jawabanSoalLatihan as $index => $soal) {
            $this->selectedAnswers[$index] = $savedAnswers[$index] ?? '';
            $this->benarSoalLatihan[$index] = $savedBenarSoalLatihan[$index] ?? [
                'benar' => '',
                'id' => ''
            ];
        }

        foreach($this->jawabanSoalBenarSalah as $index => $soal) {
            $this->selectedAnswersBenarSalah[$index] = $savedAnswersBenarSalah[$index] ?? '';
            $this->benarSoalBenarSalah[$index] = $savedBenarSoalBenarSalah[$index] ?? [
                'benar' => '',
                'id' => ''
            ];
        }

        // Restore total selected answers
        $this->totalSelectedAnswerElim = session('total_selected_answer_elim_' . $this->latihan->id, 0);
        
        // Restore current question positions
        $this->currentQuestion = session('current_question_' . $this->latihan->id, 0);
        $this->currentQuestionBenarSalah = session('current_question_benar_salah_' . $this->latihan->id, 0);
        
        // Restore quiz state
        $this->isLatihan = session('is_latihan_' . $this->latihan->id, true);
        $this->isBenarSalah = session('is_benar_salah_' . $this->latihan->id, false);
    }

    public function selectAnswer($questionIndex, $answerId)
    {
        $this->selectedAnswers[$questionIndex] = $answerId;
        if($this->totalSelectedAnswerElim != count($this->jawabanSoalLatihan) + count($this->jawabanSoalBenarSalah)) {
            $this->totalSelectedAnswerElim++;
        }
        
        $this->benarSoalLatihan[$questionIndex] = [
            "benar" => $this->jawabanSoalLatihan[$questionIndex]['id_jawaban_benar'] == $answerId ? 1 : 0,
            "id" => $answerId
        ];

        // Save to session
        session([
            'quiz_answers_' . $this->latihan->id => $this->selectedAnswers,
            'benar_soal_latihan_' . $this->latihan->id => $this->benarSoalLatihan,
            'total_selected_answer_elim_' . $this->latihan->id => $this->totalSelectedAnswerElim
        ]);

        $this->dispatch("putar-suara", benar: $this->jawabanSoalLatihan[$questionIndex]['id_jawaban_benar'] == $answerId ? 1 : 0);
    }

    public function selectAnswerBenarSalah($questionIndex, $answer) 
    {
        $this->selectedAnswersBenarSalah[$questionIndex] = $answer;
        if($this->totalSelectedAnswerElim != count($this->jawabanSoalLatihan) + count($this->jawabanSoalBenarSalah)) {
            $this->totalSelectedAnswerElim++;
        }
        
        $this->benarSoalBenarSalah[$questionIndex] = [
            "benar" => $this->jawabanSoalBenarSalah[$questionIndex]['benar'] == $answer ? 1 : 0,
            "id" => $answer
        ];

        // Save to session
        session([
            'quiz_answers_benar_salah_' . $this->latihan->id => $this->selectedAnswersBenarSalah,
            'benar_soal_benar_salah_' . $this->latihan->id => $this->benarSoalBenarSalah,
            'total_selected_answer_elim_' . $this->latihan->id => $this->totalSelectedAnswerElim
        ]);

        $this->dispatch("putar-suara", benar: $this->jawabanSoalBenarSalah[$questionIndex]['benar'] == $answer ? 1 : 0);
    }

    public function submitQuiz()
    {   
        $this->isFinished = true;
        
        // Clear session data after submission
        session()->forget([
            'quiz_answers_' . $this->latihan->id,
            'quiz_answers_benar_salah_' . $this->latihan->id,
            'benar_soal_latihan_' . $this->latihan->id,
            'benar_soal_benar_salah_' . $this->latihan->id,
            'total_selected_answer_elim_' . $this->latihan->id,
            'current_question_' . $this->latihan->id,
            'current_question_benar_salah_' . $this->latihan->id,
            'is_latihan_' . $this->latihan->id,
            'is_benar_salah_' . $this->latihan->id
        ]);

        // Rest of your existing submit logic...
        // [Previous submitQuiz code remains the same]
        $this->isFinished = true;
        $guestId = session("guest_id") ?? null;
        $userId = auth()->user() ? auth()->user()->id : null;
        $latihanId = $this->latihan->id;
        
        $hasilSoalLatihan = []; // Array to collect the records
        $hasilSoalBenarSalah = [];

        foreach($this->selectedAnswersBenarSalah as $index => $sa) {
            $soalBenarSalahId = $this->jawabanSoalBenarSalah[$index]['id'];

                $hasilSoalBenarSalah[] = [
                    'guest_id' => $guestId,
                    "user_id" => $userId,
                    "latihan_id" => $latihanId,
                    "soal_benar_salah_id" => $soalBenarSalahId,
                    "benar" => $this->benarSoalBenarSalah[$index]['benar'],
                    "created_at" => now(),
                    "updated_at" => now()
                ];
        }
        foreach ($this->selectedAnswers as $index => $sa) {
            $soalLatihanId = $this->jawabanSoalLatihan[$index]['id'];
            
            // Retrieve the correct answer from the model
            $jawabanSoal = JawabanSoalLatihan::find($sa);
            
            // If jawabanSoal is found, process the result
            if ($jawabanSoal) {
                $hasilSoalLatihan[] = [
                    'guest_id' => $guestId,
                    'user_id' => $userId,
                    'latihan_id' => $latihanId,
                    'soal_latihan_id' => $soalLatihanId,
                    'jawaban_latihan_id' => $sa,
                    'benar' => $jawabanSoal->benar,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }
        }

        // Insert all records in one query
        if (count($hasilSoalLatihan) > 0 || count($hasilSoalBenarSalah) > 0) {
            HasilSoalLatihan::insert($hasilSoalLatihan);
            HasilBenarSalah::insert($hasilSoalBenarSalah);
        }
    }

    public function benarSalah() 
    {
        $this->isBenarSalah = true;
        $this->isLatihan = false;
        session([
            'is_latihan_' . $this->latihan->id => false,
            'is_benar_salah_' . $this->latihan->id => true
        ]);
    }

    public function goToQuestion($index)
    {
        if (($index >= 0 && $index < count($this->jawabanSoalLatihan)) && $this->isLatihan) {
            $this->currentQuestion = $index;
            session(['current_question_' . $this->latihan->id => $index]);
        } else if(($index >= 0 && $index < count($this->jawabanSoalBenarSalah)) && $this->isBenarSalah) {
            $this->currentQuestionBenarSalah = $index;
            session(['current_question_benar_salah_' . $this->latihan->id => $index]);
        }
    }

    // Update nextQuestion and previousQuestion methods to save state
    public function nextQuestion()
    {
        if($this->isLatihan) {
            if ($this->currentQuestion < count($this->jawabanSoalLatihan) - 1) {
                $this->currentQuestion++;
                session(['current_question_' . $this->latihan->id => $this->currentQuestion]);
            }
        } else if($this->isBenarSalah) {
            if ($this->currentQuestionBenarSalah < count($this->jawabanSoalBenarSalah) - 1) {
                $this->currentQuestionBenarSalah++;
                session(['current_question_benar_salah_' . $this->latihan->id => $this->currentQuestionBenarSalah]);
            }
        }
    }

    public function previousQuestion()
    {
        if($this->isBenarSalah && $this->currentQuestionBenarSalah == 0) {
            $this->currentQuestionBenarSalah = 0;
            $this->currentQuestion = count($this->jawabanSoalLatihan);
            $this->isBenarSalah = false;
            $this->isLatihan = true;
            
            session([
                'current_question_benar_salah_' . $this->latihan->id => 0,
                'current_question_' . $this->latihan->id => count($this->jawabanSoalLatihan),
                'is_benar_salah_' . $this->latihan->id => false,
                'is_latihan_' . $this->latihan->id => true
            ]);
        }
        
        if($this->isLatihan) {
            if ($this->currentQuestion > 0) {
                $this->currentQuestion--;
                session(['current_question_' . $this->latihan->id => $this->currentQuestion]);
            }
        } else if($this->isBenarSalah) {
            if($this->currentQuestionBenarSalah > 0) {
                $this->currentQuestionBenarSalah--;
                session(['current_question_benar_salah_' . $this->latihan->id => $this->currentQuestionBenarSalah]);
            }
        }
    }

    public function render()
    {
        return view('livewire.latihan', [
            "currentQuestionBenarSalahData" => $this->jawabanSoalBenarSalah[$this->currentQuestionBenarSalah] ?? null,
            'currentQuestionData' => $this->jawabanSoalLatihan[$this->currentQuestion] ?? null,
            'totalQuestions' => count($this->jawabanSoalLatihan),
            "totalQuestionsBenarSalah" => count($this->jawabanSoalBenarSalah)
        ]);
    }
}


