<?php

namespace App\Http\Controllers;
use App\Models\ShopCustomerService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $customerservice = DB::table('shop_customer_services')->where('customer_id',$userid)->where('status','processing')->get();
        return view('customer.customerservice.index',['customerservices'=>$customerservice]);
    }
    public function shop()
    {
   
        $customerservice = DB::table('shop_customer_services')->where('shop_id',auth()->user()->shop->id)->where('status','processing')->get();
        return view('shopadmin.customerservice.index',['customerservices'=>$customerservice]);
    }
    public function shopedit($id){
        $edit = DB::table('shop_customer_services')->where('id',$id)->get();
        return view('shopadmin.sustomerservice.edit',['services'=>$edit,'id'=>$id]); 
    }
    public function shopupdate(Request $request,$id){

        $service = ShopCustomerService::find($id);
       
        $service->answer=$request->input('answer');
        $service->status=$request->input('status');
    $service->save();
    return redirect('/complains');
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
        $customerservice = new ShopCustomerService();
        $customerservice->customer_id=$userid;
     
        $customerservice->customer_query=$request->input('query');
  
      $customerservice->status='processing';
$customerservice->save();
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
