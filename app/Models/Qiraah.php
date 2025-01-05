<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Qiraah extends Model
{
    use HasFactory;
    protected $table = "tb_qiraah";
    protected $fillable = [
        "nama_qiraah",
        "thumbnail",
        "deskripsi",
        "keys"
    ];
}
