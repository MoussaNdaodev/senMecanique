<?php

namespace App\Models;

use App\Filters\GeolocalisationFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Geolocalisation extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = GeolocalisationFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "latitude",
        "longitude",
    ];
    
    public function adresse(){
        return $this->belongsTo(Adresse::class);
    }


}
