<?php

namespace App\Filters;

use Essa\APIToolKit\Filters\QueryFilters;

class GeolocalisationFilters extends QueryFilters
{
    protected array $allowedFilters = [];

    protected array $columnSearch = [];
}
