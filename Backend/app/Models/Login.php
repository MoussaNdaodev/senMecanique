<?php

namespace App\Models;

use App\Filters\LoginFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Login extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = LoginFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        
    ];


}
