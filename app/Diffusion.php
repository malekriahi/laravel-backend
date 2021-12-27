<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Diffusion extends Model
{
    protected $table = "diffusions";
    protected $fillable = [
        'titre', 'lien'
    ];
}
