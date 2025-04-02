<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\SoalCerita;
class PertanyaanSoalCerita extends Model
{
    use HasFactory;
    protected $table = "tb_pertanyaan_soal_cerita";
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        "id_soal_cerita",
        "pertanyaan",
    ];

    
    public function soalCerita(): BelongsTo
    {
        return $this->belongsTo(SoalCerita::class);
    }
}
