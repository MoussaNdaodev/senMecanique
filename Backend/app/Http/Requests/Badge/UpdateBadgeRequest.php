<?php

namespace App\Http\Requests\Badge;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateBadgeRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "nom"=>"required|string|min:3",
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            "success"=>false,
            "error"=>$validator->errors(),
        ]));
    }
}
