<?php

namespace App\Http\Resources\Regsiter;

use App\Http\Resources\Adresse\AdresseResource;
use Illuminate\Http\Resources\Json\JsonResource;

class RegsiterResource extends JsonResource
{

    public function toArray($request): array
    {
        $adresse = AdresseResource::collection($this->adresse()->get());
        return [
            'id' => $this->id,
            'name'=>$this->name,
            "email"=>$this->email,
            "telephone"=>$this->telephone,
            "adresse"=>!empty($adresse) ? $adresse : null,
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
