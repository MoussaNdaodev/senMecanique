<?php

namespace App\Filters;

use Essa\APIToolKit\Filters\QueryFilters;

class StockFilters extends QueryFilters
{
    protected array $allowedFilters = [];

    protected array $columnSearch = [];
}
