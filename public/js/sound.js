function textToSpeech(text) {
    if ('speechSynthesis' in window) {
        if (text.trim() === "") {
            alert("Harap masukkan teks untuk dibaca.");
            return;
        }

        // Buat instance SpeechSynthesisUtterance
        const utterance = new SpeechSynthesisUtterance(text);

        // Cari dan pilih suara Bahasa Arab
        const voices = speechSynthesis.getVoices();
        const arabicVoice = voices.find(voice => voice.lang === "ar-SA");

        if (arabicVoice) {
            utterance.voice = arabicVoice;
        } else {
            alert("Suara Bahasa Arab tidak tersedia di perangkat ini.");
        }

        // Set parameter tambahan (opsional)
        utterance.lang = "ar-SA"; // Set bahasa ke Arabic (Saudi Arabia)
        utterance.pitch = 1; // Nada
        utterance.rate = 1; // Kecepatan membaca

        // Mulai membaca teks
        speechSynthesis.speak(utterance);

    }
}