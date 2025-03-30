<!-- resources/views/livewire/partials/progress-indicator.blade.php -->
<div class="fixed bottom-4 right-4 bg-white rounded-lg shadow-lg p-4">
    <div class="text-sm text-gray-600">
        <p>التقدم الكلي: {{ number_format(($currentPage / $totalPages) * 100, 0) }}%</p>
        @if($latihanKalamUser)
            <p>النتيجة الحالية: {{ number_format($latihanKalamUser->score ?? 0, 1) }}%</p>
        @endif
    </div>
</div>