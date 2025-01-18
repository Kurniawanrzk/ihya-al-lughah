@extends("layout.layout")

@section("css")
<script src="https://cdn.tailwindcss.com"></script>

@endsection
@section("title", "Halaman Belajar Qiraah")
@section('content')
<livewire:isi-maharah-qiraah
    :qiraah="$qiraah"
    :isi_qiraah="$qiraahisi"
/>
@endsection

@section("javascript")

<script src="https://code.responsivevoice.org/responsivevoice.js?key=dTNFfN3Z"></script>
<script src="{{asset("js/sound.js")}}"></script>

@endsection
