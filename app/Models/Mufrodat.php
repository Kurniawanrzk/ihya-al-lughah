<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mufrodat extends Model
{
    use HasFactory;
    protected $table = "tb_mufrodat";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        'id',
        "nama_materi",
        "urutan_bab",
        "deskripsi",
        "thumbnail",
        "keys"
    ];
}
