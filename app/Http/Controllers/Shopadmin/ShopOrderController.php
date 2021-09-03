<?php

namespace App\Http\Controllers\Shopadmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use App\Models\Sub_order;
class ShopOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $order = DB::table('sub_orders')->where('shop_id',auth()->user()->shop->id)->where('status','processing')->get();

        
        return view('shopadmin.order.index',['orders'=>$order]);
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $oid = DB::table('sub_orders')->where('id',$id)->value('order_id');
        $edit = DB::table('sub_orders')->where('id',$id)->get();
        
        $order=DB::table('orders')->where('id',$oid)->get();
     $item =DB::table('sub_order_items')->where('sub_order_id',$id)->get();

     $productid=DB::table('sub_order_items')->where('sub_order_id',$id)->value('product_id');
     $productname=DB::table('products')->where('id',$productid)->get();
        return view('shopadmin.order.edit',['suborders'=>$edit,'orders'=>$order,'items'=>$item,'products'=>$productname]);
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
        $orders = Sub_order::find($id);
        $orders->status='completed';
$orders->save();
return redirect()->back();
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
