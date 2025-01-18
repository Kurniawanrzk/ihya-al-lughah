<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IsiQiraah extends Model
{
    use HasFactory;
    protected $table = "tb_isi_qiraah";
    protected $fillable = [
        "id_qiraah",
        "video",
        "teks_bacaan"
    ];
}
