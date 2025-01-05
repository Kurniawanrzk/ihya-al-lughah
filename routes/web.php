<?php

use App\Http\Controllers\{QiraahController, MainController, LatihanController, AuthController, OauthController};
use Illuminate\Support\Facades\Route;

Route::get('oauth/google', [\App\Http\Controllers\OauthController::class, 'redirectToProvider'])->name('oauth.google');  
Route::get('oauth/google/callback', [\App\Http\Controllers\OauthController::class, 'handleProviderCallback'])->name('oauth.google.callback');
Route::middleware(['guestMiddleware'])->group(function () {
    Route::get("/", [MainController::class, 'index'])->name("index");
    
    Route::prefix('qiraah')->group(function () {
        Route::get("/", [QiraahController::class, "index"])->name("list_qiraah_index");
        Route::get("/{nama_qiraah}", [QiraahController::class, "kontenQiraah"])->name("qiraah_index");
        Route::get("/{nama_qiraah}/{konten_qiraah}", [QiraahController::class, "isiKontenQiraah"])->name("konten_qiraah_index");
        Route::post("/attempt/{id_konten_qiraah}/", [QiraahController::class, "postAttemptQiraah"])->name("post_qiraah_attempt");
    });

    Route::prefix('latihan')->group(function() {
        Route::get("/", [LatihanController::class, "index"])->name("list_latihan_index");
        Route::get("{slug}", [LatihanController::class, 'isiKontenLatihan'])->name("isi_konten_latihan");
    });
    Route::get("/logout", [OauthController::class, 'logout'])->name("logout");
});