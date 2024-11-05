<?php

namespace App\Http\Resources\Panier;

use Illuminate\Http\Resources\Json\JsonResource;

class PanierResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            "prix_total"=>$this->prix_total,
            "status"=>$this->status,
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
