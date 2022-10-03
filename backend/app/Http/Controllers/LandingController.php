<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class LandingController extends Controller
{
    function addorExistingUser(Request $request)
    {
        // Check whether an email exists in the database
        $user_email_number = User::select('email')->where('email', $request->email)->count();
        if ($user_email_number > 0) {
            return response()->json([
                "status" => "Success",
                "data" => 'email already registered'
            ]);
        }
        // If the email doesn't exist, then create a new user
        else {
            // Validate the email address structure
            if (!filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
                return response()->json([
                    "status" => "Success",
                    "data" => "invalid email"
                ]);
            }
            // If email is validated create a new user
            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->age = $request->age;
            $user->bio = $request->bio;
            $user->picture = $request->picture;
            $user->gender = $request->gender;
            $user->favorite_gender = $request->favorite_gender;
            $user->location = $request->location;
            // Hash the password
            $user->password = hash('sha256', hash('sha256', $request->password) . 'hj');
            $user->save();
            return response()->json([
                "status" => "Success",
                "data" => $user
            ]);
        }
    }
}
