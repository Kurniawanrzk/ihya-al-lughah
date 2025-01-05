<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HasilSoalLatihan extends Model
{
    use HasFactory;
    protected $table = "tb_hasil_soal_latihan";
    protected $primaryKey = "id";
    protected $fillable = [
        "guest_id",
        "user_id",
        "latihan_id",
        "soal_latihan_id",
        "jawaban_latihan_id",
        "benar",
    ];
}
