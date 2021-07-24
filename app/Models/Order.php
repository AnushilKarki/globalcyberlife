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
         $userid= auth()->id();
         foreach($orderItems->groupBy('shop_id') as $shopId => $products) {
 
             $shop = Shop::find($shopId);
 
             $suborder = $this->sub_order()->create([
                 'order_id'=> $this->id,
                 'shop_id'=> $shop->id,
                 'grand_total'=> $products->sum('pivot.price'),
                 'item_count'=> $products->count(),
                 'user_id'=>  auth()->id()
             ]);
 //shop id insub_order table refers to seller id sorry for error
             foreach($products as $product) {
                $suborder->item()->attach($product->id, ['price' => $product->pivot->price,'quantity' => $product->pivot->quantity]);
                // DB::table('sub_order_items')->insert([
                //     'sub_order_id' => $suborder->id,
                //     'product_id' => $product->id,
                //     'price'=>$product->pivot->price,
                //     'quantity'=>$product->pivot->quantity
                // ]);
                // $shipping = SubOrderItems::create([
                //     'product_id' => $product->id,
                //     'sub_order_id' => $suborder->id,
                //     'price' => $product->pivot->price,
                //     'quantity' => $product->pivot->quantity,
                    
                // ]);
                // $suborderitem=$this->sub_order()->suborderitems()->attach($product->id, ['price' => $product->pivot->price,'quantity' => $product->pivot->quantity]);
             }
 
         }
 
     }
     protected $table='orders';
}
