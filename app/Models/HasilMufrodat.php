<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HasilMufrodat extends Model
{
    use HasFactory;
    protected $table = "tb_hasil_mufrodat";
    protected $primaryKey = 'id';
public $incrementing = true;
    protected $fillable = [
        "id_konten_mufrodat",
        "guest_id",
        "id_user"
    ];
}
