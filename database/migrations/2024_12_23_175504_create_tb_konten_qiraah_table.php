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
        Schema::create('tb_konten_qiraah', function (Blueprint $table) {
            $table->id();
            $table->foreignId("id_qiraah")->constrained('tb_qiraah')->onDelete('cascade'); 
            $table->string("nama_konten_qiraah");
            $table->string("thumbnail");
            $table->timestamps();
        });
        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_konten_qiraah');
    }
};
