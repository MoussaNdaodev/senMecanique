<?php

namespace App\Http\Controllers\API;
use Essa\APIToolKit\Api\ApiResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\Product\UpdateProductRequest;
use App\Http\Requests\Product\CreateProductRequest;
use App\Http\Resources\Product\ProductResource;
use App\Models\Category;
use App\Models\Product;
use App\Models\Stock;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class ProductController extends Controller
{
    use ApiResponse;

    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
       try{
            $products = Product::useFilters()->dynamicPaginate();
            return ProductResource::collection($products);
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception,
            ]);
       }
    }

    public function store(CreateProductRequest $request): JsonResponse
    {
      try{
        $product = new Product();
        $product->name = $request->name;
        $product->description = $request->description;
        $product->price = $request->price;
        $product->image = $request->image;
        $product->caracteristique = $request->caracteristique;
        $product->Category()->associate($request->category_id);
        $product->save();
        $stock = new Stock();
        $stock->quantite = $request->quantite;
        $stock->seuil_minimum = 1;
        $stock->product()->associate($product);
        $stock->save();

        return $this->responseCreated('Product created successfully', new ProductResource($product));
      }catch(Exception $exception){
        return response()->json($exception);
      }
    }

    public function show(Product $product): JsonResponse
    {
        try{
            if($product){
                return $this->responseSuccess(null, new ProductResource($product));
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception,
            ]);
        }
    }

    public function update(UpdateProductRequest $request, Product $product): JsonResponse
    {
     try{
        if($product){
            $product->update($request->validated());
        }else{
            return $this->responseNotFound();
        }
        return $this->responseSuccess('Product updated Successfully', new ProductResource($product));
     }catch(Exception $exception){
        return response()->json([
            "error"=>$exception,
        ]);
     }
    }

    public function destroy(Product $product): JsonResponse
    {
        try{
            if($product){
                $product->delete();
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
