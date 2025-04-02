<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SoalPercakapan extends Model
{
    use HasFactory;
    protected $table = "tb_soal_percakapan";
    protected $primaryKey = 'id';
    public $incrementing = true;    
    protected $fillable = [
        "id_latihan_kalam",
        "nomor",
        "percakapan",
        "gambar"
    ];
}
