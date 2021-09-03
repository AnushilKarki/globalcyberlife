<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }
    public function productrating()
    {
        return $this->hasMany('App\Models\Product_rating','product_id');
    }
    public function productimage()
    {
        return $this->hasMany('App\Models\Product_image','product_id');
    }
    public function productvalue()
    {
        return $this->hasOne('App\Models\Product_value','product_id');
    }
    public function attribute()
     {
        return $this->belongsToMany('App\Models\Attribute','product_attributes','product_id','attribute_id');
     }
     public function category()
     {
        return $this->belongsToMany(Voyager::modelClass('Category'),'product_categories','product_id','category_id');
     }
     public function wishlist()
     {
         return $this->hasMany('App\Models\Wishlist','product_id');
     }
     public function productdiscount()
     {
         return $this->hasOne('App\Models\Product_discount','product_id');
     }
     public function gift()
     {
         return $this->belongsTo('App\Models\gift');
     }
     public function product_customer_service()
     {
         return $this->hasMany('App\Models\Product_customer_service','product_id');
     }
     public function product_review()
     {
         return $this->hasMany('App\Models\Product_review','product_id');
     }
     public function complain()
     {
         return $this->hasMany('App\Models\Complain','product_id');
     }
     public function browsing_history()
     {
         return $this->hasMany('App\Models\Browsing_history','product_id');
     }
     public function easy_order()
     {
         return $this->hasMany('App\Models\Easy_order','product_id');
     }
     public function sub_order()
     {
         return $this->belongsToMany('App\Models\Sub_order');
     }
     public function order()
     {
         return $this->belongsToMany('App\Models\Order');
     }
     public function stock()
     {
         return $this->hasMany('App\Models\Stock','product_id');
     }
     public function suborderitems(){
         $this->hasMany('App\Models\SubOrderItems');
     }
     protected $table = 'products';
}
