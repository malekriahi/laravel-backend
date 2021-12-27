<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Publicite extends Model
{
    protected $table = "publicites";
    protected $fillable = [
        'titre', 'text','photo','duree','user_id'
    ];
    public function users()
    {
        return $this->belongsTo('App\User','user_id');
    }
}
