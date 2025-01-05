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
        Schema::create('tb_latihan', function (Blueprint $table) {
            $table->id();
            $table->string("nama_latihan");
            $table->string("deskripsi");
            $table->string("keys");
            $table->string("slug", 100);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_latihan');
    }
};
