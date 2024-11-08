<?php

namespace App\Http\Resources\ResourceAnnexe;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryProductsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return[
            'id' => $this->id,
            "nom"=>$this->nom,
            "description"=>$this->description,
        ];
    }
}
