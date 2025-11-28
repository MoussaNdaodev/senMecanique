<?php

namespace Database\Seeders;

use App\Models\Adresse;
use Illuminate\Database\Seeder;

class AdresseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        Adresse::factory(10)->create();
    }
}
