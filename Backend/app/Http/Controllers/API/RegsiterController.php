<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Regsiter\UpdateRegsiterRequest;
use App\Http\Requests\Regsiter\CreateRegsiterRequest;
use App\Http\Requests\Regsiter\RegsiterRequest;
use App\Http\Resources\Regsiter\RegsiterResource;
use App\Models\Adresse;
use App\Models\Geolocalisation;
use App\Models\Regsiter;
use App\Models\User;
use Essa\APIToolKit\Api\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

use function Laravel\Prompts\error;

class RegsiterController extends Controller
{
    use ApiResponse;

    public function __construct()   
    {

    }
    public function register(RegsiterRequest $request){
       try{
            $role = Role::create(['name' => 'user']);
            $user = User::create($request->validated());
            $adresse = new Adresse();
            $adresse->departement = $request->departement;
            $adresse->region = $request->region;
            $adresse->villa = $request->villa;
            $adresse->user()->associate($user);
            $adresse->save();
            $geo = new Geolocalisation();
            $geo->latitude = $request->latitude;
            $geo->longitude = $request->longitude;
            $geo->adresse()->associate($adresse);
            $geo->save();
            $user->assignRole($role);
            return $this->responseCreated('User are registered successfully', new RegsiterResource($user));
       }catch(Exception $exception){
        return response()->json([
            "error"=>$exception->getMessage(),
        ]);
       }
    }




}
