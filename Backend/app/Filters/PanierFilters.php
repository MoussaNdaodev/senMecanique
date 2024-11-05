<?php

namespace App\Filters;

use Essa\APIToolKit\Filters\QueryFilters;

class PanierFilters extends QueryFilters
{
    protected array $allowedFilters = [];

    protected array $columnSearch = [];
}
