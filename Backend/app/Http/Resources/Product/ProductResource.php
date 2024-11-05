<?php

namespace App\Http\Resources\Product;

use App\Http\Resources\Category\CategoryResource;
use App\Http\Resources\ResourceAnnexe\CategoryProductsResource;
use App\Http\Resources\Evaluation\EvaluationResource;
use App\Http\Resources\PromotionProductsResource;
use App\Http\Resources\ResourceAnnexe\EvaluationsProductResource;
use App\Http\Resources\Stock\StockResource;
use App\Models\Evaluation;
use App\Models\Stock;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Date;

class ProductResource extends JsonResource
{

    public function toArray($request): array
    {

        $note_evaluation = $this->resource->Evaluations()->avg("note");
        $evaluation = EvaluationsProductResource::collection($this->resource->Evaluations);
        $promotions = PromotionProductsResource::collection($this->resource->activePromotions()->get());
        // $reduction_prix = $this->resource->getDiscountedPriceAttribute()->get();
        // dd($promotions,$reduction_prix);
        $stock = StockResource::collection($this->stock()->get());
        return [
            'id' => $this->id,
            "name"=>$this->name,
            "description"=>$this->description,
            "price"=>$this->price,
            "image"=>$this->image,
            "caracteristique"=>$this->caracteristique,
            "evaluations"=>!empty($evaluation ) ? $evaluation : null,
            "promotions"=>!empty($promotions) ? $promotions : null,
            "prix_reduction"=>isset($reduction_prix) && !empty($reduction_prix) ? $reduction_prix : 00,
            "moyenne_evaluation"=> $note_evaluation,
            "stock"=>!empty($stock) ? $stock : null,
            "category" => new CategoryProductsResource($this->resource->Category),
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
