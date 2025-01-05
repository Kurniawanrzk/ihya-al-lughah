@extends('layout.layout')

@section('title', 'Maharah Qiraah')
@section('content')
<div class="container mt-4">
    <h2 class="text-center text-primary">Maharah Qiraah</h2>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 mt-4 justify-content-center">
        @foreach($qiraahBab as $bab)
        <div class="col mb-4">
            <div class="card h-100">
                <img src="{{ $bab->thumbnail }}" class="card-img-top" alt="{{ $bab->nama_bab }}">
                <div class="card-body">
                    <h5 class="card-title">{{ $bab->nama_bab }}</h5>
                    <p class="card-text">{{ $bab->deskripsi_bab }}</p>
                    <a href="{{ route('qiraah_index', $bab->id) }}" class="btn btn-primary">Buka Bab {{ $bab->nomor_bab }}</a>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection
