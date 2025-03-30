<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use League\Csv\Reader;
use League\Csv\Statement;


use App\Models\{LatihanQiraah, Mufrodat, SoalBenarSalah, KontenMufrodat, SoalPercakapan,IsiKontenMufrodat, Qiraah, Kalam, KalamIsi, IsiQiraah, SoalLatihan, JawabanSoalLatihan, LatihanKalam, SoalCerita};

class AdminController extends Controller
{
    public function dashboardIndex()
    {
        return view("page.admin.dashboard");
    }
    public function mufrodatListIndex()
    {
        $mufrodat = Mufrodat::all()->map(function ($mufrodat) {
            return [
                "id" => $mufrodat->id,
                "nama_materi" => $mufrodat->nama_materi,
                "urutan_bab" => $mufrodat->urutan_bab,
                "deskripsi" => $mufrodat->deskripsi,
                "thumbnail" => $mufrodat->thumbnail,
                "keys" => $mufrodat->keys,
                "isi_mufrodat" => IsiKontenMufrodat::where("id_mufrodat", $mufrodat->id)->get()->toArray()
            ];
        });

        return view("page.admin.mufrodat.mufrodat_list", compact("mufrodat"));
    }

    public function hapusMufrodat($id)
    {
        $mufrodat = Mufrodat::destroy($id);
        if ($mufrodat) {
            alert()->html('Berhasil', "Mufrodat Berhasil Dihapus", 'success');
            return redirect()->back();
        }
    }

    public function tambahMufrodatIndex()
    {
        return view("page.admin.mufrodat.tambah_mufrodat");
    }

    public function tambahMufrodatPost(Request $req)
    {
        if ($req->hasFile('thumbnail')) {
            $req->validate([
                'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            ]);

            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();

            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);

            $url = Storage::url($path);

            $mb = new Mufrodat;
            $mb->urutan_bab = $req->urutan_bab;
            $mb->nama_materi = $req->nama_materi;
            $mb->deskripsi = $req->deskripsi;
            $mb->thumbnail = $url; // Save the URL to database
            $mb->keys = $req->keys;
            $mb->save();
            if ($mb) {
                alert()->html("Sukses", "Mufrodat Berhasil Di Tambahkan", "success");
                return redirect()->route("mufrodat_list_index");
            }
        } else {
            alert()->html('Gagal', "Silahkan Upload Gambar Thumbnail", 'danger');
            return redirect()->back();
        }
    }

    public function ubahMufrodatIndex($id)
    {
        $mufrodat = Mufrodat::find($id);
        return view("page.admin.mufrodat.ubah_mufrodat", compact("mufrodat"));
    }

    public function ubahMufrodatPut($id, Request $req)
    {
        // Temukan mufrodat berdasarkan ID
        $mufrodat = Mufrodat::find($id);

        // Validasi input
        $validatedData = $req->validate([
            'nama_materi' => 'required|string|max:255',
            'urutan_bab' => 'required|string|max:100',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Validasi file gambar
            'keys' => 'nullable|string',
            'deskripsi' => 'nullable|string',
        ]);

        // Update mufrodat
        $mufrodat->nama_materi = $req->nama_materi;
        $mufrodat->urutan_bab = $req->urutan_bab;
        $mufrodat->deskripsi = $req->deskripsi;
        $mufrodat->keys = $req->keys;

        // Proses thumbnail jika ada
        if ($req->hasFile('thumbnail')) {
            // Validasi file thumbnail
            $req->validate([
                'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            ]);

            // Hapus thumbnail lama jika ada
            if ($mufrodat->thumbnail && file_exists(public_path($mufrodat->thumbnail))) {
                unlink(public_path($mufrodat->thumbnail));
            }

            // Generate nama file unik
            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();

            // Simpan file ke storage
            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);

            // Dapatkan URL file yang disimpan
            $url = Storage::url($path);

            // Set thumbnail dengan URL yang baru
            $mufrodat->thumbnail = $url;
        }

        // Simpan perubahan
        $mufrodat->save();

        alert()->html("Sukses", "Mufrodat Berhasil Di Perbarui", "success");
        // Redirect dengan pesan sukses
        return redirect()->route('mufrodat_list_index');
    }
    public function tambahIsiMufrodat(Request $req, $id_mufrodat)
    {
        // $req->validate([
        //     'kosakata' => "required | array",
        //     'kosakata.*' => "required | string",
        //     'file_gambar' => "sometimes | array",
        //     'file_gambar.*' => 'sometimes|image|mimes:jpg,png|max:2048',
        //     'file_suara' => "sometimes | array",
        //     'file_suara.*' => 'sometimes|mimes:mp3,wav|max:5120',
        // ]);
    
        foreach ($req->kosakata as $index => $kosakata) {
            $dataToUpdate = ['kosakata' => $kosakata, 'updated_at' => now()];
    
            if ($req->hasFile("file_gambar.$index")) {
                $filenameGambar = time() . '_' . $req->file("file_gambar.$index")->getClientOriginalName();
                $pathGambar = $req->file("file_gambar.$index")->storeAs('public/isi_mufrodat', $filenameGambar);
                $dataToUpdate['gambar'] = $filenameGambar;
            }
    
            if ($req->hasFile("file_suara.$index")) {
                $filenameSuara = time() . '_' . $req->file("file_suara.$index")->getClientOriginalName();
                $pathSuara = $req->file("file_suara.$index")->storeAs('public/isi_mufrodat', $filenameSuara);
                $dataToUpdate['suara'] = $filenameSuara;
            }
    
            IsiKontenMufrodat::updateOrInsert(
                ['id_mufrodat' => $id_mufrodat, 'kosakata' => $kosakata],
                $dataToUpdate
            );
        }
    
        alert()->html("Sukses", "Mufrodat Berhasil Ditambahkan atau Diperbarui", "success");
        return redirect()->back();
    }
    

    public function hapusIsiMufrodat(Request $req)
    {
        $hapus_isi_mufrodat = IsiKontenMufrodat::destroy($req->id);

        if ($hapus_isi_mufrodat) {
            alert()->html("Sukses", "Mufrodat Berhasil Di Hapus", "success");
            return redirect()->back();
        } else {
            alert()->html("Gagal", "Mufrodat Gagal Di Hapus", "danger");
            return redirect()->back();
        }
    }

    public function kalamListIndex()
    {
        $kalam = Kalam::all()->map(function ($k) {
            return [
                "id" => $k->id,
                "urutan_bab" => $k->urutan_bab,
                "nama_materi" => $k->nama_materi,
                "deskripsi" => $k->deskripsi,
                "thumbnail" => $k->thumbnail,
                "keys" => $k->keys,
                "isiKalam" => KalamIsi::where("id_kalam", $k->id)->first()
            ];
        });

        return view("page.admin.kalam.kalam_list", compact("kalam"));
    }

    public function hapusKalam($id)
    {
        $kalam = Kalam::destroy($id);
        if ($kalam) {
            alert()->html('Berhasil', "Kalam Berhasil Dihapus", 'success');
            return redirect()->back();
        } else {
            alert()->html('Gagal', "Kalam Gagal Dihapus", 'danger');
            return redirect()->back();
        }
    }

    public function tambahKalamIndex()
    {
        return view("page.admin.kalam.tambah_kalam");
    }
    public function tambahKalamPost(Request $req)
    {
        if ($req->hasFile('thumbnail')) {
            $req->validate([
                'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            ]);

            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();

            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);

            $url = Storage::url($path);

            $mb = new Kalam;
            $mb->urutan_bab = $req->urutan_bab;
            $mb->nama_materi = $req->nama_materi;
            $mb->deskripsi = $req->deskripsi;
            $mb->thumbnail = $url; // Save the URL to database
            $mb->keys = $req->keys;
            $mb->save();
            if ($mb) {
                alert()->html("Sukses", "Kalam Berhasil Di Tambahkan", "success");
                return redirect()->route("kalam_list_index");
            }
        } else {
            alert()->html('Gagal', "Silahkan Upload Gambar Thumbnail", 'danger');
            return redirect()->back();
        }
    }

    public function ubahOrTambahVidKalam(Request $req, $id_kalam)
    {
        $kalam_isi = KalamIsi::where('id_kalam', $id_kalam)->first();
        if (!$kalam_isi) {
            $kalam_isi = new KalamIsi;
        }

        if ($req->hasFile("video")) {
            $filename = time() . '_' . $req->video->getClientOriginalName();

            $path = $req->video->storeAs('public/video', $filename);

            $url = Storage::url($path);

            $kalam_isi->video = $url;
            $kalam_isi->id_kalam = $id_kalam;
            $kalam_isi->save();

            if ($kalam_isi) {
                alert()->html("Sukses", "Video Kalam Berhasil Di Tambahkan", "success");
                return redirect()->route("kalam_list_index");
            }
        } else {
            alert()->html("Gagal", "Video Kalam Gagal Ditambahkan", "danger");
            return redirect()->route("kalam_list_index");
        }
    }

    public function ubahOrTambahTeksKalam(Request $req, $id_kalam)
    {
        $kalam_isi = KalamIsi::where('id_kalam', $id_kalam)->first();
        if (!$kalam_isi) {
            $kalam_isi = new KalamIsi;
        }

        $kalam_isi->teks_percakapan = $req->teks_percakapan;
        $kalam_isi->id_kalam = $id_kalam;
        $kalam_isi->save();

        if ($kalam_isi) {
            alert()->html("Sukses", "Teks Kalam Berhasil Di Tambahkan", "success");
            return redirect()->route("kalam_list_index");
        } else {
            alert()->html("Gagal", "Teks Kalam Gagal Ditambahkan", "danger");
            return redirect()->route("kalam_list_index");
        }
    }
    public function ubahKalamIndex($id)
    {
        $kalam = Kalam::find($id);
        return view("page.admin.kalam.ubah_kalam", compact("kalam"));
    }

    public function ubahKalamPut($id, Request $req)
    {
        // Find kalam by ID
        $kalam = Kalam::find($id);

        // Validate input
        $validatedData = $req->validate([
            'nama_materi' => 'required|string|max:255',
            'urutan_bab' => 'required|string|max:100',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'keys' => 'nullable|string',
            'deskripsi' => 'nullable|string',
        ]);

        // Update kalam
        $kalam->nama_materi = $req->nama_materi;
        $kalam->urutan_bab = $req->urutan_bab;
        $kalam->deskripsi = $req->deskripsi;
        $kalam->keys = $req->keys;

        // Process thumbnail if uploaded
        if ($req->hasFile('thumbnail')) {
            // Validate thumbnail file
            $req->validate([
                'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            ]);

            // Delete old thumbnail if exists
            if ($kalam->thumbnail && file_exists(public_path($kalam->thumbnail))) {
                unlink(public_path($kalam->thumbnail));
            }

            // Generate unique filename
            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();

            // Store file in storage
            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);

            // Get stored file URL
            $url = Storage::url($path);

            // Set new thumbnail URL
            $kalam->thumbnail = $url;
        }

        // Save changes
        $kalam->save();

        alert()->html("Sukses", "Kalam Berhasil Di Perbarui", "success");
        // Redirect with success message
        return redirect()->route('kalam_list_index');
    }



    // Tampilkan daftar Qiraah
    public function qiraahListIndex()
    {
        $qiraah = Qiraah::all()->map(function ($q) {
            return [
                "id" => $q->id,
                "urutan_bab" => $q->urutan_bab,
                "nama_materi" => $q->nama_materi,
                "deskripsi" => $q->deskripsi,
                "thumbnail" => $q->thumbnail,
                "keys" => $q->keys,
                "isiQiraah" => IsiQiraah::where("id_qiraah", $q->id)->first()
            ];
        });

        return view("page.admin.qiraah.qiraah_list", compact("qiraah"));
    }

    // Tambah Qiraah (Index)
    public function tambahQiraahIndex()
    {
        return view("page.admin.qiraah.tambah_qiraah");
    }

    // Tambah Qiraah (Post)
    public function tambahQiraahPost(Request $req)
    {
        if ($req->hasFile('thumbnail')) {
            $req->validate([
                'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            ]);

            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();

            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);

            $url = Storage::url($path);

            $q = new Qiraah;
            $q->urutan_bab = $req->urutan_bab;
            $q->nama_materi = $req->nama_materi;
            $q->deskripsi = $req->deskripsi;
            $q->thumbnail = $url; // Simpan URL ke database
            $q->keys = $req->keys;
            $q->save();
            if ($q) {
                alert()->html("Sukses", "Qiraah Berhasil Ditambahkan", "success");
                return redirect()->route("qiraah_list_index");
            }
        } else {
            alert()->html('Gagal', "Silahkan Upload Gambar Thumbnail", 'danger');
            return redirect()->back();
        }
    }

    // Hapus Qiraah
    public function hapusQiraah($id)
    {
        $qiraah = Qiraah::destroy($id);
        if ($qiraah) {
            alert()->html('Berhasil', "Qiraah Berhasil Dihapus", 'success');
            return redirect()->back();
        } else {
            alert()->html('Gagal', "Qiraah Gagal Dihapus", 'danger');
            return redirect()->back();
        }
    }

    // Tambah atau Ubah Konten Qiraah (Video)
    public function ubahOrTambahVidQiraah(Request $req, $id_qiraah)
    {
        $isi_qiraah = IsiQiraah::where('id_qiraah', $id_qiraah)->first();
        if (!$isi_qiraah) {
            $isi_qiraah = new IsiQiraah;
        }

        if ($req->hasFile("video")) {
            $filename = time() . '_' . $req->video->getClientOriginalName();

            $path = $req->video->storeAs('public/video', $filename);

            $url = Storage::url($path);

            $isi_qiraah->video = $url;
            $isi_qiraah->id_qiraah = $id_qiraah;
            $isi_qiraah->save();

            if ($isi_qiraah) {
                alert()->html("Sukses", "Video Qiraah Berhasil Ditambahkan", "success");
                return redirect()->route("qiraah_list_index");
            }
        } else {
            alert()->html("Gagal", "Video Qiraah Gagal Ditambahkan", "danger");
            return redirect()->route("qiraah_list_index");
        }
    }

    // Tambah atau Ubah Konten Qiraah (Teks)
    public function ubahOrTambahTeksQiraah(Request $req, $id_qiraah)
    {
        $isi_qiraah = IsiQiraah::where('id_qiraah', $id_qiraah)->first();
        if (!$isi_qiraah) {
            $isi_qiraah = new IsiQiraah;
        }

        $isi_qiraah->teks_bacaan = $req->teks_bacaan;
        $isi_qiraah->id_qiraah = $id_qiraah;
        $isi_qiraah->save();

        if ($isi_qiraah) {
            alert()->html("Sukses", "Teks Qiraah Berhasil Ditambahkan/Diubah", "success");
            return redirect()->route("qiraah_list_index");
        } else {
            alert()->html("Gagal", "Teks Qiraah Gagal Ditambahkan/Diubah", "danger");
            return redirect()->route("qiraah_list_index");
        }
    }

    public function ubahQiraahIndex($id)
    {
        // Cari Qiraah berdasarkan ID
        $qiraah = Qiraah::find($id);

        // Jika Qiraah tidak ditemukan, kembalikan pesan error
        if (!$qiraah) {
            alert()->html('Gagal', "Data Qiraah Tidak Ditemukan", 'danger');
            return redirect()->route('qiraah_list_index');
        }

        // Tampilkan view untuk mengubah data Qiraah
        return view('page.admin.qiraah.ubah_qiraah', compact('qiraah'));
    }

    public function ubahQiraahPut(Request $req, $id)
    {
        // Cari Qiraah berdasarkan ID
        $qiraah = Qiraah::find($id);

        // Jika Qiraah tidak ditemukan, kembalikan pesan error
        if (!$qiraah) {
            alert()->html('Gagal', "Data Qiraah Tidak Ditemukan", 'danger');
            return redirect()->route('qiraah_list_index');
        }


        // Update data Qiraah
        $qiraah->urutan_bab = $req->urutan_bab;
        $qiraah->nama_materi = $req->nama_materi;
        $qiraah->deskripsi = $req->deskripsi;
        $qiraah->keys = $req->keys;

        // Jika ada file thumbnail baru yang diunggah
        if ($req->hasFile('thumbnail')) {
            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();
            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);
            $url = Storage::url($path);

            // Hapus thumbnail lama jika ada
            if ($qiraah->thumbnail) {
                Storage::delete(str_replace('/storage', 'public', $qiraah->thumbnail));
            }

            $qiraah->thumbnail = $url;
        }

        // Simpan perubahan
        $qiraah->save();

        // Tampilkan pesan sukses
        alert()->html('Sukses', "Data Qiraah Berhasil Diubah", 'success');
        return redirect()->route('qiraah_list_index');
    }



    public function latihanQiraahListIndex()
    {
        $latihan_qiraah = LatihanQiraah::all()->map(function ($l) {
            return [
                "id" => $l->id,
                "nama_latihan" => $l->nama_latihan,
                "urutan_bab" => $l->urutan_bab,
                "deskripsi" => $l->deskripsi,
                "thumbnail" => $l->thumbnail,
                "keys" => $l->keys,
                "soal_jawaban" => SoalLatihan::where("id_latihan", $l->id)
                    ->get()
                    ->map(function ($data) {
                        return [
                            "id" => $data->id,
                            "nomor" => $data->nomor,
                            "pertanyaan" => $data->pertanyaan,
                            "benar" => $data->benar,
                            "jawaban" => JawabanSoalLatihan::where("id_soal_latihan", $data->id)
                                ->inRandomOrder()
                                ->get()
                                ->toArray(),
                            "id_jawaban_benar" => JawabanSoalLatihan::where("id_soal_latihan", $data->id)->where("benar", 1)->exists() ?
                                JawabanSoalLatihan::where("id_soal_latihan", $data->id)->where("benar", 1)->first()->id : null
                        ];
                    })->toArray(),
                "benar_salah" => SoalBenarSalah::where("id_latihan", $l->id)
                    ->get()
                    ->map(function ($data) {
                        return [
                            "id" => $data->id,
                            "nomor" => $data->nomor,
                            "pertanyaan" => $data->pertanyaan,
                            "benar" => $data->benar,
                        ];
                    })->toArray()
            ];
        });


        $jawaban_pilihan = ["A", "B", "C", "D", "E", "F", "G"];
        return view("page.admin.latihan_qiraah.latihan_list", compact("latihan_qiraah", "jawaban_pilihan"));
    }

    public function tambahSoalLatihanQiraah($id, Request $request)
    {
        try {
            // Proses Soal Latihan
            if ($request->hasFile('soal_latihan')) {
               $this->processCsvSoalLatihan($id, $request->file('soal_latihan'));
            }

            // Proses Benar/Salah
            if ($request->hasFile('benar_salah')) {
              $this->processCsvBenarSalah($id, $request->file('benar_salah'));
            }

            alert()->html('Sukses', "Latihan Soal Qiraah Berhasil Ditambah", 'success');
           return redirect()->back();
        } catch (\League\Csv\Exception $csvException) {
            alert()->html('Gagal', "Format File Salah: {$csvException->getMessage()}", 'danger');
            return redirect()->back();
        } catch (\Exception $e) {
            alert()->html('Gagal', "Ada kesalahan, silahkan hubungi developer! ({$e->getMessage()})", 'danger');
            return redirect()->back();
        }
    }

    /**
     * Memproses file CSV untuk Soal Latihan
     */
    private function processCsvSoalLatihan($id, $file)
    {
        $csv = Reader::createFromPath($file->getPathname());
        $csv->setDelimiter(',');
        $csv->setHeaderOffset(0);

        $records = iterator_to_array($csv->getRecords(), false);
        $soalData = [];
        $jawabanData = [];
        $timestamp = now();

        foreach ($records as $record) {
            // Validasi data
            if (!isset($record['no'], $record['pertanyaan'], $record['jawaban_benar'])) {
                throw new \Exception('Invalid CSV structure for Soal Latihan.');
            }

            $soalData[] = [
                'id_latihan' => $id,
                'nomor' => $record['no'],
                'pertanyaan' => $record['pertanyaan'],
                'created_at' => $timestamp,
                'updated_at' => $timestamp,
            ];
        }

        // Masukkan data soal_latihan
        $data = SoalLatihan::insert($soalData);
        // Ambil ID soal_latihan
        $soalIds = SoalLatihan::where("id_latihan", $id)->pluck('id')->toArray(); // Mengambil semua ID soal_latihan berdasarkan id_latihan

        // Siapkan data jawaban
        foreach ($soalIds as $index => $soalId) {
            $record = $records[$index];
            $jawabanData[] = ['id_soal_latihan' => $soalId, 'jawaban' => $record['jawaban_1'] ?? null, 'benar' => 0, 'created_at' => $timestamp, 'updated_at' => $timestamp];
            $jawabanData[] = ['id_soal_latihan' => $soalId, 'jawaban' => $record['jawaban_2'] ?? null, 'benar' => 0, 'created_at' => $timestamp, 'updated_at' => $timestamp];
            $jawabanData[] = ['id_soal_latihan' => $soalId, 'jawaban' => $record['jawaban_3'] ?? null, 'benar' => 0, 'created_at' => $timestamp, 'updated_at' => $timestamp];
            $jawabanData[] = ['id_soal_latihan' => $soalId, 'jawaban' => $record['jawaban_4'] ?? null, 'benar' => 0, 'created_at' => $timestamp, 'updated_at' => $timestamp];
            $jawabanData[] = ['id_soal_latihan' => $soalId, 'jawaban' => $record['jawaban_benar'], 'benar' => 1, 'created_at' => $timestamp, 'updated_at' => $timestamp];
        }

        // Masukkan data jawaban
        JawabanSoalLatihan::insert($jawabanData);

        return $jawabanData;
    }

    /**
     * Memproses file CSV untuk Soal Benar/Salah
     */
    private function processCsvBenarSalah($id, $file)
    {
        $csv = Reader::createFromPath($file->getPathname());
        $csv->setDelimiter(',');
        $csv->setHeaderOffset(0);

        $records = iterator_to_array($csv->getRecords(), false);
        $soalData = [];
        $timestamp = now();

        foreach ($records as $record) {
            // Validasi data
            if (!isset($record['no'], $record['pertanyaan'], $record['benar'])) {
                throw new \Exception('Invalid CSV structure for Soal Benar/Salah.');
            }

            $soalData[] = [
                'id_latihan' => $id,
                'nomor' => $record['no'],
                'pertanyaan' => $record['pertanyaan'],
                'benar' => $record['benar'],
                'created_at' => $timestamp,
                'updated_at' => $timestamp,
            ];
        }

        // Masukkan data soal_benar_salah
        SoalBenarSalah::insert($soalData);
    }



    public function hapusLatihanQiraah($id)
    {
        $latihan_qiraah = LatihanQiraah::destroy($id);

        if ($latihan_qiraah) {
            alert()->html("Sukses", "latihan qiraah Berhasil Di Hapus", "success");
            return redirect()->route("latihan_qiraah_list_index");
        }
    }

    public function hapusLatihanSoalQiraah(Request $req)
    {
        foreach ($req->id_soal_lat as $id) {
            SoalLatihan::destroy($id);
        }
        alert()->html("Sukses", "latihan qiraah Berhasil Di Hapus", "success");
        return redirect()->route("latihan_qiraah_list_index");
    }

    public function hapusBenarSalahQiraah(Request $req)
    {
        foreach ($req->id_benar_salah as $id) {
            SoalBenarSalah::destroy($id);
        }
        alert()->html("Sukses", "latihan qiraah Berhasil Di Hapus", "success");
        return redirect()->route("latihan_qiraah_list_index");
    }


    public function ubahLatihanQiraahIndex($id)
    {
        $latihan_qiraah = LatihanQiraah::find($id);
        return view("page.admin.latihan_qiraah.ubah_latihan", compact("latihan_qiraah"));
    }

    public function ubahLatihanQiraahPut($id, Request $req)
    {
        // Find latihan_qiraah by ID
        $latihan_qiraah = LatihanQiraah::find($id);

        // Validate input
        $validatedData = $req->validate([
            'nama_latihan' => 'required|string|max:255',
            'urutan_bab' => 'required|string|max:100',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'keys' => 'nullable|string',
            'deskripsi' => 'nullable|string',
        ]);

        // Update latihan_qiraah
        $latihan_qiraah->nama_latihan = $req->nama_latihan;
        $latihan_qiraah->urutan_bab = $req->urutan_bab;
        $latihan_qiraah->deskripsi = $req->deskripsi;
        $latihan_qiraah->keys = $req->keys;

        // Process thumbnail if uploaded
        if ($req->hasFile('thumbnail')) {
            // Validate thumbnail file
            $req->validate([
                'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            ]);

            // Delete old thumbnail if exists
            if ($latihan_qiraah->thumbnail && file_exists(public_path($latihan_qiraah->thumbnail))) {
                unlink(public_path($latihan_qiraah->thumbnail));
            }

            // Generate unique filename
            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();

            // Store file in storage
            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);

            // Get stored file URL
            $url = Storage::url($path);

            // Set new thumbnail URL
            $latihan_qiraah->thumbnail = $url;
        }

        // Save changes
        $latihan_qiraah->save();

        alert()->html("Sukses", "latihan qiraah Berhasil Di Perbarui", "success");
        // Redirect with success message
        return redirect()->route('latihan_qiraah_list_index');
    }

    // Soal Cerita
public function tambahSoalCerita($id, Request $request)
{
    $validated = $request->validate([
        'gambar.*' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        'cerita.*' => 'required|string',
    ]);

    $latihan = LatihanKalam::findOrFail($id);

    foreach ($request->file('gambar') as $index => $gambar) {
        $path = $gambar->store('public/soal_cerita');
        $url = Storage::url($path);

        $latihan->soalCerita()->create([
            'gambar' => $url,
            'cerita' => $request->cerita[$index]
        ]);
    }

    return back()->with('success', 'Soal cerita berhasil ditambahkan!');
}

// Soal Percakapan
public function tambahSoalPercakapan($id, Request $request)
{
    $validated = $request->validate([
        'nomor.*' => 'required|numeric',
        'percakapan.*' => 'required|string',
        'gambar.*' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
    ]);

    $latihan = LatihanKalam::findOrFail($id);

    foreach ($request->nomor as $index => $nomor) {
        $path = $request->gambar[$index]->store('public/soal_percakapan');
        $url = Storage::url($path);

        $latihan->soalPercakapan()->create([
            'nomor' => $nomor,
            'percakapan' => $request->percakapan[$index],
            'gambar' => $url
        ]);
    }

    return back()->with('success', 'Soal percakapan berhasil ditambahkan!');
}
    public function tambahLatihanQiraahIndex()
    {
        return view("page.admin.latihan_qiraah.tambah_latihan");
    }

    public function hapusSoalCerita($id)
    {
        $deleteSoalCerita = SoalCerita::destroy($id);

        if($deleteSoalCerita) {
            alert()->html("Sukses", "latihan qiraah Berhasil Di Hapus", "success");

            return back()->with('success', 'Soal cerita berhasil ditambahkan!');
        } else {
            alert()->html("Gagal", "latihan qiraah Gagal Di Hapus", "danger");

            return back()->with('success', 'Soal cerita berhasil ditambahkan!');
        }


    }

    public function hapusSoalPercakapan($id)
    {

    }

    public function tambahLatihanQiraahPost(Request $req)
    {
        if ($req->hasFile('thumbnail')) {
            $req->validate([
                'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            ]);

            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();

            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);

            $url = Storage::url($path);

            $mb = new LatihanQiraah;
            $mb->urutan_bab = $req->urutan_bab;
            $mb->nama_latihan = $req->nama_latihan;
            $mb->deskripsi = $req->deskripsi;
            $mb->thumbnail = $url; // Save the URL to database
            $mb->keys = $req->keys;
            $mb->save();
            if ($mb) {
                alert()->html("Sukses", "Latihan Qiraah Berhasil Di Tambahkan", "success");
                return redirect()->route("latihan_qiraah_list_index");
            }
        } else {
            alert()->html('Gagal', "Silahkan Upload Gambar Thumbnail", 'danger');
            return redirect()->back();
        }
    }

    public function latihanKalamListIndex(Request $request)
    {
        $jawaban_pilihan = ['A', 'B', 'C', 'D']; // For option labels in the view
        
        $latihan_kalam = LatihanKalam::all()->map(function ($l) {
            return [
                "id" => $l->id,
                "nama_latihan" => $l->nama_latihan,
                "urutan_bab" => $l->urutan_bab,
                "deskripsi" => $l->deskripsi,
                "thumbnail" => $l->thumbnail,
                "keys" => $l->keys,
                "soal_cerita" => SoalCerita::where("id_latihan_kalam", $l->id)
                    ->get()->map(function ($a){
                        return [
                            "id" => $a->id,
                            "id_latihan_kalam" => $a->id_latihan_kalam,
                            "gambar" => $a->gambar,
                            "cerita" => $a->cerita
                        ];
                    }),
                "soal_percakapan" => SoalPercakapan::where("id_latihan_kalam", $l->id)
                    ->get()->map(function ($p){
                        return [
                            "id" => $p->id,
                            "nomor" => $p->nomor,
                            "gambar" => $p->gambar,
                            "id_latihan_kalam" => $p->id_latihan_kalam,
                            "percakapan" => $p->percakapan,
                            "audio" => $p->audio
                        ];
                    })
            ];
        });
    
        return view("page.admin.latihan_kalam.latihan_list", compact("latihan_kalam", "jawaban_pilihan"));
    }

    public function tambahLatihanKalamIndex()
    {
        return view("page.admin.latihan_kalam.tambah_latihan");
    }

    public function tambahLatihanKalamPost(Request $req)
    {
        $req->validate([
            'thumbnail' => 'required|image|mimes:jpg,png|max:2048',
            'urutan_bab' => 'required|string|max:100',
            'nama_latihan' => 'required|string|max:255',
            'deskripsi' => 'nullable|string',
            'keys' => 'nullable|string',
        ]);

        if ($req->hasFile('thumbnail')) {
            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();
            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);
            $url = Storage::url($path);

            $latihan_kalam = new LatihanKalam;
            $latihan_kalam->urutan_bab = $req->urutan_bab;
            $latihan_kalam->nama_latihan = $req->nama_latihan;
            $latihan_kalam->deskripsi = $req->deskripsi;
            $latihan_kalam->thumbnail = $url; // Save the URL to database
            $latihan_kalam->keys = $req->keys;
            $latihan_kalam->save();

            alert()->html("Sukses", "Latihan Kalam Berhasil Ditambahkan", "success");
            return redirect()->route("latihan_kalam_list_index");
        } else {
            alert()->html('Gagal', "Silahkan Upload Gambar Thumbnail", 'danger');
            return redirect()->back();
        }
    }

    public function ubahLatihanKalamIndex($id)
    {
        $latihan_kalam = LatihanKalam::find($id);
        return view("page.admin.latihan_kalam.ubah_latihan", compact("latihan_kalam"));
    }

    public function ubahLatihanKalamPut($id, Request $req)
    {
        $latihan_kalam = LatihanKalam::find($id);
        $req->validate([
            'thumbnail' => 'nullable|image|mimes:jpg,png|max:2048',
            'urutan_bab' => 'required|string|max:100',
            'nama_latihan' => 'required|string|max:255',
            'deskripsi' => 'nullable|string',
            'keys' => 'nullable|string',
        ]);

        $latihan_kalam->urutan_bab = $req->urutan_bab;
        $latihan_kalam->nama_latihan = $req->nama_latihan;
        $latihan_kalam->deskripsi = $req->deskripsi;
        $latihan_kalam->keys = $req->keys;

        if ($req->hasFile('thumbnail')) {
            if ($latihan_kalam->thumbnail && file_exists(public_path($latihan_kalam->thumbnail))) {
                unlink(public_path($latihan_kalam->thumbnail));
            }

            $filename = time() . '_' . $req->thumbnail->getClientOriginalName();
            $path = $req->thumbnail->storeAs('public/thumbnails', $filename);
            $url = Storage::url($path);
            $latihan_kalam->thumbnail = $url;
        }

        $latihan_kalam->save();
        alert()->html("Sukses", "Latihan Kalam Berhasil Diperbarui", "success");
        return redirect()->route('latihan_kalam_list_index');
    }

    public function hapusLatihanKalam($id)
    {
        $latihan_kalam = LatihanKalam::destroy($id);
        if ($latihan_kalam) {
            alert()->html("Sukses", "Latihan Kalam Berhasil Dihapus", "success");
            return redirect()->route("latihan_kalam_list_index");
        } else {
            alert()->html("Gagal", "Latihan Kalam Gagal Dihapus", "danger");
            return redirect()->route("latihan_kalam_list_index");
        }
    }
}
