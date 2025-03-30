<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Arabic Learning')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="{{asset("css/bootstrap.min.css")}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    @yield("css")
    @livewireStyles

    <style>
        .nav-link {
            transition: all 0.2s ease;
        }
        .nav-link:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen">
    <!-- Modern Header -->
    <header class="bg-white shadow-sm">
        <div class="container mx-auto">
            <div class="flex items-center justify-between p-4">
                {{-- <!-- Logo -->
                <a href="{{ Route('index') }}" class="flex items-center space-x-2">
                    <img src="{{asset('img/logo.svg')}}" width="60" alt="Logo" class="hover:opacity-80 transition-opacity">
                </a> --}}

                <!-- Navigation -->
                <nav class="hidden md:flex items-center space-x-6">
                    <a href="{{ Route('index') }}" 
                       class="nav-link px-3 py-2 rounded-lg {{ Route::currentRouteName() == 'index' ? 'bg-blue-50 text-blue-600' : 'text-gray-600 hover:text-blue-600' }}">
                        Beranda
                    </a>
                    <a href="{{ Route('list_qiraah_index') }}" 
                       class="nav-link px-3 py-2 rounded-lg {{ in_array(Route::currentRouteName(), ['list_qiraah_index', 'qiraah_index', 'konten_qiraah_index']) ? 'bg-blue-50 text-blue-600' : 'text-gray-600 hover:text-blue-600' }}">
                        Qiraah
                    </a>
                    <a href="{{ Route("list_kalam_index") }}" class="nav-link px-3 py-2 text-gray-600 hover:text-blue-600 rounded-lg">Kalam</a>
                    <a href="{{ Route("list_mufrodat_index") }}" class="nav-link px-3 py-2 text-gray-600 hover:text-blue-600 rounded-lg">Mufrodat</a>

                    <a href="{{ Route("list_latihan_qiraah_index") }}" class="nav-link px-3 py-2 text-gray-600 hover:text-blue-600 rounded-lg">Latihan Qiraah</a>
                    <a href="{{ Route("list_latihan_kalam_index") }}" class="nav-link px-3 py-2 text-gray-600 hover:text-blue-600 rounded-lg">Latihan Kalam</a>
                </nav>

                <!-- Right Section -->
                <div class="flex items-center space-x-4">
               

                    <!-- Profile Dropdown -->
                    <div class="relative">
                        <div class="dropdown">
                            <button class="flex items-center space-x-2 focus:outline-none" id="dropdownUser1" data-bs-toggle="dropdown">
                                <img src="https://static.thenounproject.com/png/354384-200.png" 
                                     alt="Profile" 
                                     class="w-10 h-10 rounded-full border-2 border-gray-200 hover:border-blue-400 transition-colors">
                            </button>
                            <ul class="dropdown-menu shadow-lg rounded-lg mt-2" aria-labelledby="dropdownUser1">
                                <li><a class="dropdown-item px-4 py-2 hover:bg-blue-50" href="{{ route('profil') }}">Profile</a></li>
                                <li><hr class="dropdown-divider"></li>
                                @if(auth()->user() == null)
                                    <li><a class="dropdown-item px-4 py-2 hover:bg-blue-50" href="{{ route('oauth.google') }}">Login Dengan Google</a></li>
                                @else 
                                    <li><a class="dropdown-item px-4 py-2 hover:bg-blue-50" href="{{ route('logout') }}">Sign out</a></li>
                                @endif
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Alert Messages -->
    @if(session('success'))
        <div class="max-w-4xl mx-auto mt-4 px-4">
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                <span class="block sm:inline">{{ session('success') }}</span>
            </div>
        </div>
    @endif

    @if(session('error'))
        <div class="max-w-4xl mx-auto mt-4 px-4">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                <span class="block sm:inline">{{ session('error') }}</span>
            </div>
        </div>
    @endif

    <!-- Main Content -->
    <main class="container mx-auto py-6">
        @yield('content')
    </main>

    <script src="{{asset('js/bootstrap.bundle.min.js')}}"></script>
    @yield("javascript")
    @livewireScripts
    @include('sweetalert::alert')
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>