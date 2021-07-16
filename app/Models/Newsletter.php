<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Newsletter extends Model
{
    use HasFactory;
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }
    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }
    protected $table='newsletters';
}
