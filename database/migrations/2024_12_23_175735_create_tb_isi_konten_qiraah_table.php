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
        Schema::create('tb_isi_konten_qiraah', function (Blueprint $table) {
            $table->id();
            $table->foreignId("id_konten_qiraah")->constrained('tb_konten_qiraah')->onDelete('cascade'); 
            $table->string("gambar");
            $table->string("kosakata");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_isi_konten_qiraah');
    }
};
