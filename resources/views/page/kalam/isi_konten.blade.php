@extends("layout.layout")

@section("title", "Halaman Belajar Qiraah")
@section('content')
<livewire:isi-maharah-kalam
    :kalam="$kalam"
    :isi_kalam="$kalamisi"
/>
@endsection

@section("javascript")
<script src="https://code.responsivevoice.org/responsivevoice.js?key=dTNFfN3Z"></script>
<script src="{{asset("js/sound.js")}}"></script>
@endsection
