@extends('layout.layout')

@section('title', 'Halaman Belajar Qiraah')
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

    <div class="container">
        <div class="col ps-5">
            @if (auth()->user() !== null)
                <h5>Halo {{ auth()->user()->name }}, ayo mulai belajar!</h5>
            @else
                <h5>Halo {{ session('guest_id') }}, ayo mulai belajar!</h5 @endif
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 justify-content-center gap-3 mt-4">
            <div class="card d-grid" style="width: 18rem;">
                <img src="{{ asset('img/maharah-kalam.svg') }}" class="card-img-top" height="200" alt="...">
                <div class="card-body align-self-end">
                    <h5 class="card-title">Mufrodat</h5>
                    <p class="card-text">Tingkatkan kemampuan berbicara Anda dalam bahasa Arab melalui latihan interaktif
                        dan panduan khusus yang dirancang untuk semua level.</p>
                    <div class="d-grid">
                        <a href="{{ Route('list_qiraah_index') }}" class="btn btn-primary">Buka Sekarang</a>
                    </div>
                </div>
            </div>
            <div class="card d-grid" style="width: 18rem;">
                <img src="{{ asset('img/maharah-kalam.svg') }}" class="card-img-top" height="200" alt="...">
                <div class="card-body align-self-end">
                    <h5 class="card-title">Maharah Kalam</h5>
                    <p class="card-text">Tingkatkan kemampuan berbicara Anda dalam bahasa Arab melalui latihan interaktif
                        dan panduan khusus yang dirancang untuk semua level.</p>
                    <div class="d-grid">
                        <a href="#" class="btn btn-primary">Buka Sekarang</a>
                    </div>
                </div>
            </div>
            <div class="card d-grid" style="width: 18rem;">
                <img src="{{ asset('img/maharah-qiraah.svg') }}" class="card-img-top" height="200" alt="...">
                <div class="card-body align-self-end">
                    <h5 class="card-title">Maharah Qiraah</h5>
                    <p class="card-text"> Asah keterampilan membaca Anda dengan materi bahasa Arab yang menarik dan latihan
                        evaluasi mandiri.</p>
                    <div class="d-grid">
                        <a href="{{ Route('qiraahBab_index') }}" class="btn btn-primary">Buka Sekarang</a>
                    </div>
                </div>
            </div>
            <div class="card d-grid" style="width: 18rem;">
                <img src="{{ asset('img/latihan.svg') }}" class="card-img-top" height="200" alt="...">
                <div class="card-body align-self-end">
                    <h5 class="card-title">Latihan Soal</h5>
                    <p class="card-text">Uji kemampuan Anda melalui berbagai soal pilihan ganda dan tantangan menarik untuk
                        memperkuat pemahaman.</p>
                    <div class="d-grid">
                        <a href="#" class="btn btn-primary">Buka Sekarang</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
