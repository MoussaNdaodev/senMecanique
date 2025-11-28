<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Geolocalisation\UpdateGeolocalisationRequest;
use App\Http\Requests\Geolocalisation\CreateGeolocalisationRequest;
use App\Http\Resources\Geolocalisation\GeolocalisationResource;
use App\Models\Geolocalisation;
use Essa\APIToolKit\Api\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class GeolocalisationController extends Controller
{
    use ApiResponse;
    public function __construct()
    {

    }

    public function index(): AnonymousResourceCollection
    {
        $geolocalisations = Geolocalisation::useFilters()->dynamicPaginate();

        return GeolocalisationResource::collection($geolocalisations);
    }

    // public function store(CreateGeolocalisationRequest $request): JsonResponse
    // {
    //     $geolocalisation = Geolocalisation::create($request->validated());

    //     return $this->responseCreated('Geolocalisation created successfully', new GeolocalisationResource($geolocalisation));
    // }

    public function show(Geolocalisation $geolocalisation): JsonResponse
    {
        return $this->responseSuccess(null, new GeolocalisationResource($geolocalisation));
    }

    public function update(UpdateGeolocalisationRequest $request, Geolocalisation $geolocalisation): JsonResponse
    {
        $geolocalisation->update($request->validated());

        return $this->responseSuccess('Geolocalisation updated Successfully', new GeolocalisationResource($geolocalisation));
    }

    public function destroy(Geolocalisation $geolocalisation): JsonResponse
    {
        $geolocalisation->delete();

        return $this->responseDeleted();
    }


}
