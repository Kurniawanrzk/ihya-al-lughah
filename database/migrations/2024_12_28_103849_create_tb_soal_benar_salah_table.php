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
        Schema::create('tb_soal_benar_salah', function (Blueprint $table) {
            $table->id();
            $table->foreignId("id_latihan")->constrained("tb_latihan")->onDelete("cascade");
            $table->string("pertanyaan");
            $table->integer("nomor");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_soal_benar_salah');
    }
};
