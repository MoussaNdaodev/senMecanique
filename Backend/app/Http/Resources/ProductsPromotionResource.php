<?php

namespace App\Http\Resources;

use App\Http\Resources\ResourceAnnexe\CategoryProductsResource;
use App\Http\Resources\ResourceAnnexe\EvaluationsProductResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductsPromotionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $note_evaluation = $this->resource->Evaluations()->avg("note");
        $evaluation = EvaluationsProductResource::collection($this->resource->Evaluations);
        return [
            'id' => $this->id,
            "name"=>$this->name,
            "description"=>$this->description,
            "price"=>$this->price,
            "image"=>$this->image,
            "caracteristique"=>$this->caracteristique,
            "evaluations"=>!empty($evaluation ) ? $evaluation : null,
            "moyenne"=> $note_evaluation,
            "category" => new CategoryProductsResource($this->resource->Category),
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
