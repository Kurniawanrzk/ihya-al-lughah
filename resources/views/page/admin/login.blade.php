<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Login Admin Page</title>
</head>
<body style="background-color: rgb(240, 240, 240)"> 
    <div class="container" style="height: 100vh">
        <div class="row d-flex justify-content-center align-items-center" style="padding-top:150px">
            @if(session('status'))
                <div class="alert alert-danger" role="alert">
                    {{ session('status') }}
                </div>
            @endif 
            <div class="col col-6 border bg-light rounded">
                <form class="p-5" method="POST" action="{{ Route("login_admin_post") }}"> 
                    @method("POST")
                    @csrf
                    <h4>Halaman Login Admin</h5>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input name="email" type="email" class="form-control" id="email" placeholder="Masukkan email Anda" aria-describedby="emailHelp">
                        <div id="emailHelp" class="form-text">Kami tidak akan membagikan email Anda kepada siapa pun.</div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input name="password" type="password" class="form-control" id="password" placeholder="Masukkan password Anda">
                    </div>
                    <button type="submit" class="btn btn-primary">Masuk</button>
                </form>
            </div>
        </div>
    </div>
    <script src="{{asset('js/bootstrap.bundle.min.js')}}"><
</html>
