<?php

namespace App\Models;

use App\Filters\RegsiterFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Regsiter extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = RegsiterFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        
    ];


}
