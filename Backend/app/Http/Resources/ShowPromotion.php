<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ShowPromotion extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'pourcentage_reduction' => $this->pivot->pourcentage_reduction,
            'date_debut' => $this->pivot->date_debut,
            'date_fin' => $this->pivot->date_fin,
        ];
    }
}
