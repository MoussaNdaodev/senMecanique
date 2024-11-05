<?php

namespace App\Http\Requests\Promotion;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class CreatePromotionRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "nom"=>"required|string|min:3",
            "products"=>"required|array",
            'products.*.id' => 'required|exists:products,id',
            'products.*.pourcentage_reduction' => 'required|integer|min:0|max:100',
            'products.*.date_debut' => 'required|date',
            'products.*.date_fin' => 'required|date|after_or_equal:products.*.date_fin',
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
