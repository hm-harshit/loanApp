<?php

namespace App\userLoanRequest;

use Illuminate\Database\Eloquent\Model;

class Emi extends Model
{
    protected $guarded = [];

    protected $hidden = [
        'created_at', 'updated_at'
    ];
}
