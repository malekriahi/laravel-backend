<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Post;
use Illuminate\Support\Facades\DB;
use Validator ;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    function index(Request $request)
    {
        $user= User::where('email', $request->email)->first();
        // print_r($data);
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response([
                    'message' => ['These credentials do not match our records.']
                ], 404);
            }

             $token = $user->createToken('my-app-token')->plainTextToken;

            $response = [
                'user' => $user,
                'token' => $token
            ];

             return response($response, 200);
    }

    public function create(Request $request)
    {
        User::create([
            'username' => $request['username'],
            'email' => $request['email'],
            'role_id' => $request['role_id'],
            'password' => Hash::make($request['password']),
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
        $user= User::where('email', $request->email)->first();
        // print_r($data);
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response([
                    'message' => ['These credentials do not match our records.']
                ], 404);
            }

             $token = $user->createToken('my-app-token')->plainTextToken;

            $response = [
                'user' => $user,
                'token' => $token
            ];

             return response($response, 201);


    }


    public function profil()
    {

        $i=Auth::user();


        $posts=Post::where('user_id',$i->id)->get();
        $tab=[];
        foreach($posts as $p){
            $t=[];
            foreach($p->commentaires as $k){
                $username=DB::select('select username,photo from users where id = ?', [$k->user_id]);
            array_push($t,array(
                'text'=>$k->text,
                'commentaire_user'=>$username
            ));
            }
        $jaimes=DB::select('select count(*) jaime from jaimes where post_id = ?', [$p->id]);
        array_push($tab,array("id" =>$p->id,
        'titre'=>$p->titre,
        'text'=>$p->text,
        'photo'=>$p->photo,
        'video'=>$p->video,
        'categorie'=>$p->categorie,
        'langue'=>$p->langue,
        'region'=> $p->region,
        'jaimes'=> $jaimes[0]->jaime,
        'commentaires'=> $t,
            ));

        }
        $param=array("id" =>$i->id,
        'username'=>$i->username,
        'email'=>$i->email,
        'user_id'=>$i->user_id,
        'password'=>$i->password,
        'photo'=>$i->photo,
        'sexe'=>$i->sexe,
        'adress'=>$i->adress,
        'firstname'=>$i->firstname,
        'lastname'=>$i->lastname,
        'companyname'=>$i->companyname,
        'company_email'=>$i->company_email,
        'companyphone'=>$i->companyphone,
        'companyadress'=>$i->companyadress,
        'companyimmat'=>$i->companyimmat,
        'posts'=>$tab

        );


        return response()->json($param,200);
    }

    public function search(Request $request){
        $validate1 = Validator::make($request->all(),[
            'username' =>'required'
        ]);
        if($validate1){
            $username="%$request->username%";
        }
        else{
            $username="%";
        }


        $users=DB::select('select username from users where username like ? and role_id=? ', [$username,5]);

        return response()->json($users,200);
    }

    //zidha
    public function updatePassword(Request $request){
        $validate = Validator::make($request->all(),[
            'password' =>'required',
            'c_password' =>'required|same:password',
            'newPassword' =>'required'
        ]);
        if($validate->fails()){
            return response()->json("parameters invalide",400);
        }
        $user= User::where('email',Auth::user()->email)->first();
        if( Hash::check($request->password,$user->password)){
            DB::update('update users set password = ? where email = ?', [Hash::make($request->newPassword),$user->email]);
            return response()->json("updated successfuly",200);
        }
    }

    //zidha
    public function updateUserName(Request $request){
        $validate = Validator::make($request->all(),[
            'newUserName' =>'required'
        ]);
        if($validate->fails()){
            return response()->json("parameters invalide",400);
        }
        $user= User::where('email',Auth::user()->email)->first();
        DB::update('update users set username = ? where email = ?', [$request->newUserName,$user->email]);
        return response()->json("updated successfuly",200);

    }


    public function showProfil($id)
    {

        $i= User::where('id',$id)->first();

        $posts=Post::where('user_id',$i->id)->get();
        $tab=[];
        foreach($posts as $p){
            $t=[];
            foreach($p->commentaires as $k){
                $username=DB::select('select username,photo from users where id = ?', [$k->user_id]);
            array_push($t,array(
                'text'=>$k->text,
                'commentaire_user'=>$username
            ));
            }
            $jaimes=DB::select('select count(*) jaime from jaimes where post_id = ?', [$p->id]);

        array_push($tab,array("id" =>$p->id,
        'titre'=>$p->titre,
        'text'=>$p->text,
        'photo'=>$p->photo,
        'video'=>$p->video,
        'categorie'=>$p->categorie,
        'langue'=>$p->langue,
        'region'=> $p->region,
        'jaimes'=> $jaimes[0]->jaime,
        'commentaires'=> $t,
            ));

        }
        $x=DB::select('select count(*) abonne from abonnements where id_user1 = ? and id_user2 = ?', [Auth::id(),$id]);
        if($x[0]->abonne==0){
            $dejaAbonne=FALSE;
        }else{
            $dejaAbonne=TRUE;
        }
        $param=array("id" =>$i->id,
        'username'=>$i->username,
        'email'=>$i->email,
        'user_id'=>$i->user_id,
        'photo'=>$i->photo,
        'sexe'=>$i->sexe,
        'adress'=>$i->adress,
        'firstname'=>$i->firstname,
        'lastname'=>$i->lastname,
        'dejaAbonne'=>$dejaAbonne,
        'companyname'=>$i->companyname,
        'company_email'=>$i->company_email,
        'companyphone'=>$i->companyphone,
        'companyadress'=>$i->companyadress,
        'companyimmat'=>$i->companyimmat,
        'posts'=>$tab

        );

        return response()->json($param,200);
    }
    public function addPhotoUser(Request $request){
        $input=$request->all();
        $id=Auth::id();
        $validate=Validator::make($input,[
            'photo'=>'required|image'
        ]);
        if($validate->fails()){
            return response()->json(400);
        }
        $photo=$request->photo;
        $newPhoto=time().$photo->getClientOriginalName();
        $photo->move('uploads/users',$newPhoto);
        DB::update(
            'update users set photo = ? where id = ? ',
            ["uploads/users/$newPhoto" , $id]
        );
        $succes['photo']="uploads/users/$newPhoto";
        return response()->json('success',200);
    }


    public function userPhoto($id){
        $path=DB::select('select photo from users where id = ?', [$id]);
        return response()->download(public_path($path[0]->photo),'user image');
    }

}
