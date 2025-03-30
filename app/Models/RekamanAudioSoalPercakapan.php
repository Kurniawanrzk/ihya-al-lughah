<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RekamanAudioSoalPercakapan extends Model
{
    use HasFactory;
    protected $table = "tb_rekaman_soal_percakapan";
    protected $fillable = [
        'id_soal_percakapan',
        'lokasi_audio',
        'id_user'
    ];
}
