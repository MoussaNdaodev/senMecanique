<?php

namespace App\Http\Requests\Product;

use Error;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class CreateProductRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "name"=>"required|string|min:6|max:70",
            "description"=>"required|string|min:20",
            "price"=>"required|numeric|regex:/^\d+(\.\d{1,2})?$/",
            "image"=>"required|string",
            "caracteristique"=>"required|string|min:10",
            "category_id"=>"required|integer|exists:Categories,id",
            "quantite"=>"required|integer|min:1",
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            "success"=>false,
            "error_List"=>$validator->errors(),
        ]));
    }
}
