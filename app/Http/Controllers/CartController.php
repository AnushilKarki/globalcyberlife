<?php

namespace App\Http\Controllers;
use App\Models\Coupon;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Shop;


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
    public function destroy($itemid)
    {
        \Cart::session(auth()->id())->remove($itemid);
        return redirect()->route('cart.index');
    }
   public function update($rowid)
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
       
    $item = [
        'id'         => $rowid,
        'quantity'   => [
            'relative'=>false,
            'value'=> request('quan')
        ],
        'attributes' => [
           'product_id'=> request('productid'),
           'color' => request('color'),
           'size'=>request('size')
        ]
   ]; 
 \Cart::update( $rowid, $item );

           
    return redirect()->route('cart.index');
   }
   public function checkout()
   {
    $gift = Gift::take(5)->get();
    $shop = Shop::take(3)->get();
    $category = Category::whereNull('parent_id')->get();
       return view('cart.checkout',['shops'=>$shop,'gifts'=>$gift,'categories'=>$category]);
   }
    public function applyCoupon()
    {
        $couponCode = request('coupon_code');

        $couponData = Coupon::where('code', $couponCode)->first();

        if(!$couponData) {
            return back()->withMessage('Sorry! Coupon does not exist');
        }


        //coupon logic
        $condition = new \Darryldecode\Cart\CartCondition(array(
            'name' => $couponData->name,
            'type' => $couponData->type,
            'target' => 'total',
            'value' => $couponData->value,
        ));

        Cart::session(auth()->id())->condition($condition); // for a speicifc user's cart


        return back()->withMessage('coupon applied');

    }
}
