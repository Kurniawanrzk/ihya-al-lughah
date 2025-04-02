<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class LatihanKalam extends Model
{
    use HasFactory;
    protected $table = "tb_latihan_kalam";
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        'id',
        "nama_latihan",
        "urutan_bab",
        "thumbnail",
        "deskripsi",
        "keys"
    ];
    public function soalCerita()
    {
        return $this->hasMany(SoalCerita::class, 'id_latihan_kalam');
    }

    public function soalPercakapan()
    {
        return $this->hasMany(SoalPercakapan::class, 'id_latihan_kalam');
    }
}
