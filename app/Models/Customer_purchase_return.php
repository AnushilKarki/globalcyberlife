<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer_purchase_return extends Model
{
    use HasFactory;
    public function order()
    {
        return $this->belongsTo('App\Models\Order','order_id');
    }

    protected $table='customer_purchase_returns';
}
