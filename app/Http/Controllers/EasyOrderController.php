<?php

namespace App\Http\Controllers;
use App\Models\Easy_order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class EasyOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $easyorder = DB::table('easy_orders')->where('user_id',$userid)->where('status','processing')->get();

        return view('customer.easyorder.index',['easyorders'=>$easyorder]);
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
        $userid= auth()->id();
        $easy = new Easy_order();
        $easy->user_id= $userid;
     $easy->product_id=$request->input('product');
        $easy->phone_no=$request->input('phoneno');
        $easy->address=$request->input('address');
   
$easy->save();
return redirect()->back();
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
        $orders = Easy_Order::find($id);
        $orders->status='declined';
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
