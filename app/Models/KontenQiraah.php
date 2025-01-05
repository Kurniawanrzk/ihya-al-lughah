<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KontenQiraah extends Model
{
    use HasFactory;
    protected $table = "tb_konten_qiraah";
    protected $fillable = [
        "id_qiraah",
        "nama_konten_qiraah",
        "thumbnail",
    ];
}
