<?php

namespace App\Http\Requests\Regsiter;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class RegsiterRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            "telephone" =>"integer|min:9",
            "departement"=>"required|string|min:4",
            "region"=>"string|min:4|nullable",
            "villa"=>"string|min:4|nullable",
            "latitude"=>'required|string|min:1',
            "longitude"=>'required|string|min:1',
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            "success"=> false,
            "errors"=>$validator->errors(),
        ]));
    }
}
