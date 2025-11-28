<?php

namespace App\Http\Resources\ResourceAnnexe;

use App\Http\Resources\ResourceAnnexe\CategoryProductsResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductEvaluations extends JsonResource
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
            "category" => new CategoryProductsResource($this->resource->Category),
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
