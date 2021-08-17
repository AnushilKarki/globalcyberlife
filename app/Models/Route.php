<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Route extends Model
{
    use HasFactory;
    public function delivery_task()
    {
        return $this->hasMany('App\Models\Delivery_task','route_id');
    }
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop');
    }
    public function rider()
    {
        return $this->belongsTo('App\Models\DeliveryRider','rider_id');
    }
    protected $table='routes';
}
