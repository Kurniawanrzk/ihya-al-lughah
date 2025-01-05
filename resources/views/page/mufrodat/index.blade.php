@extends("layout.layout")

@section("title", "Halaman Belajar Qiraah")
@section('content')
    {{-- <div class="d-flex row row-cols-2 m-3 justify-content-between">
        <div class="col">
            <h2 class="text-primary">Qiraah</h2>
        </div>
        <div class="col d-flex justify-content-end">
            <div class="d-flex gap-1">
                <select class="form-control rounded-0 shadow-sm border">
                    <option value="" class="rounded-0">Tema Materi</option>
                </select>
                <select class="form-control rounded-0 shadow-sm border">
                    <option value="" class="rounded-0">Belum Dikerjakan</option>
                </select>
            </div>
        </div>
    </div> --}}
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 justify-content-center gap-3 mt-4">
        @foreach($qiraah as $q)
        <div class="col w-auto m-1 rounded pe-auto position-relative shadow-sm card col-5">
            <a class="position-absolute w-100 h-100 start-0 rounded" href="{{Route("qiraah_index", $q['nama_qiraah'])}}"></a>
            <div class="d-sm-block">
                <div class="">
                    <center>
                        <img height="150" class="object-fit-cover m-1 border rounded" style="width:250px" src="{{ $q['thumbnail'] }}" alt="thumbnail qiraah materi">
                    </center>
                </div>
                <div class="">
                    <span class="fs-5 d-block fw-bold">{{ ucfirst($q['nama_qiraah']) }}</span>
                    <span class="fs-6 lead d-block" style="width:220px">{{ $q["deskripsi"] }}</span>
                    <div class="tag mt-2 mb-2">
                        @foreach(explode(',', $q['keys']) as $k) 
                        <span class="border border-primary text-primary p-1 rounded" style="font-size: 11px;">{{ $k }}</span>
                        @endforeach
                    </div>
                    <span class="text-success fs-6 small">{{$q['presentase']}}%</span>
                </div>
            </div>
            <div class="pb-3">
                <div style="width:100%;height:fit-content;" class="border border-success rounded m-1">
                    <div  style="width:{{$q['presentase']}}%;height:6px;" class="bg-primary rounded"></div>
                </div>
            </div>
        </div>
        @endforeach

    </div>
@endsection