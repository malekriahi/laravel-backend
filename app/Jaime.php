<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Jaime extends Model
{
    protected $table = "jaimes";
    protected $fillable = [
        'post_id','user_id'
    ];
    public function users()
    {
        return $this->belongsTo('App\User','user_id');
    }
    public function posts()
    {
        return $this->belongsTo('App\Post','post_id');
    }
}
