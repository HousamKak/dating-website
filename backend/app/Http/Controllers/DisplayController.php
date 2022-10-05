<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class DisplayController extends Controller
{
    function getFeed(Request $request)
    {
        $users = USER::select("user_id", "picture", "name", "age", "gender", "bio", "location")->where("favorite_gender", $request->favorite_gender)->get();

        return response()->json([
            "status" => "Success",
            "result" => $users
        ]);
    }
}
