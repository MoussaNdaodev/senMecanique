<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Adresse\UpdateAdresseRequest;
use App\Http\Requests\Adresse\CreateAdresseRequest;
use App\Http\Resources\Adresse\AdresseResource;
use App\Models\Adresse;
use Essa\APIToolKit\Api\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class AdresseController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
        $adresses = Adresse::useFilters()->dynamicPaginate();

        return AdresseResource::collection($adresses);
    }

    // public function store(CreateAdresseRequest $request): JsonResponse
    // {
    //     $adresse = Adresse::create($request->validated());

    //     return $this->responseCreated('Adresse created successfully', new AdresseResource($adresse));
    // }

    public function show(Adresse $adresse): JsonResponse
    {
        return $this->responseSuccess(null, new AdresseResource($adresse));
    }

    public function update(UpdateAdresseRequest $request, Adresse $adresse): JsonResponse
    {
        $adresse->update($request->validated());

        return $this->responseSuccess('Adresse updated Successfully', new AdresseResource($adresse));
    }

    public function destroy(Adresse $adresse): JsonResponse
    {
        $adresse->delete();

        return $this->responseDeleted();
    }


}
