<?php

namespace App\Http\Requests\Evaluation;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateEvaluationRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            "note"=>"integer|min:1|max:5",
            "commentaire"=>"string|min:10",
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
