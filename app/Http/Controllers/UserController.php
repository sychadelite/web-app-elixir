<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Validator;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function indexAllUsers()
    {
        // $users = DB::table('users')->select('nomor_pelanggan', 'name')->get();               // -> get() is used to fetch all data
        // dump($users);                                                                        // create log rows in console
        // return response()->json($users);

        $users = User::all();                                                                   // eloquent ORM technique : if model class in app/Models is already created
        return response()->json($users);
    }

    public function showUser($id)                                                               // "$id" for parameter showUser() in api.php       
    {
        $user_data = DB::table('users')->where('nomor_pelanggan', $id)->first();                // where('<your-field-primary-key>', <your-parameter> in showUser() exactly same as on api.php) -> first() is used to fetch just one data
        return response()->json($user_data);

        // $user_data = User::find($id);                                                        // eloquent ORM technique : if model class in app/Models is already created
        // return response()->json($user_data);
    }

    public function storeUser(Request $request)                                                 // Request $request is a request from form
    {
        // $user = new User;
        // $user->name = $request->name;                                                        // first method of creating data is using save() method: $user-><your-attribute name in database> = $request-><your-v-model-form-in-register.vue>
        // $user->alamat = $request->alamat;
        // $user->email = $request->email;
        // $user->password = Hash::make($request->password);

        // $user->save();
        
        // $validation = $request->validate([
        //     'name' => 'required',
        //     'alamat' => 'required',                                                       
        //     'email' => 'required|email|unique:users',
        //     'password' => 'required|min:6' 
        // ]);

        $validation = Validator::make($request->all(), [                                        // second method validation manually: validate and redirect
            'username' => 'required|unique:users|min:6|max:18',
            'name' => 'required|min:4',
            'alamat' => 'required',                                                       
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'                                                      // confirmed ?
        ]);

        if ($validation->fails()) :                                                             // checking the $validation and create an error code
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);                                                                            // declare the desired error code
        endif;

        $user = User::create([
            "username" => $request['username'],
            "name" => $request['name'],                                                           // $user variable must created to solve error 500
            "alamat" => $request['alamat'],                                                       // <your-column> => retrieve value from $request-><your-v-model-form-variable>
            "email" => $request['email'],
            "password" => Hash::make($request['password'])
        ]);

        // $token = $user->createToken('myapptoken')->plainTextToken;

        $res = [
            'user' => $user,
            // 'token' => $token
        ];

        if ($res) :
            // return response($res, 201);
            return response()->json([
                "status" => true,                                                                   // keyword variable for registration information to user
                "message" => 'Registrasi Berhasil',
                "data" => $res
            ]);
        endif;

        // return $user;                                                                        // Just return the value of $user variable

        // return $request->all();                                                              // first method to post a value, just using this return
    }

    public function updateUser($id, Request $request)
    {
        $validation = Validator::make($request->all(), [                                        // second method validation manually: validate and redirect
            'name' => 'required',
            'username' => 'required|min:6|max:18',
            'alamat' => 'required',                                                       
            'email' => 'required|email'
        ]);

        if ($validation->fails()) :                                                             
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);                                                                            
        endif;

        User::where('nomor_pelanggan', $id)                                                     // Example Mass Updates: Flight::where('active', 1)->where('destination', 'San Diego')->update(['delayed' => 1]);
        ->update([
            'name' => $request->name,
            'username' => $request->username,
            'alamat' => $request->alamat,
            'email' => $request->email
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Data user berhasil diupdate'
        ]);
    }

    public function updateStatusUser0($id_s0)
    {
        User::where('nomor_pelanggan', $id_s0)
        ->update([
            'status' => '1'
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Status user '. $id_s0 .' berhasil diupdate'
        ]);
    }

    public function updateStatusUser1($id_s1)
    {
        User::where('nomor_pelanggan', $id_s1)
        ->update([
            'status' => '0'
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Status user '. $id_s1 .' berhasil diupdate'
        ]);
    }

    public function destroyUser($id)
    {           
        $user_delete = DB::table('users')->where('nomor_pelanggan', $id)->delete();             // delete models using queries
        return response()->json([
            'status' => true,
            'message' => 'Data user berhasil dihapus'
        ]);
    }
    
    public function uploadUserPhoto($id, Request $request) 
    {
        $user_photo = DB::table('users')->where('nomor_pelanggan', $id)->first();

        $validation = Validator::make($request->all(), [
            'photo' => 'required|mimes:jpg,jpeg,png,webp'
        ]);

        if ($validation->fails()) :                                                             
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);                                                                            
        endif;

        $imageName = time().'.'.$request->photo->extension();

        $path = public_path('images');
        
        if(!empty($user_photo->photo) && file_exists($path.'/'.$user_photo->photo)) :       // validation if user has photo data
            unlink($path.'/'.$user_photo->photo);
        endif;

        User::where('nomor_pelanggan', $id)->update([                                       // manual method using query
            'photo' => $user_photo->photo = $imageName
        ]);

        /* $user_photo->photo = $imageName;                                                 // auto method using Models
        $user_photo->save(); */

        $request->photo->move(public_path('images'), $imageName);
        return response()->json([
            "status" => true,
            "message" => 'Image Successfully Uploaded'
        ]);

        // return $request->photo;                                                          // temp data: $user_photo-><refer-to-your-formData-append-prefix-keyword>
    }

    public function searchUser($nama)
    {
        $res = User::select('nomor_pelanggan', 'name','alamat')->where('name', 'like', '%'.$nama.'%')->get();
        return response()->json([
            "status" => true,
            "message" => $nama . 'Collected',
            "data" => $res
        ]);
    }

    public function usernameCheck($nama)
    {
        $res = User::select('username')->where('username', 'like', $nama)->first();

        if ($res) {
            return response()->json([
                "status" => false,
                "message" => $nama . ' Is already used',
            ], 403);
        }

        return response()->json([
            "status" => true,
            "message" => $nama . 'Collected',
            "data" => $res
        ]);
    }
}
