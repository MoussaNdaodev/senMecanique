<?php

namespace App\Filters;

use Essa\APIToolKit\Filters\QueryFilters;

class ProductFilters extends QueryFilters
{
    protected array $allowedFilters = [];

    protected array $columnSearch = [];
}
