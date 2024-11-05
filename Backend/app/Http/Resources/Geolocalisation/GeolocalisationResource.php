<?php

namespace App\Http\Resources\Geolocalisation;

use Illuminate\Http\Resources\Json\JsonResource;

class GeolocalisationResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,            "latitude"=>$this->latitude,
            "longitude"=>$this->longitude,
        ];
    }
}
