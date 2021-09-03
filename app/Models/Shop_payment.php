<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shop_payment extends Model
{
    use HasFactory;
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }
    public function asset()
    {
        return $this->belongsTo('App\Models\Asset','asset_id');
    }
    public function liability()
    {
        return $this->belongsTo('App\Models\Liability','liability_id');
    }
    public function income()
    {
        return $this->belongsTo('App\Models\Income','income_id');
    }
    public function expense()
    {
        return $this->belongsTo('App\Models\Expense','expense_id');
    }
    public function capital()
    {
        return $this->belongsTo('App\Models\Capital','capital_id');
    }
    public function advertisement()
    {
        return $this->belongsTo('App\Models\Advertisement','advertisement_id');
    }
    public function parcel()
    {
        return $this->belongsTo('App\Models\Delivery_parcel','parcel_id');
    }
   protected $table='shop_payments';
}
