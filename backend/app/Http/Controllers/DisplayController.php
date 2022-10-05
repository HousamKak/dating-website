<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Favorite;

class DisplayController extends Controller
{
    function getFeed(Request $request)
    {
        $users = USER::select("user_id", "picture", "name", "age", "gender", "bio", "location")->where("gender", $request->favorite_gender)->get();

        return response()->json([
            "status" => "Success",
            "result" => $users
        ]);
    }

    function addFavorites(Request $request)
    {

        $fav = ['admirer_id' => $request->admirer_id, 'favorited_id' => $request->favorited_id];
        $fav_relation = Favorite::where($fav)->get();

        if (count($fav_relation) == 0) {
            $faved_people = new Favorite;
            $faved_people->admirer_id = $request->admirer_id;
            $faved_people->favorited_id = $request->favorited_id;
            $faved_people->save();
            return response()->json([
                "status" => "Success",
                "result" => $faved_people
            ]);
        }
    }
    function remFavorites(Request $request)
    {
        $fav = ['admirer_id' => $request->admirer_id, 'favorited_id' => $request->favorited_id];
        $fav_relation = Favorite::where($fav)->delete();
    }
}
