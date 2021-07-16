<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    public function team()
    {
        return $this->belongsTo('App\Models\Team','team_id');
    }
    public function task()
    {
        return $this->hasMany('App\Models\Task','service_id');
    }
    public function customer_service_task()
    {
        return $this->hasMany('App\Models\Customer_service_task','service_id');
    }
   protected $table='services';
}
