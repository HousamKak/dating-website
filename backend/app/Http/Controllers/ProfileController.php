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
        if ($request->name) {
            $user->update(['name' => $request->name]);
        }
        if ($request->picture) {
            $user->update(['picture' => $request->picture]);
        }
        if ($request->age) {
            $user->update(['age' => $request->age]);
        }
        if ($request->gender) {
            $user->update(['gender' => $request->gender]);
        }
        if ($request->favorite_gender) {
            $user->update(['favorite_gender' => $request->favorite_gender]);
        }
        if ($request->bio) {
            $user->update(['bio' => $request->bio]);
        }
    }
}
