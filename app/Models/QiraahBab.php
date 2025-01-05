<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QiraahBab extends Model
{
    use HasFactory;
    protected $table = "tb_qiraah_bab";
    protected $fillable = [
        "nomor_bab",
        "nama_bab",
        "deskripsi_bab",
        "thumbnail"
    ];
}
