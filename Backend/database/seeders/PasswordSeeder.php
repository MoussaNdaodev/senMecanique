<?php

namespace Database\Seeders;

use App\Models\Password;
use Illuminate\Database\Seeder;

class PasswordSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        Password::factory(10)->create();
    }
}
