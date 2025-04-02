<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\LatihanQiraah;

class HasilSoalLatihan extends Model
{
    use HasFactory;
    protected $table = "tb_hasil_soal_latihan";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        'id',
        "guest_id",
        "user_id",
        "latihan_id",
        "soal_latihan_id",
        "jawaban_latihan_id",
        "benar",
    ];

    public function latihan()
    {
        return $this->belongsTo(LatihanQiraah::class, 'latihan_id');
    }
}
