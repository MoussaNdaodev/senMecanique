<?php

namespace App\Models;

use App\Filters\AdresseFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Adresse extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = AdresseFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "departement",
        "region",
        "villa",
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function geo(){
        return $this->hasOne(Geolocalisation::class);
    }
}
