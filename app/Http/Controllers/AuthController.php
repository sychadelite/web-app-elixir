<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;                                                                            // import the models class
use Illuminate\Support\Facades\Hash;
use Validator;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{

    public function loginUser(Request $request)
    {
        // $credentials = $request->only('email', 'password');

        // if (Auth::attempt($credentials)) {
        //     return response(Auth::user(), 200);
        // } else {
        //     return response()->json([
        //         'status' => false,
        //         'message' => 'Invalid Login Credentials'
        //     ], 401); 
        // }
        
        // if (!$validation) :
        //     return response()->json([
        //         "status" => false,
        //         "message" => $validation->errors(),
        //     ], 403);                                                                            
        // endif;

        $validation = Validator::make($request->all(), [                                        
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);

        if ($validation->fails()) :                                                             
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);
        endif;

        // check email
        $user = User::where('email', $request['email'])->first();

        // check password
        if(!$user || !Hash::check($request['password'], $user->password)) {
            return response([
                'message' => 'Bad Credentials'
            ], 401);
        }

        $token = $user->createToken('myapptoken')->plainTextToken;

        // $res = [
        //     'user' => $user,
        //     'token' => $token
        //     'token_type' => 'Bearer',
        // ];

        // if ($res) :
            return response()->json([
                "status" => true,                                                                   // keyword variable for registration information to user
                "message" => 'Hi '.$user->name.', welcome to Elixir',
                "access_token" => $token,
                'token_type' => 'Bearer',
                // "data" => $user
            ]);
        // endif;
        // return response($res, 201);
    }

    public function logoutUser()
    {
        // auth()->user()->tokens()->delete();                              // Revoke all of tokens based on logged ID
        auth()->user()->currentAccessToken()->delete();                     // Revoke current token based on logged ID

        return response()->json([
            "status" => true,
            "message" => 'You have successfully logged out'
        ]);

        // $response = [
        //     'status'=> true,
        //     'message'=>'You have successfully logged out and the token was successfully deleted',
        // ];

        // return response($response, 201); 
    }

    public function forgetPass(Request $request)
    {
        $validation = Validator::make($request->all(), [                                        
            'email' => 'required|email',
        ]);

        if ($validation->fails()) :                                                             
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);
        endif;

        // check email
        $user = User::where('email', $request['email'])->first();

        // check password
        if(!$user) {
            return response([
                'message' => '404: Email Not Found'
            ], 404);
        }

        return response([
            "status" => true,
            'message' => 'Valid !'
        ]);
    }

    public function getUser()
    {
        // return auth()->user();

        $userAuth = auth()->user();
        // $token = $request->bearerToken();
        return response()->json([
            "status" => true,
            "message" => 'Data collected',
            // "access_token" => $token,
            'token_type' => 'Bearer',
            "data" => $userAuth
        ]);
    }

    public function getSambungan()
    {      
        $sambungan = User::join('sambungan', function($join)
        {
            $join->on('users.nomor_pelanggan', '=', 'sambungan.nomor_pelanggan')
                 ->where('sambungan.nomor_pelanggan', '=', auth()->user()->nomor_pelanggan);
        })
        ->first();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $sambungan
        ]);
        
    }

    public function getAuthenticated()
    {
        $user_token = DB::table('personal_access_tokens')->get();
        return response()->json($user_token);
        // return true;
    }
}
