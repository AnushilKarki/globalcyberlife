<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Delivery_task;
use App\Models\Delivery_parcel;
class DeliveryTaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
            $userid= auth()->id();
            $task = DB::table('delivery_tasks')
            ->join('routes', 'delivery_tasks.route_id', '=', 'routes.id')
        
            ->select('delivery_tasks.*', 'routes.route_name')
        
            ->where('delivery_tasks.task_status','=','pending')
            ->get();   
           
            
            return view('shopadmin.deliverytask.index',['tasks'=>$task]);   
    }
    public function verify()
    {
        
            $userid= auth()->id();
            $task = DB::table('delivery_tasks')
            ->join('routes', 'delivery_tasks.route_id', '=', 'routes.id')
        
            ->select('delivery_tasks.*', 'routes.route_name')
           
            ->where('delivery_tasks.task_status','=','completed')
            ->get();   
           
            $failedtask = DB::table('delivery_tasks')
            ->join('routes', 'delivery_tasks.route_id', '=', 'routes.id')
        
            ->select('delivery_tasks.*', 'routes.route_name')
           
            ->where('delivery_tasks.task_status','=','failed')
            ->get();  
            return view('shopadmin.deliverytask.verify',['tasks'=>$task,'failedtasks'=>$failedtask]);   
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
        $task = new Delivery_task();
 
     $task->route_id=$request->input('route');
        $task->delivery_id=$request->input('parcel');
      
   $task->task_status='pending';
$task->save();
$parcelid=$request->input('parcel');
$status = Delivery_parcel::find($parcelid);
       

$status->status='packaging_completed';
$status->save();
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
        $parcel=DB::table('delivery_parcels')->where('id',$id)->get();
        return view('shopadmin.deliverytask.show',['parcels'=>$parcel]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $parcel=DB::table('delivery_parcels')->where('id',$id)->get();
        return view('shopadmin.deliverytask.show',['parcels'=>$parcel]);
    }
public function action($id)
{
     $edits =DB::table('delivery_tasks')->where('id',$id)->get();

     return view('shopadmin.deliverytask.edit',['tasks'=>$edits,'id'=>$id]); 
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
        $deli = Delivery_task::find($id);
       
        $deli->task_status=$request->input('stat');
        $deli->reason=$request->input('reason');
$deli->save();

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
