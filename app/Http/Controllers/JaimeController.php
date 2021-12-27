<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Jaime;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class JaimeController extends Controller
{
    public function like($id)
    {
        $i=Auth::id();
        $com= Jaime::create([
            'user_id' => $i,
            'post_id'=>$id
        ]);
        return response()->json($com, 201);
    }
    public function dislike($id)
    {
        $u=Auth::id();
        DB::delete('delete from jaimes where user_id = ? and post_id = ?', [$u,$id]);
        return response()->json("dislike success", 200);
    }

}
