<?php

namespace App\Http\Resources\ResourceAnnexe;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductsCategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            "name"=>$this->name,
            "description"=>$this->description,
            "price"=>$this->price,
            "image"=>$this->image,
            "caracteristique"=>$this->caracteristique,
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
