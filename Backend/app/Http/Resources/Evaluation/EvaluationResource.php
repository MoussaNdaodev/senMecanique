<?php

namespace App\Http\Resources\Evaluation;

use App\Http\Resources\Product\ProductResource;
use App\Http\Resources\ResourceAnnexe\ProductEvaluations;
use Illuminate\Http\Resources\Json\JsonResource;

class EvaluationResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            "note"=>$this->note,
            "commentaire"=>$this->commentaire,
            "product"=> new ProductEvaluations($this->resource->Product),
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
