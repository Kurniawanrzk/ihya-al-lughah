<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kalam extends Model
{
    use HasFactory;
    protected $table = "tb_kalam";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        "urutan_bab",
        "nama_materi",
        "deskripsi",
        "keys"
    ];
}
