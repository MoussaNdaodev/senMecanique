<?php

namespace Database\Seeders;

use App\Models\Login;
use Illuminate\Database\Seeder;

class LoginSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        Login::factory(10)->create();
    }
}
