<?php

namespace App\Http\Requests\Product;

use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "name"=>"required|string|min:6|max:70",
            "description"=>"required|string|min:20",
            "price"=>"required|numeric|regex:/^\d+(\.\d{1,2})?$/",
            "image"=>"required|image",
            "caracteristique"=>"required|string|min:10",
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
