<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery_parcel extends Model
{
    use HasFactory;
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }
    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }
 
    public function order()
    {
        return $this->belongsTo('App\Models\Order','order_id');
    }


    public function delivery_task()
    {
        return $this->hasOne('App\Models\Delivery_task','delivery_id');
    }
    public function delivery_package()
    {
        return $this->belongsTo('App\Models\Delivery_package','delivery_package_id');
    }
    
    public function employeepayment()
    {
        return $this->hasMany('App\Models\Employee_payment','parcel_id');
    }

    public function customerpayment()
    {
        return $this->hasMany('App\Models\Customer_payment','parcel_id');
    }
    public function shoppayment()
    {
        return $this->hasMany('App\Models\Shop_payment','parcel_id');
    }
    protected $table='delivery_parcels';
    protected $fillable = ['order_id','user_id','status','total_amount_collection','delivery_type','delivery_contact_no','delivery_address','particular','track','delivery_charge','pickup_address','pickup_contact_no','weight','km','item_count','sender','receiver'];
  
}
