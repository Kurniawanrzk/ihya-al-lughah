@extends('layout.layout')

@section('title', 'Halaman Latihan Maharah Kalam')

@section('content')
    <livewire:latihan-kalam :latihan="$latihan_kalam" />
@endsection
