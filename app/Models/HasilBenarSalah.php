<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\LatihanQiraah;

class HasilBenarSalah extends Model
{
    use HasFactory; 
    protected $table = "tb_hasil_soal_benar_salah";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        'id',
        "guest_id",
        "user_id",
        "latihan_id",
        "soal_benar_salah_id",
        "benar",
    ];

    public function latihan()
    {
        return $this->belongsTo(LatihanQiraah::class, 'latihan_id');
    }
}
