<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KalamIsi extends Model
{
    use HasFactory;
    protected $table = "tb_isi_kalam";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        "video",
        "teks_percakapan",
        "id_kalam",
        "suara_percakapan"
    ];
}
