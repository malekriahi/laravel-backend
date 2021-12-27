<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Post;
use App\Abonnement;
use App\Commentaire;
use Illuminate\Support\Facades\DB;
use Validator ;
use Illuminate\Support\Facades\Auth;

class AbonnementController extends Controller
{
    public function abonne($id)
    {
        $abonnement= Abonnement::create([
            'id_user1' => Auth::id(),
            'id_user2' => $id
        ]);
        return response()->json($abonnement, 201);
    }
    public function desabonne($id)
    {
        DB::delete('delete from abonnements where id_user1 = ? and id_user2 = ?', [Auth::id(),$id]);
        return response()->json("deleted successfuly", 200);
    }

    public function accueil(){
        $i=Auth::user();
        $po=DB::select('select distinct P.* from posts P, abonnements A where A.id_user1 = ? and A.id_user2=P.user_id', [Auth::id()]);
        //$posts = Post::hydrateRaw( 'select distinct P.* from posts P, abonnements A where A.id_user1 = ? and A.id_user2=P.user_id', [Auth::id()]);
        $posts = Post::hydrate( $po);
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
        $x=DB::select('select count(*) jaime from jaimes where post_id = ? and user_id = ?', [$p->id,Auth::id()]);
        if($x[0]->jaime==0){
            $dejaAimer=FALSE;
        }else{
            $dejaAimer=TRUE;
        }
        array_push($tab,array("id" =>$p->id,
        'userPhoto'=> $p->users->photo,
        'user'=> $p->users->username,
        'user_id' => $p->user_id,
        'titre'=>$p->titre,
        'text'=>$p->text,
        'photo'=>$p->photo,
        'video'=>$p->video,
        'categorie'=>$p->categorie,
        'langue'=>$p->langue,
        'region'=> $p->region,
        'dejaAimer'=> $dejaAimer,
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

}
