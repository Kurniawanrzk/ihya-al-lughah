<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Latihan extends Model
{
    use HasFactory;
    protected $table = "tb_latihan_qiraah";
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        'id',
        "nama_latihan",
        "deskripsi",
        "slug",
        "keys"
    ];
}
