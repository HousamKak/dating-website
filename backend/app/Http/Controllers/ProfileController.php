<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Http\images;

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

        // Taking care of the image

        if ($request->picture) {

            $base_url = str_replace("backend","server_images",base_path());
            
            $url = $base_url . "\\" . $request->user_id . ".jpg";
            try {
                unlink($url);
            } catch (\Throwable $th) {
            }

            $image = $request->picture;

            $image_base64_decode = base64_decode($image);

            file_put_contents($url, $image_base64_decode);
            $user->update(['picture' => $url]);

            return response()->json([
                "status" => "Success",
                "result" => $url
            ]);
        }
    }
}
