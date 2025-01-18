<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KontenMufrodat extends Model
{
    use HasFactory;
    protected $table = "tb_konten_mufrodat";
    protected $fillable = [
        "id_mufrodat",
        "nama_konten_mufrodat",
        "thumbnail"
    ];
}
