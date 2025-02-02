<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class LatihanKalam extends Model
{
    use HasFactory;
    protected $table = "tb_latihan_kalam";
    protected $primaryKey = "id";
    protected $fillable = [
        "nama_latihan",
        "urutan_bab",
        "thumbnail",
        "deskripsi",
        "keys"
    ];
}
