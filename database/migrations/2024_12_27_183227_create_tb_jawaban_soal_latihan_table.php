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
        Schema::create('tb_jawaban_soal_latihan', function (Blueprint $table) {
            $table->id();
            $table->foreignId("id_soal_latihan")->constrained("tb_soal_latihan")->onDelete("cascade");
            $table->string("jawaban");
            $table->boolean("benar");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_jawaban_soal_latihan');
    }
};
