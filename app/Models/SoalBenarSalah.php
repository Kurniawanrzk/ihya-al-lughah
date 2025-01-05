<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SoalBenarSalah extends Model
{
    use HasFactory;
    protected $table = 'tb_soal_benar_salah';
    protected $fillable = [
        "pertanyaan",
        "nomor"
    ];
}
