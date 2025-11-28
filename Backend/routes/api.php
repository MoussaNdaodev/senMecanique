<?php

use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\RegsiterController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\PasswordController;
use Illuminate\Http\Request;


Route::apiResource('/products', ProductController::class);

/*===========================
=           stocks           =
=============================*/

Route::apiResource('/stocks', \App\Http\Controllers\API\StockController::class);

/*=====  End of stocks   ======*/

/*===========================
=           evaluations           =
=============================*/

Route::apiResource('/evaluations', \App\Http\Controllers\API\EvaluationController::class);

/*=====  End of evaluations   ======*/

/*===========================
=           categories           =
=============================*/

Route::apiResource('/categories', \App\Http\Controllers\API\CategoryController::class);

/*=====  End of categories   ======*/

/*===========================
=           paniers           =
=============================*/

Route::apiResource('/paniers', \App\Http\Controllers\API\PanierController::class);

/*=====  End of paniers   ======*/

/*===========================
=           promotions           =
=============================*/

Route::apiResource('/promotions', \App\Http\Controllers\API\PromotionController::class);

/*=====  End of promotions   ======*/

/*===========================
=           badges           =
=============================*/

Route::apiResource('/badges', \App\Http\Controllers\API\BadgeController::class);

/*=====  End of badges   ======*/






Route::get('/user', function (Request $request){
    return $request->user();
})->middleware('auth:sanctum','verified');





// route d'authentification
/*===========================
=           passwords           =
=============================*/

Route::middleware('auth:sanctum')->post('/update-password', [PasswordController::class, 'updatePassword']);

Route::middleware('auth:sanctum','verified')->post('/forgot-password', [PasswordController::class, 'forgotPassword']);

Route::middleware('auth:sanctum','verified')->post('/reset-password', [PasswordController::class, 'resetPassword']);

/*=====  End of passwords   ======*/
/*===========================
=           registers           =
=============================*/

Route::post('/register', [RegsiterController::class, 'register']);

/*=====  End of registers   ======*/
/*===========================
=           logins           =
=============================*/

Route::post('/login', [LoginController::class, 'login']);

/*=====  End of logins   ======*/

/*===========================
=           logout          =
=============================*/

Route::middleware('auth:sanctum')->post('/logout', [LoginController::class, 'logout']);

/*=====  End of logout   ======*/




/*===========================
=           adresses           =
=============================*/

Route::apiResource('/adresses', \App\Http\Controllers\API\AdresseController::class);

/*=====  End of adresses   ======*/

/*===========================
=           geolocalisations           =
=============================*/

Route::apiResource('/geolocalisations', \App\Http\Controllers\API\GeolocalisationController::class);

/*=====  End of geolocalisations   ======*/
