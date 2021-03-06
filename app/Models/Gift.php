<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gift extends Model
{
    use HasFactory;
    public function product()
    {
       return $this->hasMany('App\Models\Product');
    }
    public function order()
    {
       return $this->hasMany('App\Models\Order');
    }
    protected $table = 'gifts';
}
