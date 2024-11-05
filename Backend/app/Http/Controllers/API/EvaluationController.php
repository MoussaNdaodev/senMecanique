<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Evaluation\UpdateEvaluationRequest;
use App\Http\Requests\Evaluation\CreateEvaluationRequest;
use App\Http\Resources\Evaluation\EvaluationResource;
use App\Models\Evaluation;
use Essa\APIToolKit\Api\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class EvaluationController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
        try{
            $evaluations = Evaluation::useFilters()->dynamicPaginate();
            return EvaluationResource::collection($evaluations);
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function store(CreateEvaluationRequest $request): JsonResponse
    {
        try{
            $evaluation = new Evaluation();
            $evaluation->note = $request->note;
            $evaluation->commentaire = $request->commentaire;
            $evaluation->Product()->associate($request->product_id);
            $evaluation->save();
            return $this->responseCreated('Evaluation created successfully', new EvaluationResource($evaluation));
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function show(Evaluation $evaluation): JsonResponse
    {
        try {
            if($evaluation){
                return $this->responseSuccess(null, new EvaluationResource($evaluation));
            }else{
                return $this->responseNotFound();
            }
        } catch ( Exception $exception) {
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function update(UpdateEvaluationRequest $request, Evaluation $evaluation): JsonResponse
    {
        try {
            if($evaluation){
                $evaluation->update($request->validated());
            }else {
                return $this->responseNotFound();
            }
            return $this->responseSuccess('Evaluation updated Successfully', new EvaluationResource($evaluation));
        } catch (Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function destroy(Evaluation $evaluation): JsonResponse
    {
        try {
            if($evaluation){
                $evaluation->delete();
            }else{
                return $this->responseNotFound();
            }
            return $this->responseDeleted();
        } catch (Exception  $exception) {
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }


}
