<?php

namespace App\Http\Controllers;
use App\Models\Order;
use PDF;
use App\Models\Delivery_parcel;
use App\Models\Shop;
use App\Models\Stock;
use App\Models\Sub_order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }
    public function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
      }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
            //
            $request->validate([
                'shipping_fullname' => 'required',
                'shipping_state' => 'required',
                'shipping_city' => 'required',
                'shipping_address' => 'required',
                'shipping_phone' => 'required',
               'payment_method' =>'required'
                ]);
                $order=new Order;
                $order->order_number=uniqid('OrderNumber-');
               
                $order->shipping_fullname = $request->input('shipping_fullname');
                $order->shipping_state = $request->input('shipping_state');
                $order->shipping_city = $request->input('shipping_city');
                $order->shipping_district = $request->input('shipping_district');
                $order->shipping_address = $request->input('shipping_address');
                $order->shipping_phone = $request->input('shipping_phone');
  
                $order->pickup_address = $request->input('pickup_address');
                $order->pickup_contact = $request->input('pickup_contact');
                if(!$request->has('billing_fullname'))
                {
                    $order->billing_fullname = $request->input('shipping_fullname');
                    $order->billing_state = $request->input('shipping_state');
                    $order->billing_city = $request->input('shipping_city');
                    $order->billing_address = $request->input('shipping_address');
                    $order->billing_phone = $request->input('shipping_phone');

                }
                else{
                    $order->billing_fullname = $request->input('billing_fullname');
                    $order->billing_state = $request->input('billing_state');
                    $order->billing_city = $request->input('billing_city');
                    $order->billing_address = $request->input('billing_address');
                    $order->billing_phone = $request->input('billing_phone');
                   
                }
               
            $order->order_type=$request->input('ordertype');
                $order->grand_total=\Cart::session(auth()->id())->getTotal();
                $order->item_count=\Cart::session(auth()->id())->getContent()->count();
                $order->delivery_charge=$request->input('delivery_charge');
                $order->delivery_time=$request->input('time');
                $order->user_id = auth()->id();
                $order->status='processing';
              
              
        if (request('payment_method') == 'paypal') {
            $order->payment_method = 'card';
        }
        elseif(request('payment_method')=='cash_on_delivery'){
            $order->payment_method='cash_on_delivery';
        }
        else
        {
            $order->payment_method='pre_payment';
        }
                $order->save();
            
            
                $cartitems= \Cart::session(auth()->id())->getContent();
                foreach($cartitems as $item)
                {
                    $itemid=$item->attributes['product_id'];
                    $itemcolor=$item->attributes['color'];
                    $itemsize=$item->attributes['size'];
                    $order->item()->attach($item->attributes['product_id'],[
                        'price' => $item->price,
                        'quantity'=>$item->quantity,
                        'color'=>$itemcolor,
                        'size'=>$itemsize
                       
                    ]);
                    $q=$item->quantity;
                    $qua = DB::table('stocks')
                    ->where('product_id', $itemid)
                    ->where('color',$item->attributes['color'])
                    ->where('size',$item->attributes['size'])
                    ->value('quantity');
                    $quantities=$qua-$q;
                    $quant = DB::table('stocks')
                    ->where('product_id', $itemid)
                    ->where('color',$item->attributes['color'])
                    ->where('size',$item->attributes['size'])
                    ->update(['quantity' => $quantities]);
                    DB::update('update stocks set is_active = false where quantity <= 0');
                   
//To update product status when all stock are finished                   

                    $quan = DB::table('stocks')
                     ->where('product_id', $itemid)->get();

 $finished = 0;
// $qu = DB::table('stocks')->where('product_id',$item->id)->where('status','processing')->get(); 

                    foreach($quan as $q){
                     if($q->quantity>0){
                         $finished=1;
                     }
                }
                   
                    if($finished==0){
                         $quant = DB::table('products')
                         ->where('id', $itemid)
                         ->update(['is_active' => false]);
                     }
                   
                   
                }
               
                //paypal
             
                //payment option
             
                $order->generateSubOrders();
             
                if(request('payment_method')=='paypal'){
                    return redirect()->route('paypal.checkout',$order->id);
                }
                //invoice pdf
                

                \Cart::session(auth()->id())->clear();
                //sent email to customer
        
                 //thank user for ordering        
                
                 return redirect()->route('home')->withMessage('Order has been placed');
          
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
