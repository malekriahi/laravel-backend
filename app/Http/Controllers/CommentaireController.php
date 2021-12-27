<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Commentaire;
use Illuminate\Support\Facades\Auth;

class CommentaireController extends Controller
{
    public function index()
    {
        return response()->json(Commentaire::get(), 200);
    }


    public function store($id,Request $request)
    {
        //$comm=Commentaire::create($request->all());
        $i=Auth::id();
        $com= Commentaire::create([
            'text' => $request['text'],
            'user_id' => $i,
            'post_id'=>$id

        ]);
        return response()->json($com, 201);

    }

    public function show($id)
    {
        return response()->json(Commentaire::find($id), 201);
    }

    public function update(Request $request, $id)
    {
        $comm=Commentaire::find($id);
        $comm->update($request->all());
        return response()->json($comm, 200);

    }


    public function destroy($id)
    {
        $comm=Commentaire::find($id);
        $comm->delete();
        return response()->json(null,204);
    }
}
