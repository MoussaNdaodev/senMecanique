<?php

namespace App\Http\Resources\Login;

use Illuminate\Http\Resources\Json\JsonResource;

class LoginResource extends JsonResource
{
    protected $token;

    public function __construct($resource, $token)
    {
        // Initialisez les propriétés de la ressource et le token
        parent::__construct($resource);
        $this->token = $token;
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name'=>$this->name,
            "email"=>$this->email,
            "token"=>$this->token,
            'created_at' => dateTimeFormat($this->created_at),
            'updated_at' => dateTimeFormat($this->updated_at),
        ];
    }
}
