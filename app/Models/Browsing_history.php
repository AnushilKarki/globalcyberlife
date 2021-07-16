<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Browsing_history extends Model
{
    use HasFactory;
 
    public function user()
    {
    return $this->belongsTo('App\Models\User','user_id');
    }
   
    protected $table='browsing_histories';
}
