@extends("layout.layout")

@section("css")
<style>
.text-sm.text-gray-700 {
    display: none;
}

</style>
@endsection
@section("title", "Halaman ")
@section('content')
<livewire:qiraah-konten-isi :konten_qiraah="$konten_qiraah" />
@endsection

@section("javascript")
<script src="https://code.responsivevoice.org/responsivevoice.js?key=dTNFfN3Z"></script>
<script src="{{asset("js/sound.js")}}"></script>
@endsection