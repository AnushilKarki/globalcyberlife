<?php

namespace App\Http\Controllers;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Customer_purchase_return;
use App\Models\SubOrderReturn;
use App\Models\Sub_order;
class CustomerPurchaseReturnController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $purchase = DB::table('sub_orders')->where('user_id',$userid)->where('status','completed')->get();
        $return = DB::table('sub_order_returns')
        ->join('sub_orders', 'sub_order_returns.sub_order_id', '=', 'sub_orders.id')
        ->select('sub_orders.id as orderid','sub_order_returns.type as type','sub_order_returns.reason as reason', 'sub_order_returns.status as status','sub_order_returns.id as id')
        ->where('sub_orders.user_id',$userid)
        ->get();
        return view('customer.purchase.index',['purchases'=>$purchase,'returns'=>$return]);
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
        $returns = new SubOrderReturn();
        $returns->sub_order_id=$request->input('orderid');
     $orderid=$request->input('orderid');
     $status=$request->input('type');
        $returns->reason=$request->input('reason');
        $returns->type=$request->input('type');
      $returns->status='PENDING';
$returns->save();
// $update = Sub_order::find($orderid);
//        if($status=='REFUND')
//        {
//         $update->status='returned';
//        }
//        elseif($status=='EXCHANGE')
//        {
//         $update->status='exchanged';
//        }

// $update->save();
return redirect('/home');
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
        $edit = DB::table('sub_orders')->where('id',$id)->get();
        return view('customer.purchase.return',['purchase'=>$edit,'id'=>$id]); 
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
