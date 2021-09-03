<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer_service_report extends Model
{
    use HasFactory;
    public function service()
    {
        return $this->belongsTo('App\Models\User','army_id');
    }
    protected $table='customer_service_reports';
}
