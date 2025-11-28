<?php

use App\Models\Adresse;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(): void
    {
        Schema::create('geolocalisations', function (Blueprint $table) {
            $table->id();
            $table->string("latitude");
            $table->string("longitude");
            $table->foreignIdFor(Adresse::class)->constrained()->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(): void
    {
        Schema::dropIfExists('geolocalisations');
    }
};
