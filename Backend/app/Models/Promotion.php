<?php

namespace App\Models;

use App\Filters\PromotionFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Promotion extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = PromotionFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "nom",
        "pourcentage_reduction",
        "date_debut",
        "date_fin",
    ];

    public function Products()
    {
        return $this->belongsToMany(Product::class)
        ->using(ProductPromotion::class)
        ->withPivot('pourcentage_reduction', 'date_debut', 'date_fin')
        ->withTimestamps();
    }


}
