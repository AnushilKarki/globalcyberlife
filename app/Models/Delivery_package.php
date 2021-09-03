<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery_package extends Model
{
    use HasFactory;
  
public function shop()
{
    return $this->belongsTo('App\Models\Shop');
} 
protected $table='delivery_packages';
}
