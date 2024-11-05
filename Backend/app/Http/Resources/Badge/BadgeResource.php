<?php

namespace App\Http\Resources\Badge;

use Illuminate\Http\Resources\Json\JsonResource;

class BadgeResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            "nom"=>$this->nom,
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
