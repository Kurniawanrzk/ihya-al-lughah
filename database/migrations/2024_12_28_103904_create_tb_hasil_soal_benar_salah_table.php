<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tb_hasil_soal_benar_salah', function (Blueprint $table) {
            $table->id();
            $table->string("guest_id")->nullable();
            $table->foreignId("user_id")->constrained("users")->onDelete("cascade")->nullable();
            $table->foreignId("latihan_id")->constrained("tb_latihan")->onDelete("cascade");
            $table->foreignId("soal_benar_salah_id")->constrained("tb_benar_salah")->onDelete("cascade");
            $table->foreignId("jawaban_benar_salah_id")->constrained("tb_jawaban_soal_benar_salah")->onDelete("cascade");
            $table->boolean("benar");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_hasil_soal_benar_salah');
    }
};
