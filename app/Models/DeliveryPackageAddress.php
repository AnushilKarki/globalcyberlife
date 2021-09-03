<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryPackageAddress extends Model
{
    use HasFactory;
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }
    public function deliverypackage()
    {
        return $this->belongsTo('App\Models\Delivery_package','delivery_package_id');
    }
  
  protected $table='delivery_package_addresses';
}
