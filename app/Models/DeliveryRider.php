<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryRider extends Model
{
    use HasFactory;
    public function team()
    {
        return $this->belongsTo('App\Models\Team','team_id');
    }
    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }
    protected $table ='delivery_riders';
}
