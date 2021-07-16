<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery_task extends Model
{
    use HasFactory;

    public function route()
    {
       return $this->belongsTo('App\Models\Route','route_id');
    }
    public function delivery()
    {
       return $this->belongsTo('App\Models\Delivery','delivery');
    }
    public function parcel()
    {
       return $this->belongsTo('App\Models\Delivery_parcel','delivery_id');
    }
    protected $table='delivery_tasks';
}
