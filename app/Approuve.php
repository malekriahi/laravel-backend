<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Approuve extends Model
{
    protected $fillable = [
        'username','role_id', 'email','phone', 'password','photo','sexe','adress','firstname','lastname','companyname','company_email','companyphone','companyadress','companyimmat','description'
    ];

}
