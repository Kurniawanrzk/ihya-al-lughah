<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LatihanQiraah extends Model
{
    use HasFactory;
    protected $table = "tb_latihan_qiraah";
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        "nama_latihan",
        "thumbnail",
        "urutan_bab",
        "deskripsi",
        "slug",
        "keys"
    ];
}
