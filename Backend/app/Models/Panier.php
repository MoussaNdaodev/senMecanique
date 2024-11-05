<?php

namespace App\Models;

use App\Filters\PanierFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Panier extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = PanierFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "prix_total",
        "status",
    ];


}
