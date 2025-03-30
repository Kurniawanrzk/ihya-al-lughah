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
        "cerita"
    ];

    public function pertanyaan()
    {
        // Update the foreign key to match your database column name
        return $this->hasMany(PertanyaanSoalCerita::class, 'id_soal_cerita', 'id');
    }
}
