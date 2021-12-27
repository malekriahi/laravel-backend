<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Commentaire extends Model
{
    protected $table = "commentaires";
    protected $fillable = [
        'text','user_id','post_id'
    ];
    public function users()
    {
        return $this->belongsTo('App\User','user_id');
    }
}
