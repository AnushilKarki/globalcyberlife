<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Asset extends Model
{
    use HasFactory;
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }
    public function payment()
    {
        return $this->hasMany('App\Models\Shop_payment','asset_id');
    }
    protected $table='assets';
}
