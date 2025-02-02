<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\pertanyaanSoalCerita;
class SoalCerita extends Model
{
    use HasFactory;
    protected $table = "tb_soal_cerita";
    protected $primaryKey = "id";
    protected $fillable = [
        "id_latihan_kalam",
        "gambar",
        "deskripsi"
    ];

    public function pertanyaan() {
        return $this->hasMany(PertanyaanSoalCerita::class);
    }
}
