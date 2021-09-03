<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer_service_task extends Model
{
    use HasFactory;
    
    public function army()
    {
        return $this->belongsTo('App\Models\User','army_id');
    }
    public function service()
    {
        return $this->belongsTo('App\Models\Service','service_id');
    }
    protected $table='customer_service_tasks';
}
