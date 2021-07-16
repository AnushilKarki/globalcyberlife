<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery_rider_report extends Model
{
    use HasFactory;
    public function rider()
    {
        return $this->belongsTo('App\Models\DeliveryRider','rider_id');
    }
    protected $table='delivery_rider_reports';
}
