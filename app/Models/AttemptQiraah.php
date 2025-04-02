<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttemptQiraah extends Model
{
    use HasFactory;
    protected $table = "tb_hasil_qiraah";
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        "id_konten_qiraah",
        "guest_id",
        "id_user"
    ];
}
