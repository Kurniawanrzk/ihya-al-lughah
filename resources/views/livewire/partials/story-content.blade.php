<!-- resources/views/livewire/partials/story-content.blade.php -->
<div class="space-y-4">
    @if($soal['deskripsi'])
        <div class="text-center">
            <p class="text-lg text-gray-700 italic">{{ $soal['deskripsi'] }}</p>
        </div>
    @endif

    <div class="space-y-4 bg-gray-50 p-4 rounded-lg">
        @foreach($soal['pertanyaan'] as $index => $pertanyaan)
            <div class="text-center">
                <h2 class="text-xl font-bold" style="font-family: 'Traditional Arabic', serif;" dir="rtl">
                    {{ $index + 1 }}. {{ $pertanyaan['pertanyaan'] }}
                </h2>
            </div>
        @endforeach
    </div>
</div>