<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LandingController;

Route::post("/signup", [LandingController::class, "addorExistingUser"])->name("signup");
