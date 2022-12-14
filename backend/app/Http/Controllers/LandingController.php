<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class LandingController extends Controller
{
    function addorExistingUser(Request $request)
    {
        // Check whether an email exists in the database
        $user = User::where('email', $request->email)->first();
        if ($user) {
            return response()->json([
                "status" => "Success",
                "result" => 'email already registered'
            ]);
        }
        // If the email doesn't exist, then create a new user
        else {
            // Validate the email address structure
            if (!filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
                return response()->json([
                    "status" => "Success",
                    "result" => "invalid email"
                ]);
            }
            // If email is validated create a new user
            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->age = $request->age;
            $user->gender = $request->gender;
            $user->favorite_gender = $request->favorite_gender;
            // Hash the password
            $user->password = hash('sha256', hash('sha256', $request->password) . 'hj');
            $user->save();
            return response()->json([
                "status" => "Success",
                "result" => "Registration Succeeded"
            ]);
        }
    }

    function signin(Request $request)
    {
        // Validate the email address structure
        if (!filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
            return response()->json([
                "status" => "Success",
                "result" => "invalid email"
            ]);
        }
        $user = User::where('email', $request->email)->first();
        if ($user) {
            $user_input_password = hash('sha256', hash('sha256', $request->password) . 'hj');
            if ($user_input_password != $user->password) {
                return response()->json(
                    [
                        "status" => "Success",
                        "result" => 'invalid password'
                    ]
                );
            } else {
                $token = $user->createToken('Laravel Password Grant Client')->accessToken;
                $user->update(['location' => $request->location]);
                return response()->json([
                    "status" => "Success",
                    "result" => $user,
                    "token" => $token
                ]);
            }
        } else {
            return response()->json([
                "status" => "Success",
                "result" => 'email not registered'
            ]);
        }
    }
}
