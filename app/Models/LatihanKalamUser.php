<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LatihanKalamUser extends Model
{
    use HasFactory;
    
    protected $table = "tb_latihan_kalam_user";
    protected $primaryKey = "id";
    protected $fillable = [
        "id_user",
        "id_latihan_kalam_user",
        "status", // 'in_progress', 'completed'
        "score",
        "completed_at",
        "created_at",
        "updated_at"
    ];

    public function latihanKalam()
    {
        return $this->belongsTo(LatihanKalam::class, 'id_latihan_kalam_user');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    public function soalCeritaUsers()
    {
        return $this->hasManyThrough(
            SoalCeritaUser::class,
            SoalCerita::class,
            'id_latihan_kalam', // Foreign key on soal_cerita table...
            'id_soal_cerita', // Foreign key on soal_cerita_user table...
            'id_latihan_kalam', // Local key on latihan_kalam_user table...
            'id' // Local key on soal_cerita table...
        );
    }

    public function soalPercakapanUsers()
    {
        return $this->hasManyThrough(
            SoalPercakapanUser::class,
            SoalPercakapan::class,
            'id_latihan_kalam',
            'id_soal_percakapan',
            'id_latihan_kalam',
            'id'
        );
    }
}
