<?php

namespace App\Http\Controllers;
use App\Models\Coupon;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Shop;
use App\Models\Delivery_package;
use App\Models\DeliveryPackageAddress;
use App\Models\DistributionCenter;
use TCG\Voyager\Models\Category;
use App\Models\Gift;

class CartController extends Controller
{
    public function add(Product $product,Request $request)
    {
   \Cart::session(auth()->id())->add(array(
'id'=> uniqid('id-'),
'name' => $product->name,
'price' => $product->selling_price,
'quantity'=>$request->input('quan'),
'attributes'=>array(
    'size' => $request->input('size'),
    'color' => $request->input('color'),
    'weight'=>$request->input('weight'),
    'product_id'=>$product->id
),
'associateModel'=>$product
   ));
   return redirect()->route('cart.index');
    }
    public function index()
    {
        $categories = Category::whereNull('parent_id')->get();
        $shops = Shop::take(3)->get();
        $cartitems=\Cart::session(auth()->id())->getContent();
        return view('cart.index',compact('cartitems','shops','categories'));
    }
    public function delivery(Request $request)
    {
        $categories = Category::whereNull('parent_id')->get();
        $shops = Shop::take(3)->get();
        $cartitems=\Cart::session(auth()->id())->getContent();
        $location=$request->input('location');
$totalweight=0;
        foreach($cartitems as $ite)
{

$count= \Cart::session(auth()->id())->getContent()->count();
for($i=0;$i<$count;$i++){
    $w=$ite->attributes['weight'];
    $q=$ite->quantity;
$weight= $w*$q;
$totalweight+=$weight; 

}
}
$d_p_id= Delivery_package::where('district',$location)->where('delivery_type','standard')->value('id');
$state= Delivery_package::where('district',$location)->value('state');
$addre = DeliveryPackageAddress::where('delivery_package_id',$d_p_id)->get();
        $packages= Delivery_package::where('district',$location)->get();
        
        return view('cart.delivery',compact('totalweight','cartitems','packages','shops','categories','location','state','addre'));
    }
    public function destroy($itemid)
    {
        \Cart::session(auth()->id())->remove($itemid);
        return redirect()->route('cart.index');
    }
   public function update($itemid,Request $request)
   {
  
    //    \Cart::session(auth()->id())->update($rowid,[
    //     'quantity' => [
    //         'relative' => false,
    //         'value' => request('quan')
    //     ],
    //     'attributes' => [
    //         'color'=>  request('color'),
           
    //         'size' =>request('size')
           
           
    //      ]
    // ]);
       $q=$request->input('quan');
       $p=$request->input('productid');
       $c=$request->input('color');
       $s=$request->input('size');
       $w=$request->input('weight');
    $item = [
        'id'         => $itemid,
        'quantity'   => [
            'relative'=>false,
            'value'=> $q
        ],
        'attributes' => [
           'product_id'=>$p,
           'color' => $c,
           'size'=>$s,
           'weight'=>$w,
        ]
   ]; 
 \Cart::session(auth()->id())->update( $itemid, $item );

           
    return redirect()->route('cart.index');
   }
   public function checkout(Request $request)
   {
    $gift = Gift::take(5)->get();
    $shop = Shop::take(3)->get();
    $category = Category::whereNull('parent_id')->get();
       return view('cart.checkout',['shops'=>$shop,'gifts'=>$gift,'categories'=>$category]);
   }
   public function shipping(Request $request){
    $categories = Category::whereNull('parent_id')->get();
    $shops = Shop::take(3)->get();
   
    $type=$request->input('type');
    $gifts = Gift::take(5)->get();
    $district=$request->input('location');
    
   
    $distribution=DistributionCenter::where('location',$district)->get();
  
    $address=$request->input('address');
    $time=$request->input('time');
    $totalweight=$request->input('weight');
    $state=$request->input('state');
    $deliveryData = Delivery_package::where('delivery_type', $type)->where('district', $district)->get();
   foreach($deliveryData as $d){
    $delivery_rate=$d->delivery_rate;
    $delivery_max_charge=$d->delivery_max_charge;
    $delivery_min_charge=$d->delivery_min_charge;
    $delivery_rider_percent=$d->delivery_rider_rate;
$delivery_package_id=$d->id;
   }
if($totalweight >= 3){
  $charge = $delivery_max_charge;
}
elseif($totalweight < 3){
  $charge = $delivery_min_charge;
}
    // code to add shipping charge
    $shipping = new \Darryldecode\Cart\CartCondition(array(
        'name' => 'shipping_charge',
        'type' => $type,
        'target' => 'subtotal',
        'value' => $charge,
    ));

    \Cart::session(auth()->id())->condition($shipping); // for a speicifc user's cart

    return view('cart.checkout',compact('distribution','type','time','totalweight','gifts','shops','categories','district','state','address','charge'));
    // return back()->withMessage('shipping charge applied');
   }
    public function applyCoupon(Request $request)
    {
    
        $coupontype=$request->input('type');
        $couponCode=$request->input('code');
        $couponData = Coupon::where('code', $couponCode)->first();

        if(!$couponData) {
            return back()->withMessage('Sorry! Coupon does not exist');
        }


        //coupon logic
        $condition = new \Darryldecode\Cart\CartCondition(array(
            'name' => $couponData->particular,
            'type' => $couponData->description,
            'target' => 'subtotal',
            'value' => -$couponData->discount_amount,
        ));

        \Cart::session(auth()->id())->condition($condition); // for a speicifc user's cart


        return back()->withMessage('coupon applied');

    }
}
