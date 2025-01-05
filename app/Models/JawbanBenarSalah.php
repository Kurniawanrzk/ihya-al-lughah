<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JawbanBenarSalah extends Model
{
    use HasFactory;
    protected $table = 'tb_jawaban_soal_benar_salah';
    protected $fillable = [
        "id_soal_benar_salah",
        "jawban", 
        "benar"
    ];
}
