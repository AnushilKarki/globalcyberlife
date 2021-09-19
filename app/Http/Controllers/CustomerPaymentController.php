<?php

namespace App\Http\Controllers;
use App\Models\Customer_payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class CustomerPaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $payment = DB::table('customer_payments')->where('user_id',$userid)->where('status','pending')->get();
        $account = DB::table('bank_accounts')->get();
        return view('customer.payment.index',['payments'=>$payment,'accounts'=>$account]);
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
        return view('customer.payment.index');
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
        $edit = DB::table('customer_payments')->where('id',$id)->get();
        return view('customer.payment.add',['payments'=>$edit,'id'=>$id]); 
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
        $edit = DB::table('customer_payments')->where('id',$id)->get();
        foreach($edit as $e){
            $paidbefore = $e->paid;
            $remainingbefore = $e->remaining;
        }
        $payments = Customer_payment::find($id);
       $paidafter=$request->input('paid');
       $paid=$paidbefore+$paidafter;
       $remainingafter = $remainingbefore-$paidafter;
        $payments->paid=$paid;
        $payments->remaining=$remainingafter;
        if($remainingafter==0){
$payment->status='completed';
        }
        $payments->payment_method=$request->input('type');
$payments->save();
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
    public function pdf(){
        //
    }
}
