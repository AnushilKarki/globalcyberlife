<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sub_order extends Model
{  protected $guarded = [];

    use HasFactory;
    public function order()
    {
        return $this->belongsTo('App\Models\Order','order_id');
    }
    public function return()
    {
        return $this->hasOne('App\Models\SubOrderReturn','sub_order_id');
    }
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }

    public function item()
    {
       return $this->belongsToMany('App\Models\Product','sub_order_items','sub_order_id','product_id')->withPivot('quantity','price');

    }
    protected $fillable = ['order_id','user_id','shop_id','grand_total','item_count'];
protected $table='sub_orders';
}
