<?php

namespace App\Http\Controllers\Shopadmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Sub_order;
use App\Models\SubOrderReturn;
class ShopOrderReturnController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
    
       
        $return = DB::table('sub_order_returns')
        ->join('sub_orders', 'sub_order_returns.sub_order_id', '=', 'sub_orders.id')
        ->select('sub_orders.id as orderid','sub_order_returns.type as type','sub_order_returns.reason as reason', 'sub_order_returns.status as status','sub_order_returns.id as id')
        ->where('sub_orders.shop_id',auth()->user()->shop->id)
        ->where('sub_order_returns.status','PENDING')
        ->where('sub_order_returns.type','REFUND')
        ->get();
        $exchange = DB::table('sub_order_returns')
        ->join('sub_orders', 'sub_order_returns.sub_order_id', '=', 'sub_orders.id')
        ->select('sub_orders.id as orderid','sub_order_returns.type as type','sub_order_returns.reason as reason', 'sub_order_returns.status as status','sub_order_returns.id as id')
        ->where('sub_orders.shop_id',auth()->user()->shop->id)
        ->where('sub_order_returns.status','PENDING')
        ->where('sub_order_returns.type','EXCHANGE')
        ->get();
       
        return view('shopadmin.purchase.index',['returns'=>$return,'exchanges'=>$exchange]);
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
        $edit = DB::table('sub_order_returns')->where('id',$id)->get();
        return view('shopadmin.purchase.return',['return'=>$edit,'id'=>$id]);
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

        $update = SubOrderReturn::find($id);
        
        $suborderid=$request->input('orderid');
        $status=$request->input('status');
$type=$request->input('type');
        $update->total_charge=$request->input('charge');
        $update->status=$request->input('status');
$update->save();
$update1 = Sub_order::find($suborderid);
      
       if($status=='COMPLETED'&& $type=='EXCHANGE')
       {
        $update1->status='exchanged';
       }
       elseif($status=="COMPLETED"&& $type=='REFUND')
       {
           $update1->status='returned';
       }

$update1->save();
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
