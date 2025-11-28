<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Badge\UpdateBadgeRequest;
use App\Http\Requests\Badge\CreateBadgeRequest;
use App\Http\Resources\Badge\BadgeResource;
use App\Models\Badge;
use Essa\APIToolKit\Api\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class BadgeController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
       try{
            $badges = Badge::useFilters()->dynamicPaginate();
            return BadgeResource::collection($badges);
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
       }
    }

    public function store(CreateBadgeRequest $request): JsonResponse
    {
       try{
            $badge = Badge::create($request->validated());
            return $this->responseCreated('Badge created successfully', new BadgeResource($badge));
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
       }
    }

    public function show(Badge $badge): JsonResponse
    {
       try{
        if($badge){
            return $this->responseSuccess(null, new BadgeResource($badge));
        }else{
            return $this->responseNotFound();
        }
       }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
       }
    }

    public function update(UpdateBadgeRequest $request, Badge $badge): JsonResponse
    {
        try{
            if($badge){
                $badge->update($request->validated());
                return $this->responseSuccess('Badge updated Successfully', new BadgeResource($badge));
            }else{
                return $this->responseNotFound();
            }
        }catch(Exception $exception){
            return response()->json([
                "error"=>$exception->getMessage(),
            ]);
        }
    }

    public function destroy(Badge $badge): JsonResponse
    {
        try{
            if($badge){
                $badge->delete();
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
