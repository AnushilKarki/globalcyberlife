<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery extends Model
{
    use HasFactory;
    public function team()
    {
        return $this->belongsTo('App\Models\Team','team_id');
    }
    public function task()
    {
        return $this->hasMany('App\Models\Task','delivery_id');
    }
    public function delivery_task()
    {
        return $this->hasMany('App\Models\Delivery_task','delivery');
    }
  protected $table='deliveries';
}
