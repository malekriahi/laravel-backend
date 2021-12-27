<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator ;
use App\Publicite;
use Illuminate\Support\Facades\Auth;

class PubliciteController extends Controller
{
    public function index()
    {
        return response()->json(Publicite::get(), 200);
    }


    public function store(Request $request)
    {
       // $pub=Publicite::create($request->all());
        $id=Auth::id();
        //$post=Post::create($request->all());
       $pub= Publicite::create([
            'titre' => $request['titre'],
            'text' => $request['text'],
            'photo' => $request['photo'],
            'duree' => $request['categorie'],
            'user_id' => $id,

        ]);
        return response()->json($pub, 201);
    }

    public function show($id)
    {
        return response()->json(Publicite::find($id), 201);
    }

    public function update(Request $request, $id)
    {
        $pub=Publicite::find($id);
        $pub->update($request->all());
        return response()->json($pub, 200);

    }


    public function destroy($id)
    {
        $pub=Publicite::find($id);
        $pub->delete();
        return response()->json(null,204);
    }
    public function addPhoto(Request $request,$id){
        $input=$request->all();
        $validate=Validator::make($input,[
            'photo'=>'required|image'
        ]);
        if($validate->fails()){
            return response()->json(400);
        }
        $photo=$request->photo;
        $newPhoto=time().$photo->getClientOriginalName();
        $photo->move('uploads/publicites',$newPhoto);
        DB::update(
            'update publicites set photo = ? where id = ? ',
            ["uploads/publicites/$newPhoto" , $id]
        );
        $succes['photo']="uploads/publicites/$newPhoto";
        return response()->json('success',200);
    }
    public function pubPhoto($id){
        $path=DB::select('select photo from publicites where id = ?', [$id]);
        return response()->download(public_path($path[0]->photo),'user image');
    }
}
