<!-- resources/views/livewire/partials/conversation-content.blade.php -->
<div class="space-y-4">
    <div class="bg-gray-50 p-4 rounded-lg">
        <div class="text-right" dir="rtl">
            <h2 class="text-xl font-bold mb-4" style="font-family: 'Traditional Arabic', serif;">
                المحادثة {{ $soal['nomor'] }}
            </h2>
            <div class="space-y-2 text-lg" style="font-family: 'Traditional Arabic', serif;">
                {!! nl2br(e($soal['percakapan'])) !!}
            </div>
        </div>
    </div>
</div>