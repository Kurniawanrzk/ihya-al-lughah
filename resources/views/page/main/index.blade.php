@extends("layout.layout")

@section("title", "Halaman Belajar Qiraah")
@section('content')
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-blue-600 to-indigo-600 rounded-2xl p-8 mb-12 text-white">
        <div class="max-w-3xl">
            <h1 class="text-3xl font-bold mb-4">
                Halo {{ auth()->user() !== null ? auth()->user()->name : session("guest_id") }}! 👋
            </h1>
            <p class="text-xl text-blue-100 mb-6">Mari tingkatkan kemampuan bahasa Arab Anda hari ini.</p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-8">
                <div class="bg-white/10 backdrop-blur rounded-lg p-4">
                    <div class="text-3xl font-bold">0</div>
                    <div class="text-blue-100">Materi Selesai</div>
                </div>
                <div class="bg-white/10 backdrop-blur rounded-lg p-4">
                    <div class="text-3xl font-bold">0%</div>
                    <div class="text-blue-100">Progress Belajar</div>
                </div>
                <div class="bg-white/10 backdrop-blur rounded-lg p-4">
                    <div class="text-3xl font-bold">0</div>
                    <div class="text-blue-100">Latihan Selesai</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Learning Paths Section -->
    <div class="mb-12">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">Jalur Pembelajaran</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- Mufrodat Card -->
            <div class="bg-white rounded-xl shadow-sm hover:shadow-md transition-all duration-200 overflow-hidden">
                <div class="aspect-video overflow-hidden bg-blue-50 relative">
                    <img 
                        src="{{ asset('img/maharah-kalam.svg') }}" 
                        class="w-full h-full object-cover transform hover:scale-105 transition-transform duration-300"
                        alt="Mufrodat"
                    >
                    <div class="absolute top-3 right-3 bg-green-500 text-white text-xs px-2 py-1 rounded-full">
                        Pemula
                    </div>
                </div>
                <div class="p-6 space-y-4">
                    <h3 class="text-xl font-bold text-gray-800">Mufrodat</h3>
                    <p class="text-gray-600 text-sm">
                        Tingkatkan kemampuan berbicara Anda dalam bahasa Arab melalui latihan interaktif.
                    </p>
                    <div class="space-y-3">
                        <div class="flex justify-between text-sm">
                            <span class="text-gray-600">Progress</span>
                            <span class="text-blue-600 font-medium">0%</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2">
                            <div class="bg-blue-600 h-2 rounded-full" style="width: 0%"></div>
                        </div>
                    </div>
                    <a 
                        href="{{ Route('list_mufrodat_index') }}" 
                        class="block w-full py-2 px-4 bg-blue-600 hover:bg-blue-700 text-white text-center rounded-lg transition-colors duration-200"
                    >
                        Mulai Belajar
                    </a>
                </div>
            </div>

            <!-- Other cards with similar structure... -->
            <!-- Copy the same structure for other cards (Maharah Kalam, Qiraah, etc.) -->
            
        </div>
    </div>

    <!-- Quick Start Guide -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
        <div class="bg-white p-6 rounded-xl shadow-sm">
            <h3 class="text-xl font-bold text-gray-800 mb-4">Tips Memulai 💡</h3>
            <ul class="space-y-4">
                <li class="flex items-start gap-3">
                    <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 font-bold">1</div>
                    <div>
                        <h4 class="font-medium">Mulai dari Mufrodat</h4>
                        <p class="text-gray-600 text-sm">Pelajari kosakata dasar untuk membangun fondasi yang kuat</p>
                    </div>
                </li>
                <li class="flex items-start gap-3">
                    <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 font-bold">2</div>
                    <div>
                        <h4 class="font-medium">Latihan Setiap Hari</h4>
                        <p class="text-gray-600 text-sm">Konsistensi adalah kunci dalam belajar bahasa</p>
                    </div>
                </li>
                <li class="flex items-start gap-3">
                    <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 font-bold">3</div>
                    <div>
                        <h4 class="font-medium">Evaluasi Kemampuan</h4>
                        <p class="text-gray-600 text-sm">Lakukan latihan soal untuk mengukur pemahaman</p>
                    </div>
                </li>
            </ul>
        </div>

        <!-- Quick Actions -->
        <div class="bg-white p-6 rounded-xl shadow-sm">
            <h3 class="text-xl font-bold text-gray-800 mb-4">Aksi Cepat 🚀</h3>
            <div class="grid grid-cols-2 gap-4">
                <button class="p-4 border-2 border-gray-100 rounded-lg hover:border-blue-200 hover:bg-blue-50 transition-all text-left">
                    <div class="font-medium">Latihan Terbaru</div>
                    <div class="text-sm text-gray-600">Lanjutkan progres Anda</div>
                </button>
                <button class="p-4 border-2 border-gray-100 rounded-lg hover:border-blue-200 hover:bg-blue-50 transition-all text-left">
                    <div class="font-medium">Kosakata Harian</div>
                    <div class="text-sm text-gray-600">Pelajari kata baru</div>
                </button>
                <button class="p-4 border-2 border-gray-100 rounded-lg hover:border-blue-200 hover:bg-blue-50 transition-all text-left">
                    <div class="font-medium">Lihat Progress</div>
                    <div class="text-sm text-gray-600">Pantau perkembangan</div>
                </button>
                <button class="p-4 border-2 border-gray-100 rounded-lg hover:border-blue-200 hover:bg-blue-50 transition-all text-left">
                    <div class="font-medium">Game Edukasi</div>
                    <div class="text-sm text-gray-600">Belajar sambil bermain</div>
                </button>
            </div>
        </div>
    </div>
</div>
@endsection