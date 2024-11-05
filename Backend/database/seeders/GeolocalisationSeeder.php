<?php

namespace Database\Seeders;

use App\Models\Geolocalisation;
use Illuminate\Database\Seeder;

class GeolocalisationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        Geolocalisation::factory(10)->create();
    }
}
