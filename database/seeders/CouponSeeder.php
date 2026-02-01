<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CouponSeeder extends Seeder
{
    public function run()
    {
        $coupons = [
            [
                'code' => 'senMecanique',
                'type' => 'fixed',
                'value' => 300,
                'status' => 'active',
            ],
            [
                'code' => 'senMecanique2',
                'type' => 'percent',
                'value' => 10,
                'status' => 'active',
            ],
        ];

        foreach ($coupons as $coupon) {
            DB::table('coupons')->updateOrInsert(
                ['code' => $coupon['code']],
                $coupon
            );
        }
    }
}
