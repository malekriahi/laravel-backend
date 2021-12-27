<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator ;
use App\Post;
use App\Commentaires;
use App\User;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function index()
    {

        $i=Auth::user();
        $posts=Post::all();
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
            $j= DB::select('select count(*) jaime from jaimes where post_id = ? and user_id = ?', [$p->id,Auth::id()]);
            if($j[0]->jaime==0){
                $dejaAime=FALSE;
            }else{
                $dejaAime=True;
            }

        array_push($tab,array("id" =>$p->id,
        'userPhoto'=> $p->users->photo,
        'user'=> $p->users->username,
        'titre'=>$p->titre,
        'text'=>$p->text,
        'photo'=>$p->photo,
        'video'=>$p->video,
        'categorie'=>$p->categorie,
        'langue'=>$p->langue,
        'region'=> $p->region,
        'dejaAime'=>$dejaAime,
        'jaimes'=> $jaimes[0]->jaime,
        'commentaires'=> $t
            ));
        }
        $param=array("id" =>$i->id,
        'username'=>$i->username,
        'photo'=>$i->photo,
        'posts'=>$tab
        );

        return response()->json($param,200);
    }


    public function store(Request $request)
    {
        $id=Auth::id();
        //$post=Post::create($request->all());
       $post= Post::create([
            'titre' => $request['titre'],
            'text' => $request['text'],
            'photo' => $request['photo'],
            'categorie' => $request['categorie'],
            'region' => $request['region'],
            'langue' => $request['langue'],
            'user_id' => $id,

        ]);
        return response()->json($post, 201);
    }

    public function show($id)
    {
        return response()->json(Post::find($id), 201);
    }

    public function update(Request $request, Post $post)
    {
        $post->update($request->all());
        return response()->json($post, 200);

    }

    public function destroy(Post $post)
    {
        $post->delete();
        return response()->json(null,204);
    }



    public function signale($id)
    {
        $post=Post::find($id);
        $a=$post->signale;
        $post->signale=$a+1;
        $post->save();

        if ($post->signale>=10)
        {
            $post->delete();
            return response()->json(null, 204);
        }
        else{
            return response()->json($post, 200);
        }
    }
    //zidha
    public function filter(Request $request){
        $categorie="%$request->categorie%";
        $region="%$request->region%";
        $langue="%$request->langue%";

        $posts=DB::select('select * from posts where categorie like ? and region like ? and langue like ?', [$categorie,$region,$langue]);
        if(empty($posts[0])){
            return response()->json('No post found',200);
        }
        return response()->json($posts, 200);
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
        $photo->move('uploads/posts',$newPhoto);
        DB::update(
            'update posts set photo = ? where id = ? ',
            ["uploads/posts/$newPhoto" , $id]
        );
        $succes['photo']="uploads/posts/$newPhoto";
        return response()->json('success',200);
    }

    public function postPhoto($id){
        $path=DB::select('select photo from posts where id = ?', [$id]);
        return response()->download(public_path($path[0]->photo),'user image');
    }
}
