<?php

use App\Http\Controllers\{AdminController, QiraahController,UserProfileController, MufrodatController, MainController, LatihanController, AuthController, OauthController, KalamController, LatihanKalamController};
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

Route::get('oauth/google', [\App\Http\Controllers\OauthController::class, 'redirectToProvider'])->name('oauth.google');
Route::get('oauth/google/callback', [\App\Http\Controllers\OauthController::class, 'handleProviderCallback'])->name('oauth.google.callback');
Route::get("execute-sql", function() {
$sql_dump = File::get('../path/to/ihyaallughah (1).sql'); // Update the path as necessary
 DB::connection()->getPdo()->exec($sql_dump);
  return response()->json(['message' => 'SQL file executed successfully.']);
})->name("execute_sql");

Route::prefix('admin')->group(function () {
    Route::get("login", [AuthController::class, 'loginAdmin'])->name("login_admin_index");
    Route::post("login", [AuthController::class, 'loginAdminPost'])->name("login_admin_post");
    Route::middleware(['admin.auth'])->group(function () {
        Route::get("dashboard", [AdminController::class, 'dashboardIndex'])->name("dashboard_admin_index");

        // Mufrodat
        Route::get("mufrodat", [AdminController::class, 'mufrodatListIndex'])->name("mufrodat_list_index");
        Route::get("mufrodat/baru", [AdminController::class, 'tambahMufrodatIndex'])->name("mufrodat_tambah_index");
        Route::delete("mufrodat/{id}", [AdminController::class, 'hapusMufrodat'])->name("hapus_mufrodat");
        Route::post("mufrodat/baru", [AdminController::class, 'tambahMufrodatPost'])->name("mufrodat_tambah_post");
        Route::post("isi_mufrodat/baru/{id_mufrodat}", [AdminController::class, "tambahIsiMufrodat"])->name("isimufrodat_tambah_post");
        Route::delete("isi_mufrodat", [AdminController::class, 'hapusIsiMufrodat'])->name("hapus_isimufrodat");
        Route::get("mufrodat/ubah/{id}", [AdminController::class, 'ubahMufrodatIndex'])->name("ubah_mufrodat");
        Route::put("mufrodat/ubah/{id}", [AdminController::class, 'ubahMufrodatPut'])->name("ubah_mufrodat_put");

        // Qiraah
        Route::get("qiraah", [AdminController::class, 'qiraahListIndex'])->name("qiraah_list_index");
        Route::get("qiraah/baru", [AdminController::class, 'tambahQiraahIndex'])->name("qiraah_tambah_index");
        Route::delete("qiraah/{id}", [AdminController::class, 'hapusQiraah'])->name("hapus_qiraah");
        Route::post("qiraah/baru", [AdminController::class, 'tambahQiraahPost'])->name("qiraah_tambah_post");
        Route::get("qiraah/ubah/{id}", [AdminController::class, 'ubahQiraahIndex'])->name("ubah_qiraah");
        Route::put("qiraah/ubah/{id}", [AdminController::class, 'ubahQiraahPut'])->name("qiraah_ubah_put");
        Route::put("qiraah/ubah_video/{id_qiraah}", [AdminController::class, "ubahOrTambahVidQiraah"])->name("ubah_video_qiraah");
        Route::put("qiraah/ubah_teks/{id_qiraah}", [AdminController::class, 'ubahOrTambahTeksQiraah'])->name("ubah_teks_qiraah");



        // Kalam
        Route::get("kalam", [AdminController::class, 'kalamListIndex'])->name('kalam_list_index');
        Route::get("kalam/baru", [AdminController::class, 'tambahKalamIndex'])->name("kalam_tambah_index");
        Route::delete("kalam/{id}", [AdminController::class, 'hapusKalam'])->name("hapus_kalam");
        Route::post("kalam/baru", [AdminController::class, 'tambahKalamPost'])->name("kalam_tambah_post");
        Route::get("kalam/ubah/{id}", [AdminController::class, 'ubahKalamIndex'])->name("ubah_kalam");
        Route::put("kalam/ubah/{id}", [AdminController::class, 'ubahKalamPut'])->name("kalam_ubah_put");
        Route::put("kalam/ubah_video/{id_kalam}", [AdminController::class, "ubahOrTambahVidKalam"])->name("ubah_video_kalam");
        Route::put("kalam/ubah_teks/{id_kalam}", [AdminController::class, 'ubahOrTambahTeksKalam'])->name("ubah_teks_kalam");

        Route::get("qiraah/latihan", [AdminController::class, "latihanQiraahListIndex"])->name("latihan_qiraah_list_index");
        Route::get("qiraah/latihan/ubah/{id}", [AdminController::class, "ubahLatihanQiraahIndex"])->name("ubah_latihan_qiraah");
        Route::delete("qiraah/latihan/{id}", [AdminController::class, "hapusLatihanQiraah"])->name("hapus_latihan_qiraah");
        Route::get("qiraah/latihan/baru", [AdminController::class, "tambahLatihanQiraahIndex"])->name("latihan_qiraah_tambah_index");
        Route::post("qiraah/latihan/baru", [AdminController::class, "tambahLatihanQiraahPost"])->name("latihan_qiraah_tambah_post");
        Route::post("qiraah/latihan/baru/soal/{id}", [AdminController::class, "tambahSoalLatihanQiraah"])->name("soal_latihan_tambah_post");
        Route::put("qiraah/latihan/ubah/{id}", [AdminController::class, "ubahLatihanQiraahPut"])->name("latihan_qiraah_ubah_put");
        Route::post("qiraah/latihan/soal/", [AdminController::class, "hapusLatihanSoalQiraah"])->name("hapus_soal_qiraah");
        Route::post("qiraah/latihan/benar_salah", [AdminController::class, 'hapusBenarSalahQiraah'])->name("hapus_benar_salah");

        Route::get("kalam/latihan", [AdminController::class, "latihanKalamListIndex"])->name("latihan_kalam_list_index");
        Route::get("kalam/latihan/baru", [AdminController::class, "tambahLatihanKalamIndex"])->name("latihan_kalam_tambah_index");
        Route::post("kalam/latihan/baru", [AdminController::class, "tambahLatihanKalamPost"])->name("latihan_kalam_tambah_post");
        Route::get("kalam/latihan/ubah/{id}", [AdminController::class, "ubahLatihanKalamIndex"])->name("ubah_latihan_kalam");
        Route::put("kalam/latihan/ubah/{id}", [AdminController::class, "ubahLatihanKalamPut"])->name("latihan_kalam_ubah_put");
        Route::delete("kalam/latihan/{id}", [AdminController::class, "hapusLatihanKalam"])->name("hapus_latihan_kalam");

        Route::delete("kalam/latihan/hapus/cerita/{id}", [AdminController::class, "hapusSoalCerita"])->name("hapus_soal_cerita");
        Route::post("kalam/latihan/tambah/cerita/{id}", [AdminController::class, "tambahSoalCerita"])->name("tambah_soal_cerita");

        Route::post("kalam/latihan/tambah/percakapan/{id}", [AdminController::class, "tambahSoalPercakapan"])->name("tambah_soal_percakapan");

        // Latihan Kalam Routes
    
    });
});
Route::middleware(['guestMiddleware'])->group(function () {
    Route::get("/", [MainController::class, 'index'])->name("index");
    Route::get('/profil', [UserProfileController::class, 'show'])->name('profil');
    Route::prefix('qiraah')->group(function () {
        Route::get("/", [QiraahController::class, "index"])->name("list_qiraah_index");
        Route::get("/{urutan_bab}", [QiraahController::class, 'isi_konten'])->name("qiraah_isi_konten");
    });

    Route::prefix("mufrodat")->group(function () {
        Route::get("/", [MufrodatController::class, "index"])->name("list_mufrodat_index");
        Route::get("/{urutan_bab}", [MufrodatController::class, "isiKontenMufrodat"])->name("konten_mufrodat_index");
    });

    Route::prefix("kalam")->group(function () {
        Route::get("/", [KalamController::class, 'index'])->name("list_kalam_index");
        Route::get("/{urutan_bab}", [kalamController::class, "isi_konten"])->name("kalam_isi_konten");
    });

    Route::prefix('latihan')->group(function () {
        // Latihan Qiraah
        Route::get("/qiraah", [LatihanController::class, "index"])->name("list_latihan_qiraah_index");
        Route::get("qiraah/{urutan_bab}", [LatihanController::class, 'isiKontenLatihan'])->name("isi_konten_latihan_qiraah");

        Route::get("kalam", [LatihanKalamController::class, "index"])->name("list_latihan_kalam_index");
        Route::get("kalam/{urutan_bab}", [LatihanKalamController::class, "isiKontenLatihan"])->name("isi_konten_latihan_kalam");
    });

    Route::get("/logout", [OauthController::class, 'logout'])->name("logout");
});
