<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Panier\UpdatePanierRequest;
use App\Http\Requests\Panier\CreatePanierRequest;
use App\Http\Resources\Panier\PanierResource;
use App\Models\Panier;
use Essa\APIToolKit\Api\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class PanierController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
        try{
            $paniers = Panier::useFilters()->dynamicPaginate();
            return PanierResource::collection($paniers);
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage()
            ]);
        }
    }

    public function store(CreatePanierRequest $request): JsonResponse
    {
        try{
            $panier = Panier::create($request->validated());
            return $this->responseCreated('Panier created successfully', new PanierResource($panier));
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage()
            ]);
        }
    }

    public function show(Panier $panier): JsonResponse
    {
        try{
            if($panier){
                return $this->responseSuccess(null, new PanierResource($panier));
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage()
            ]);
        }
    }

    public function update(UpdatePanierRequest $request, Panier $panier): JsonResponse
    {
       try{
            if($panier){
                $panier->update($request->validated());
                return $this->responseSuccess('Panier updated Successfully', new PanierResource($panier));
            }else{
                return $this->responseNotFound();
            }
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage()
            ]);
       }
    }

    public function destroy(Panier $panier): JsonResponse
    {
        try{
            if($panier){
                $panier->delete();
                return $this->responseDeleted();
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage()
            ]);
        }
    }


}
