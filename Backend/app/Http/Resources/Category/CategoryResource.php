<?php

namespace App\Http\Resources\Category;

use App\Http\Resources\Product\ProductResource;
use App\Http\Resources\ResourceAnnexe\ProductsCategoryResource;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    public function toArray($request): array
    {
        $products = ProductsCategoryResource::collection($this->resource->Products);
        return [
            'id' => $this->id,
            "nom"=>$this->nom,
            "description"=>$this->description,
            "products"=> !empty($products) ? $products : null,
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
