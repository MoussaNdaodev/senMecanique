<?php
namespace Database\Seeders;


use Illuminate\Database\Seeder;


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
         $this->call(\Database\Seeders\UsersTableSeeder::class);
         $this->call(\Database\Seeders\SettingTableSeeder::class);
         $this->call(\Database\Seeders\CouponSeeder::class);


    }
}
