<?php

namespace App\Models;

use App\Filters\EvaluationFilters;
use Essa\APIToolKit\Filters\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Evaluation extends Model
{
    use HasFactory, Filterable;

    protected string $default_filters = EvaluationFilters::class;

    /**
     * Mass-assignable attributes.
     *
     * @var array
     */
    protected $fillable = [
        "note",
        "commentaire",
    ];

    public function Product() {
        return $this->belongsTo(Product::class);
    }
}
