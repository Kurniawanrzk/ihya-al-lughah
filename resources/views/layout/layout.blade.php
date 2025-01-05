<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'My Laravel App')</title>
    
    <link rel="stylesheet" href="{{asset("css/bootstrap.min.css")}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    @yield("css")
    @livewireStyles
</head>
<body style="background-color:#ECF0F3">
    <header class="p-3 mb-3 border-bottom bg-primary">
        <div class="container">
          <div class="d-flex flex-wrap align-items-center gap-3 justify-content-center justify-content-lg-start">
            <a href="{{ Route("index") }}" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
              <img src="{{asset("img/logo.svg")}}" width="80" alt="">
            </a>
    
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
              <li><a href="{{ Route("index") }}" class="nav-link px-2 link-{{Route::currentRouteName() == "index" ? "light" : "dark"}}">Beranda</a></li>
              <li><a href="{{ Route("list_qiraah_index") }}" class="nav-link px-2 link-{{Route::currentRouteName() == "list_qiraah_index" || Route::currentRouteName() == "qiraah_index" || Route::currentRouteName() == "konten_qiraah_index" ? "light" : "dark"}}">Qiraah</a></li>
              <li><a href="#" class="nav-link px-2 link-dark">Kalam</a></li>
              <li><a href="#" class="nav-link px-2 link-dark">Latihan</a></li>
              <li><a href="#" class="nav-link px-2 link-dark">Game</a></li>
            </ul>
    
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
              <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
            </form>
    
            <div>
            <div class="dropdown text-end">
              <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://static.thenounproject.com/png/354384-200.png" alt="mdo" width="32" height="32" class="rounded-circle bg-light">
              </a>
              <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><hr class="dropdown-divider"></li>
                @if(auth()->user() == null)
                <li><a class="dropdown-item" href="{{ route('oauth.google') }}">Login Dengan Google</a></li>
                @else 
                <li><a class="dropdown-item" href="{{ route("logout") }}">Sign out</a></li>
                @endif
              </ul>
            </div>
          
            </div>
          </div>
        </div>
      </header>
    
    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    <main>
        <div class="container-fluid">
            @yield('content')
        </div>
    </main>

    <footer>
        {{-- <p>&copy; {{ date('Y') }} My Laravel App. All rights reserved.</p> --}}
    </footer>

    <script src="{{asset("js/bootstrap.bundle.min.js")}}"></script>
    @yield("javascript")
    @livewireScripts
    @include('sweetalert::alert')
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </body>
</html>