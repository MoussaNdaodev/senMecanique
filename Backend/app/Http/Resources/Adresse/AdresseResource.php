<?php

namespace App\Http\Resources\Adresse;

use App\Http\Resources\Geolocalisation\GeolocalisationResource;
use Illuminate\Http\Resources\Json\JsonResource;

class AdresseResource extends JsonResource
{
    public function toArray($request): array
    {
        $geo = GeolocalisationResource::collection($this->geo()->get());
        return [
            'id' => $this->id,
            "departement"=>$this->departement,
            "region"=>$this->region,
            "villa"=>$this->villa,
            "geo"=>!empty($geo)? $geo : null,
        ];
    }
}
