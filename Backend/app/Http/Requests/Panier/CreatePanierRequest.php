<?php

namespace App\Http\Requests\Panier;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class CreatePanierRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "prix_total"=>"required|integer|min:3",
            "status"=>"required|string|min:3",
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
