<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class ProductPromotion extends Pivot
{
    protected $table = 'product_promotion';

    protected $fillable = [
        'product_id',
        'promotion_id',
        'pourcentage_reduction',
        'date_debut',
        'date_fin'
    ];
}
