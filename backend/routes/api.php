<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LandingController;

Route::post("/signup", [LandingController::class, "addorExistingUser"])->name("signup");


Route::group(['middleware' => 'auth:api',], function () {
    Route::post("/signin", [AuthController::class, "signin"])->name("signin");

    // Route::post('logout', 'AuthController@logout');
    // Route::post('refresh', 'AuthController@refresh');
    // Route::post('me', 'AuthController@me');
});
