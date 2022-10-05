<?php
// Note:
// // jwt didn't work it always showed an error, so I needed to drop it and continue working
// I had the following error
//  - Root composer.json requires tymon/jwt-auth ^0.5.12 -> satisfiable by tymon/jwt-auth[0.5.12].
// - tymon/jwt-auth 0.5.12 requires illuminate/support ~5.0 -> found illuminate/support[v5.0.0, ..., 5.8.x-dev] 
// but these were not loaded, likely because it conflicts with another require.
// Route::group(['middleware' => 'auth:api',], function () { 

use App\Http\Controllers\DisplayController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LandingController;
use App\Http\Controllers\ProfileController;

Route::post("/signup", [LandingController::class, "addorExistingUser"])->name("signup");
Route::post("/signin", [LandingController::class, "signin"])->name("signin");

Route::post("/user/info", [ProfileController::class, "userInfo"])->name("userInfo");
Route::post("/user/update", [ProfileController::class, "userUpdate"])->name("userUpdate");
Route::post("/feed", [DisplayController::class, "getFeed"])->name("getFeed");

Route::post("/favorites/update", [DisplayController::class, "addFavorites"])->name("addFavorites");
Route::post("/favorites/remove", [DisplayController::class, "remFavorites"])->name("remFavorites");
Route::post("/myfavorites", [DisplayController::class, "getFavorites"])->name("getFavorites");

// });
