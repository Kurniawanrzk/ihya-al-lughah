<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SoalCeritaUser extends Model
{
    use HasFactory;
    protected $table = "tb_soal_cerita_user";
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        "id_user",
        "id_soal_cerita",
        "jawaban",
        "audio_path",
        "created_at",
        "updated_at"
    ];

    public function soalCerita()
    {
        return $this->belongsTo(SoalCerita::class, 'id_soal_cerita');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
