<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Post;



class User extends \TCG\Voyager\Models\User
{
    use HasApiTokens,Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username','role_id', 'email','phone', 'password','photo','sexe','adress','firstname','lastname','companyname','company_email','companyphone','companyadress','companyimmat','description'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function postes()
    {
        return $this->hasMany('App\Post');
    }
    public function publicites()
    {
        return $this->hasMany('App\Publicite');
    }
}
