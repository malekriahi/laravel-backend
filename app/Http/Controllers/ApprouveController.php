<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Approuve;
use Validator ;

class ApprouveController extends Controller
{
    public function create(Request $request)
    {
        Approuve::create([
            'username' => $request['username'],
            'email' => $request['email'],
            'role_id' => $request['role_id'],
            'password' => $request['password'],
            'sexe' => $request['sexe'],
            'adress' => $request['adress'],
            'firstname' => $request['firstname'],
            'lastname' => $request['lastname'],
            'companyname' => $request['companyname'],
            'company_email' => $request['company_email'],
            'companyphone' => $request['companyphone'],
            'companyadress' => $request['companyadress'],
            'companyimmat' => $request['companyimmat']
        ]);
        $user= Approuve::where('email', $request->email)->first();
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response([
                    'message' => ['These credentials do not match our records.']
                ], 404);
            }

             //$token = $user->createToken('my-app-token')->plainTextToken;

            $response = [
                'user' => $user,

            ];

             return response($response, 201);


    }
    public function index(){
        $app=Approuve::all();
        return response($app,200);
    }
    public function destroy($id)
    {
        $app=Approuve::find($id);
        $app->delete();
        return response()->json($app, 200);
    }
}
