<?php

namespace App\Filters;

use Essa\APIToolKit\Filters\QueryFilters;

class BadgeFilters extends QueryFilters
{
    protected array $allowedFilters = [];

    protected array $columnSearch = [];
}
