@extends("layout.layout")

@section("title", "Halaman Belajar Latihan")
@section('content')
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-blue-600 to-indigo-600 rounded-2xl p-8 mb-12 text-white">
        <div class="max-w-3xl">
            <h1 class="text-3xl font-bold mb-4">Latihan Soal Qiraah Bahasa Arab</h1>
            <p class="text-xl text-blue-100 mb-6">Perkuat kosakata bahasa Arab Anda melalui pembelajaran sistematis dan terstruktur.</p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-8">
                <div class="bg-white/10 backdrop-blur rounded-lg p-4">
                    <div class="text-3xl font-bold">{{ count($latihan) }}</div>
                    <div class="text-blue-100">Total Bab</div>
                </div>
            
            </div>
        </div>
    </div>

    <!-- Learning Guide -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
        <div class="md:col-span-2 bg-white p-6 rounded-xl shadow-sm">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Panduan Belajar Latihan</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-4">
                    <div class="flex items-start gap-3">
                        <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 font-bold">1</div>
                        <div>
                            <h4 class="font-medium">Pelajari Dasar</h4>
                            <p class="text-gray-600 text-sm">Mulai dari bab pertama untuk memahami mufradat dasar</p>
                        </div>
                    </div>
                    <div class="flex items-start gap-3">
                        <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 font-bold">2</div>
                        <div>
                            <h4 class="font-medium">Latihan Pengucapan</h4>
                            <p class="text-gray-600 text-sm">Dengarkan dan tirukan cara pengucapan yang benar</p>
                        </div>
                    </div>
                </div>
                <div class="space-y-4">
                    <div class="flex items-start gap-3">
                        <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 font-bold">3</div>
                        <div>
                            <h4 class="font-medium">Uji Pemahaman</h4>
                            <p class="text-gray-600 text-sm">Selesaikan latihan di setiap akhir bab</p>
                        </div>
                    </div>
                    <div class="flex items-start gap-3">
                        <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 font-bold">4</div>
                        <div>
                            <h4 class="font-medium">Review Berkala</h4>
                            <p class="text-gray-600 text-sm">Ulangi pembelajaran secara rutin untuk menguatkan ingatan</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-sm">
            <h3 class="text-xl font-bold text-gray-800 mb-4">Tips Belajar 💡</h3>
            <ul class="space-y-3">
                <li class="flex items-center gap-2">
                    <span class="w-2 h-2 bg-blue-500 rounded-full"></span>
                    <span class="text-gray-600 text-sm">Belajar 30 menit setiap hari</span>
                </li>
                <li class="flex items-center gap-2">
                    <span class="w-2 h-2 bg-blue-500 rounded-full"></span>
                    <span class="text-gray-600 text-sm">Catat mufradat baru</span>
                </li>
                <li class="flex items-center gap-2">
                    <span class="w-2 h-2 bg-blue-500 rounded-full"></span>
                    <span class="text-gray-600 text-sm">Praktikkan dalam jumlah (kalimat)</span>
                </li>
                <li class="flex items-center gap-2">
                    <span class="w-2 h-2 bg-blue-500 rounded-full"></span>
                    <span class="text-gray-600 text-sm">Gunakan aplikasi flashcard</span>
                </li>
            </ul>
        </div>
    </div>

    <!-- Latihan List Section -->
    <div class="mb-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">Daftar Bab Latihan</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            @foreach($latihan as $m)
            <div class="bg-white rounded-xl shadow-sm hover:shadow-md transition-all duration-200 overflow-hidden">
                <div class="aspect-video overflow-hidden bg-blue-50 relative">
                    <img
                        src="{{ $m['thumbnail'] }}"
                        class="w-full h-full object-cover transform hover:scale-105 transition-transform duration-300"
                        alt="thumbnail materi latihan qiraah"
                    >
                    <div class="absolute top-3 right-3 bg-blue-500 text-white text-xs px-2 py-1 rounded-full">
                        BAB {{ $m['urutan_bab'] }}
                    </div>
                </div>
                <div class="p-6 space-y-4">
                    <div class="space-y-2">
                        <h3 class="text-xl font-bold text-gray-800">{{ ucfirst($m['nama_latihan']) }}</h3>
                        <p class="text-gray-600 text-sm line-clamp-2">{{ $m['deskripsi'] }}</p>
                    </div>

                    <div class="flex flex-wrap gap-2">
                        @foreach(explode(',', $m['keys']) as $k)
                        <span class="text-xs px-2 py-1 rounded-full bg-blue-50 text-blue-600 border border-blue-200">
                            {{ $k }}
                        </span>
                        @endforeach
                    </div>

                    <a
                        href="{{ Route('isi_konten_latihan_kalam', $m['urutan_bab']) }}"
                        class="block w-full py-2 px-4 bg-blue-600 hover:bg-blue-700 text-white text-center rounded-lg transition-colors duration-200"
                    >
                        Mulai Belajar
                    </a>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
@endsection
