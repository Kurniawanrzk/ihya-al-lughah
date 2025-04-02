<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IsiQiraah extends Model
{
    use HasFactory;
    protected $table = "tb_isi_qiraah";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        "id_qiraah",
        "teks_bacaan",
        "suara"
    ];
}
