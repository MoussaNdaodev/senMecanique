<?php

namespace Database\Seeders;

use App\Models\Regsiter;
use Illuminate\Database\Seeder;

class RegsiterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        Regsiter::factory(10)->create();
    }
}
