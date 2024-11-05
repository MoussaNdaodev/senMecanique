<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Category\UpdateCategoryRequest;
use App\Http\Requests\Category\CreateCategoryRequest;
use App\Http\Resources\Category\CategoryResource;
use App\Models\Category;
use Essa\APIToolKit\Api\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class CategoryController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
        try{
            $categories = Category::useFilters()->dynamicPaginate();
            return CategoryResource::collection($categories);
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function store(CreateCategoryRequest $request): JsonResponse
    {
        try{
            $category = Category::create($request->validated());
            return $this->responseCreated('Category created successfully', new CategoryResource($category));
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function show(Category $category): JsonResponse
    {
        try{
            if($category){
                return $this->responseSuccess(null, new CategoryResource($category));
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }
    public function update(UpdateCategoryRequest $request, Category $category): JsonResponse
    {
        try{
            if($category){
                $category->update($request->validated());
                return $this->responseSuccess('Category updated Successfully', new CategoryResource($category));
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function destroy(Category $category): JsonResponse
    {
        try{
            if($category){
                $category->delete();
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
