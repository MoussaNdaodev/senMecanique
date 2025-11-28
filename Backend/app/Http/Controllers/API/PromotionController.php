<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Promotion\UpdatePromotionRequest;
use App\Http\Requests\Promotion\CreatePromotionRequest;
use App\Http\Resources\Promotion\PromotionResource;
use App\Models\Product;
use App\Models\Promotion;
use Essa\APIToolKit\Api\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class PromotionController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
        try{
            $promotions = Promotion::useFilters()->dynamicPaginate();
            return PromotionResource::collection($promotions);
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function store(CreatePromotionRequest $request): JsonResponse
    {
       try{
            $promotion = new Promotion();
            $promotion->nom = $request->nom;
            $promotion->save();


            foreach ($request->products as $productData) {
                $product = Product::find($productData['id']);
                $promotion->Products()->attach($product, [
                    'pourcentage_reduction' => $productData['pourcentage_reduction'],
                    'date_debut' => $productData['date_debut'],
                    'date_fin' => $productData['date_fin'],
                ]);
            }
            return $this->responseCreated('Promotion created successfully', new PromotionResource($promotion));
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
       }
    }

    public function show(Promotion $promotion): JsonResponse
    {
        try{
            if($promotion){
                return $this->responseSuccess(null, new PromotionResource($promotion));
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function update(UpdatePromotionRequest $request, Promotion $promotion): JsonResponse
    {
       try{
            if($promotion){
                $promotion->update($request->validated());
                return $this->responseSuccess('Promotion updated Successfully', new PromotionResource($promotion));
            }else{
                return $this->responseNotFound();
            }
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
       }
    }

    public function destroy(Promotion $promotion): JsonResponse
    {
       try{
            if($promotion){
                $promotion->delete();
                return $this->responseDeleted();
            }else{
                return $this->responseNotFound();
            }
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
       }
    }


}
