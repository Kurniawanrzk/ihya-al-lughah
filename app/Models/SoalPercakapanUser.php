<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SoalPercakapanUser extends Model
{
    use HasFactory;
    protected $table = "tb_soal_percakapan_user";
    protected $primaryKey = 'id';
    public $incrementing = true;    
    protected $fillable = [
        'id',
        "id_user",
        "id_soal_percakapan",
        "jawaban",
        "audio_path",
        "created_at",
        "updated_at"
    ];

    public function soalPercakapan()
    {
        return $this->belongsTo(SoalPercakapan::class, 'id_soal_percakapan');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
