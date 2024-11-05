<?php

namespace App\Filters;

use Essa\APIToolKit\Filters\QueryFilters;

class LoginFilters extends QueryFilters
{
    protected array $allowedFilters = [];

    protected array $columnSearch = [];
}
