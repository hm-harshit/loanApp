<?php

namespace App\userLoanRequest;

use Illuminate\Database\Eloquent\Model;

class loan extends Model
{
    protected $guarded = [];

    protected $hidden = [
        'created_at', 'updated_at'
    ];
    
    public function emi()
    {
        return $this->hasMany('App\userLoanRequest\Emi');
    }
}
