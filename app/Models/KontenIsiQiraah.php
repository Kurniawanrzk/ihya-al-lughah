<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KontenIsiQiraah extends Model
{
    use HasFactory;
    protected $table = "tb_isi_konten_qiraah";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        'id',
        "id_konten_qiraah",
        "gambar",
        "kosakata"
    ];
}
