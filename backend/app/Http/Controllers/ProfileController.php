<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class ProfileController extends Controller
{
    function userInfo(Request $request)
    {
        $user = User::where('user_id', $request->user_id)->first();
        return response()->json([
            "status" => "Success",
            "result" => $user
        ]);
    }

    function userUpdate(Request $request)
    {
        $user = User::where('user_id', $request->user_id);
        $user->update(['name' => $request->name]);
        $user->update(['picture' => $request->picture]);
        $user->update(['age' => $request->age]);
        $user->update(['gender' => $request->gender]);
        $user->update(['favorite_gender' => $request->favorite_gender]);
    }
}
