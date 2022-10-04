<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LandingController;

Route::post("/signup", [LandingController::class, "addorExistingUser"])->name("signup");

// jwt didn't work it always showed an error, so I needed to drop it and continue working
// I had the following error
//  - Root composer.json requires tymon/jwt-auth ^0.5.12 -> satisfiable by tymon/jwt-auth[0.5.12].
// - tymon/jwt-auth 0.5.12 requires illuminate/support ~5.0 -> found illuminate/support[v5.0.0, ..., 5.8.x-dev] 
// but these were not loaded, likely because it conflicts with another require.



// Route::group(['middleware' => 'auth:api',], function () { 
Route::post("/signin", [LandingController::class, "signin"])->name("signin");
// });
