<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LandingController;
// 
Route::post("/signup/{name?}/{email?}/{age?}/{bio?}/{picture?}/{gender?}/{favorite_gender?}", [LandingController::class, "addorExistingUser"])->name("signup");
