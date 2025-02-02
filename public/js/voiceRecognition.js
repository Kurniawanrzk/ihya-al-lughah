const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition,
      CorrectAudio = document.getElementById("correctAudio"),
      ActiveMic = document.getElementById("activeMicAudio"),
      WrongAudio = document.getElementById("wrongAudio"),
      Status = document.getElementById("status")


function playActiveMicAudio() {
    if (ActiveMic) {
        ActiveMic.play();
    } else {
        console.warn('ActiveMic audio not found');
    }
}

function playCorrectAudio() {
    if (CorrectAudio) {
        CorrectAudio.play();
    } else {
        console.warn('CorrectAudio not found');
    }
}

function playWrongAudio() {
    if (WrongAudio) {
        WrongAudio.play();
    } else {
        console.warn('wrongAudio not found');
    }
}

// sistem kendali dari robot, functionality dari robot
// rencana perilaku robot yang lama dan yang baru

function levenshteinDistance(str1, str2) {
    const len1 = str1.length;
    const len2 = str2.length;
    const matrix = [];

    // Buat matriks awal
    for (let i = 0; i <= len1; i++) {
        matrix[i] = [i];
    }
    for (let j = 0; j <= len2; j++) {
        matrix[0][j] = j;
    }

    // Hitung Levenshtein Distance
    for (let i = 1; i <= len1; i++) {
        for (let j = 1; j <= len2; j++) {
            if (str1.charAt(i - 1) === str2.charAt(j - 1)) {
                matrix[i][j] = matrix[i - 1][j - 1]; // Tidak ada perubahan
            } else {
                matrix[i][j] = Math.min(
                    matrix[i - 1][j - 1] + 1, // Ganti karakter
                    matrix[i][j - 1] + 1,     // Tambah karakter
                    matrix[i - 1][j] + 1      // Hapus karakter
                );
            }
        }
    }
    
    return matrix[len1][len2];
}

function areStringsSimilar(string1, string2, threshold = 0.8) {
    const distance = levenshteinDistance(string1, string2);
    const maxLength = Math.max(string1.length, string2.length);

    // Persentase kemiripan (1 - jarak / panjang string terpanjang)
    const similarity = 1 - (distance / maxLength);

    // Kembalikan true jika kemiripan di atas ambang batas (threshold)
    return similarity >= threshold;
}

function startRecognition(expectedText, delay = 3000) {
    playActiveMicAudio();
    expectedText = ArabicServices.removeTashkeel(expectedText);

    setTimeout(() => {
        if (SpeechRecognition) {
            const recognition = new SpeechRecognition();
            recognition.lang = 'ar';
            recognition.interimResults = false;
            recognition.maxAlternatives = 1;

            recognition.start();

            recognition.onresult = (event) => {
                const spokenText = ArabicServices.removeTashkeel(event.results[0][0].transcript.trim().replace(".",""));
                console.log('You said:', spokenText);
                
                if ( areStringsSimilar(spokenText, expectedText)) {
                    console.log('Correct!');
                    playCorrectAudio();  // Play correct feedback audio
                    Status.innerHTML = "<span style='color:green'>Penyebutan Benar</span>"
                } else {
                    console.log(`Expected: "${expectedText}", but heard: "${spokenText}". Try again.`);
                    playWrongAudio()
                    Status.innerHTML = `<span style='color:red'>Penyebutan Salah</span> kamu berbicara : ${spokenText}`
                }
            };

            recognition.onerror = (event) => {
                handleError(event.error);
            };

            recognition.onspeechend = () => {
                recognition.stop();  // Stop recognition when speech ends
            };

        } else {
            console.error('SpeechRecognition API is not supported in this browser.');
        }
    }, delay); // Delay before starting recognition
}

function handleError(error) {
    switch (error) {
        case 'no-speech':
            console.error('No speech was detected. Please try again.');
            break;
        case 'audio-capture':
            console.error('No microphone was found. Ensure that a microphone is connected.');
            break;
        case 'not-allowed':
            console.error('Permission to use the microphone is blocked. Please enable it in the browser settings.');
            break;
        default:
            console.error('Speech recognition error:', error);
    }
}

