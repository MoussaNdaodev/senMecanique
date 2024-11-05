<?php

namespace App\Models;

use App\Filters\PasswordFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Password extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = PasswordFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        
    ];


}
