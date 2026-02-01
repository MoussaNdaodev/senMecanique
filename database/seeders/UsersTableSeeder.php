<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\User;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        User::firstOrCreate(
            ['email' => 'moussandaodevpro@gmail.com'],
            [
                'name' => 'Moussa Ndao',
                'password' => Hash::make('moussa@admin'),
                'role' => 'admin',
                'status' => 'active',
            ]
        );

        User::firstOrCreate(
            ['email' => 'serignematarmbaye2000@gmail.com'],
            [
                'name' => 'Matar',
                'password' => Hash::make('matar@user'),
                'role' => 'user',
                'status' => 'active',
            ]
        );
    }
}
