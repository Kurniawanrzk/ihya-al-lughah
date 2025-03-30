<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IsiKontenMufrodat extends Model
{
    use HasFactory;
    protected $table = "tb_isi_konten_mufrodat";
    protected $fillable = [
        "id_mufrodat",
        "suara",
        "gambar",
        "kosakata"
    ];
}
