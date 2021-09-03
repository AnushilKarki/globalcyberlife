<?php

namespace App\Http\Controllers;
use App\Models\Complain;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class ComplainController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $complain = DB::table('complains')->where('user_id',$userid)->where('status','PENDING')->get();
        return view('customer.complain.index',['complains'=>$complain]);
    }
public function shop()
{
    $complain = DB::table('complains')->where('shop_id',auth()->user()->shop->id)->where('status','PENDING')->get();
    return view('shopadmin.complain.index',['complains'=>$complain]);
}
public function shopedit($id)
{
    $edit = DB::table('complains')->where('id',$id)->get();
    return view('shopadmin.complain.edit',['complain'=>$edit,'id'=>$id]); 
}
public function shopupdate(Request $request,$id)
{
    $complains = Complain::find($id);
       
    $complains->status=$request->input('status');
    $complains->message=$request->input('msg');
$complains->save();
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
        $complains = new Complain();
        $complains->user_id=$userid;
     
        $complains->title=$request->input('title');
        $complains->complain=$request->input('complain');
      $complains->status='PENDING';
$complains->save();
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
        $edit = DB::table('complains')->where('id',$id)->get();
        return view('customer.complain.edit',['complain'=>$edit,'id'=>$id]); 
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
        $complains = Complain::find($id);
       
        $complains->title=$request->input('title');
        $complains->complain=$request->input('complain');
$complains->save();
return redirect('/complains');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $complain=Complain::findOrFail($id);
        $complain->delete();
        return redirect()->back();
    }
}
