<?php

namespace Database\Seeders;

use App\Models\Panier;
use Illuminate\Database\Seeder;

class PanierSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        Panier::factory(10)->create();
    }
}
