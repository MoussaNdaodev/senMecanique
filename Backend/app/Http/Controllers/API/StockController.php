<?php

namespace App\Http\Controllers\API;
use Essa\APIToolKit\Api\ApiResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\Stock\UpdateStockRequest;
use App\Http\Requests\Stock\CreateStockRequest;
use App\Http\Resources\Stock\StockResource;
use App\Models\Stock;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class StockController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
    try{
        $stocks = Stock::useFilters()->dynamicPaginate();
        return StockResource::collection($stocks);
    }catch(Exception $exception){
        return response()->json([
            "error"=>$exception,
        ]);
    }
    }

    // public function store(CreateStockRequest $request): JsonResponse
    // {
    //    try{
    //         $stock = Stock::create($request->validated());
    //         return $this->responseCreated('Stock created successfully', new StockResource($stock));
    //    }catch(Exception $exception){
    //         return response()->json([
    //             "error"=>$exception,
    //         ]);
    //    }
    // }

    public function show(Stock $stock): JsonResponse
    {
        try{
            if($stock){
                return $this->responseSuccess(null, new StockResource($stock));
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception,
            ]);
        }
    }

    public function update(UpdateStockRequest $request, Stock $stock): JsonResponse
    {
       try{
            if($stock){
                $stock->update($request->validated());
                return $this->responseSuccess('Stock updated Successfully', new StockResource($stock));
            }else{
                return $this->responseNotFound();
            }
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception,
            ]);
       }
    }

    public function destroy(Stock $stock): JsonResponse
    {
       try{
            if($stock){
                $stock->delete();
                return $this->responseDeleted();
            }else{
                return $this->responseNotFound();
            }
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception,
            ]);
       }
    }


}
