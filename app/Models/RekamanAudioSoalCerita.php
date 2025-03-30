<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RekamanAudioSoalCerita extends Model
{
    use HasFactory;
    protected $table = "tb_rekaman_soal_cerita";
    protected $primaryKey = "id";
    protected $fillable = [
        "id_soal_cerita",	
        "lokasi_audio",
        "id_user",

    ];
}
