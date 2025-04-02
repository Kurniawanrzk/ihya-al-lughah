<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SoalLatihan extends Model
{
    use HasFactory;
    protected $table = "tb_soal_latihan";
    protected $primaryKey = 'id';
    public $incrementing = true;    
    protected $fillable = [
        "id_latihan",
        "nomor",
        "pertanyaan"
    ];
}
