<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JawabanSoalLatihan extends Model
{
    use HasFactory;
    protected $table = "tb_jawaban_soal_latihan";
    protected $primaryKey = "id";
    protected $fillable = [
        "id_soal_latihan",
        "jawaban",
        "benar",
    ];
}
