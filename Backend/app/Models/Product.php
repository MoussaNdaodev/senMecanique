<?php

namespace App\Models;

use App\Filters\ProductFilters;
use Carbon\Carbon;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = ProductFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "name",
        "description",
        "price",
        "image",
        "caracteristique",
    ];

    public function Category(){
        return $this->belongsTo(Category::class);
    }

    public function Evaluations() {
        return $this->hasMany(Evaluation::class);
    }

    public function Promotions(){
        return $this->belongsToMany(Promotion::class)
        ->using(ProductPromotion::class)
        ->withPivot('pourcentage_reduction', 'date_debut', 'date_fin')
        ->withTimestamps();
    }

    public function activePromotions()
    {
        $currentDate = Carbon::now();
        return $this->Promotions()
                    ->wherePivot('date_debut', '<=', $currentDate)
                    ->wherePivot('date_fin', '>=', $currentDate);
    }

    public function getDiscountedPriceAttribute()
    {

        $promotions = $this->activePromotions()->get();

        if ($promotions->isEmpty()) {
            return $this->price;
        }

        $tauxReduction = $promotions->pivot->pourcentage_reduction;
        return $this->price * ($tauxReduction / 100);
    }

    public function stock(){
        return $this->hasOne(Stock::class);
    }
}
