<?php

namespace App\Models;

use App\Filters\StockFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Stock extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = StockFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "quantite",
        "seuil_minimum",
    ];


    public function product(){
        return $this->belongsTo(Product::class);
    }

}
