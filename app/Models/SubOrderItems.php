<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubOrderItems extends Model
{
    use HasFactory;
  
    public function product()
    {
       return $this->belongsTo('App\Models\Product','product_id');
    }
    protected $fillable = ['sub_order_id','product_id','price','quantity'];
    protected $table='sub_order_items';
}
