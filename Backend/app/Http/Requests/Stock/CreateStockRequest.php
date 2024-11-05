<?php

namespace App\Http\Requests\Stock;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class CreateStockRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "quantite"=>"required|integer|min:1",
            "seuil_minimum"=>"required|integer|min:1",
        ];
    }

    protected  function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            "suscces"=>false,
            "messsage"=>$validator->errors(),
        ]));
    }
}
