@extends('layout.layout')

@section('title', 'Halaman Latihan')

@section('content')
    <livewire:latihan 
    :jawaban_soal_latihan="$jawaban_soal_latihan" 
    :latihan="$latihan" 
    :jawaban_soal_benar_salah="$jawaban_soal_benar_salah" />
@endsection
