@extends("layout.layout")

@section("title", "Halaman ".$nama_qiraah)
@section('content')
<div class="card w-50 mx-auto mt-5 bg-primary p-4">
    <h5 style="color: white">{{ $nama_qiraah }}</h5>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 justify-content-center">
        @foreach($konten_qiraah as $kq)
        <div class="col w-auto bg-light m-1 rounded pe-auto position-relative">
            <a class="position-absolute w-100 h-100 start-0 rounded" href="{{ Route("konten_qiraah_index", [ 'nama_qiraah' => $nama_qiraah, 'konten_qiraah' => $kq['nama_konten_qiraah']]) }}"></a>
            @if($kq["status"])
            <i class="fs-4 fa fa-check-circle text-primary position-absolute end-1 mt-2" aria-hidden="true"></i>
            @endif
            <div class="text-center">
                <div class="">
                    <img width="200" height="100" class="m-1 border rounded" src="{{ $kq['thumbnail'] }}" alt="thumbnail qiraah materi">
                </div>
                <div class="">
                    <span class="fs-6 d-block">{{ $kq['nama_konten_qiraah'] }}</span>
                </div>
            </div>
          
        </div>
        @endforeach
        
    </div>
    
</div>

@endsection