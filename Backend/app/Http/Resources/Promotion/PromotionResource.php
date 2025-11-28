<?php

namespace App\Http\Resources\Promotion;

use App\Http\Resources\ProductsPromotionResource;
use App\Http\Resources\PromotionProductsResource;
use App\Http\Resources\ShowPromotion;
use Illuminate\Http\Resources\Json\JsonResource;

use function Pest\Laravel\get;

class PromotionResource extends JsonResource
{
    public function toArray($request): array
    {
        $products = ProductsPromotionResource::collection($this->resource->Products);
        $promotions = ShowPromotion::collection($this->resource->Products()->get());
        return [
            'id' => $this->id,
            "nom"=>$this->nom,
            "promotion_propriety"=>$promotions,
            "products"=> !empty($products) ? $products : null,
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
