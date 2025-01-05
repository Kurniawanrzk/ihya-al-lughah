<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HasilBenarSalah extends Model
{
    use HasFactory; 
    protected $table = "tb_hasil_soal_benar_salah";
    protected $fillable = [
        "guest_id",
        "user_id",
        "latihan_id",
        "soal_benar_salah_id",
        "benar",
    ];
}
