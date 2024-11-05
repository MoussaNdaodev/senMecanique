<?php

namespace App\Models;

use App\Filters\BadgeFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Badge extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = BadgeFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "nom",
    ];


}
