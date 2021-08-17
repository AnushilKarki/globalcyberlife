<?php

namespace App\Models;
use App\Models\Shop;
use App\Models\SubOrderItems;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Order extends Model
{
    use HasFactory;
    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }
    public function customer_purchase()
    {
        return $this->hasOne('App\Models\Customer_purchase','order_id');
    }
    public function attribute()
    {
        return $this->hasOne('App\Models\Order_attribute','order_id');
    }
    
    public function gift()
    {
        return $this->belongsTo('App\Models\Gift');
    }
    public function sub_order()
    {
        return $this->hasMany('App\Models\Sub_order','order_id');
    }
    public function item()
     {
        return $this->belongsToMany('App\Models\Product','order_items','order_id','product_id')->withPivot('quantity','price');
     }
     public function delivery()
     {
         return $this->hasOne('App\Models\Delivery_parcel','order_id');
     }
     public function generateSubOrders()
     {
      

 $orderItems = $this->item;
       
 $orders= \Cart::session(auth()->id())->getContent();
 $userid= auth()->id();
 foreach($orderItems->groupBy('shop_id') as $shopId => $products) {

     $shop = Shop::find($shopId);
     $pric=$products->sum('pivot.price');$quan=$products->sum('pivot.quantity');
     $total=$pric*$quan;
     $suborder = $this->sub_order()->create([
         'order_id'=> $this->id,
         'shop_id'=> $shop->id,
         'grand_total'=>$total,
         'item_count'=> $products->count(),
         'user_id'=>  auth()->id()
     ]);
      foreach($orders as $product) {
     
       $color=$product->attributes['color'];
        $size=$product->attributes['size'];
        $product_id=$product->attributes['product_id'];
        $suborder->item()->attach($product_id,[
            'price' => $product->price,
            'quantity'=>$product->quantity,
            'color'=>$color,
            'size'=>$size
        ]);
     }

 }

 
     }
     protected $table='orders';
}
