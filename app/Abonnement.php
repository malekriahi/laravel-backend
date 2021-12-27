<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Abonnement extends Model
{
    protected $table = "abonnements";
    protected $fillable = [
        'id_user1','id_user2'
    ];
}
