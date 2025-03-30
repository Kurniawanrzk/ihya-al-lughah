@extends("layout.layout")

@section("title", "Profil Latihan Qiraah")
@section('content')
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-blue-600 to-indigo-600 rounded-2xl p-8 mb-12 text-white">
        <div class="max-w-3xl">
            <h1 class="text-3xl font-bold mb-4">
                Profil {{ auth()->user() !== null ? auth()->user()->name : session("guest_id") }} 👋
            </h1>
            <p class="text-xl text-blue-100 mb-6">Hasil latihan Qiraah Anda sejauh ini.</p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-8">
                <div class="bg-white/10 backdrop-blur rounded-lg p-4">
                    <div class="text-3xl font-bold">{{ $totalLatihan ?? 0 }}</div>
                    <div class="text-blue-100">Total Latihan</div>
                </div>
                <div class="bg-white/10 backdrop-blur rounded-lg p-4">
                    <div class="text-3xl font-bold">{{ number_format($rataRataSkor ?? 0, 1) }}%</div>
                    <div class="text-blue-100">Rata-rata Skor</div>
                </div>
                <div class="bg-white/10 backdrop-blur rounded-lg p-4">
                    <div class="text-3xl font-bold">{{ $materiSelesai ?? 0 }}</div>
                    <div class="text-blue-100">Materi Selesai</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Latihan Qiraah Section -->
    <div class="mb-12">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">Hasil Latihan Qiraah</h2>
        
        @if(count($hasilQiraah ?? []) > 0)
            <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-semibold text-gray-800">Ringkasan Hasil</h3>
                    <span class="text-sm text-gray-500">Diperbarui: {{ now()->format('d M Y, H:i') }}</span>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                    <div class="bg-blue-50 rounded-lg p-4">
                        <div class="text-2xl font-bold text-blue-600">{{ count($hasilQiraah) }}</div>
                        <div class="text-sm text-gray-600">Total Latihan</div>
                    </div>
                    <div class="bg-green-50 rounded-lg p-4">
                        <div class="text-2xl font-bold text-green-600">{{ array_sum(array_column($hasilQiraah, 'jumlah_benar')) }}</div>
                        <div class="text-sm text-gray-600">Jawaban Benar</div>
                    </div>
                    <div class="bg-red-50 rounded-lg p-4">
                        <div class="text-2xl font-bold text-red-600">{{ array_sum(array_column($hasilQiraah, 'jumlah_salah')) }}</div>
                        <div class="text-sm text-gray-600">Jawaban Salah</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg p-4">
                        @php
                            $total = array_sum(array_column($hasilQiraah, 'total'));
                            $benar = array_sum(array_column($hasilQiraah, 'jumlah_benar'));
                            $akurasi = $total > 0 ? ($benar / $total) * 100 : 0;
                        @endphp
                        <div class="text-2xl font-bold text-purple-600">{{ number_format($akurasi, 1) }}%</div>
                        <div class="text-sm text-gray-600">Tingkat Akurasi</div>
                    </div>
                </div>
                
                <div class="space-y-3">
                    <div class="flex justify-between text-sm">
                        <span class="text-gray-600">Kemajuan Latihan</span>
                        <span class="text-blue-600 font-medium">{{ number_format($akurasi, 1) }}%</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2">
                        <div class="bg-blue-600 h-2 rounded-full" style="width: {{ $akurasi }}%"></div>
                    </div>
                </div>
            </div>
            
            <div class="bg-white rounded-xl shadow-sm overflow-hidden">
                <div class="p-6 border-b">
                    <h3 class="text-lg font-semibold text-gray-800">Riwayat Latihan Qiraah</h3>
                </div>
                
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Bab</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Deskripsi</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Benar</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Salah</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nilai Pilgan</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nilai Benar/Salah</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach($hasilQiraah as $hasil)
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $hasil['urutan_bab'] ?? 'N/A' }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $hasil['nama_latihan'] ?? 'N/A' }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $hasil['total'] }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $hasil['jumlah_benar'] }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $hasil['jumlah_salah'] }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ number_format($hasil['nilai_pilgan'], 1) }}%</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ number_format($hasil['nilai_benar_salah'], 1) }}%</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        @else
            <div class="bg-white rounded-xl shadow-sm p-8 text-center">
                <div class="inline-flex items-center justify-center w-16 h-16 bg-blue-100 rounded-full mb-4">
                    <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                </div>
                <h3 class="text-xl font-medium text-gray-900 mb-2">Belum Ada Latihan Qiraah</h3>
                <p class="text-gray-600 mb-6">Anda belum mengerjakan latihan Qiraah.</p>
                <a href="" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition-colors">
                    Mulai Latihan
                    <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                </a>
            </div>
        @endif
    </div>
</div>
@endsection