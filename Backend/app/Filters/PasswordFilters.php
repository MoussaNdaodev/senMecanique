<?php

namespace App\Filters;

use Essa\APIToolKit\Filters\QueryFilters;

class PasswordFilters extends QueryFilters
{
    protected array $allowedFilters = [];

    protected array $columnSearch = [];
}
