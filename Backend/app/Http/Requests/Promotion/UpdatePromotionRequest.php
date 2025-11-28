<?php

namespace App\Http\Requests\Promotion;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdatePromotionRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "nom"=>"required|string|min:3",
            "pourcentage_reduction"=>"required|integer|min:1|max:100",
            "date_debut"=>"required|date",
            "date_fin"=>"required|date",
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            "sucess"=>false,
            "error"=>$validator->errors(),
        ]));
    }
}
