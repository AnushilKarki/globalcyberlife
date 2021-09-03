<?php

namespace App\Http\Controllers\Rider;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\Delivery_task;
use App\Models\Delivery_parcel;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $userid= auth()->id();
        $rider = DB::table('delivery_riders')->where('user_id', $userid)->value('id');
        $t= DB::table('delivery_tasks')
        ->join('routes', function ($join)use ( $rider) {
            $join->on('delivery_tasks.route_id', '=', 'routes.id')
             ->select('delivery_tasks.delivery_id','delivery_tasks.reason as reason','delivery_tasks.rider_earning as rider_earning','delivery_tasks.task_status as task_status','routes.route_name as route_name')
             ->where('delivery_tasks.task_status', '=', 'pending')
             ->where('routes.rider_id','=',$rider)  ;
        })
        ->get();
        $users = DB::table('delivery_tasks')
            ->join('routes', 'delivery_tasks.route_id', '=', 'routes.id')
        
            ->select('delivery_tasks.*', 'routes.route_name')
            ->where('routes.rider_id','=',$rider)
            ->where('delivery_tasks.task_status','=','pending')
            ->get();   
         ;
        return view('employee.rider.task.index',['tasks'=>$users]);   
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
     * @param  \App\Models\Delivery_task  $delivery_task
     * @return \Illuminate\Http\Response
     */
    public function show($delivery_task)
    {
        $parcel=DB::table('delivery_parcels')->where('id',$delivery_task)->get();
        return view('employee.rider.task.show',['parcels'=>$parcel]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Delivery_task  $delivery_task
     * @return \Illuminate\Http\Response
     */
    public function edit($delivery_task)
    {
        
        $edits =DB::table('delivery_tasks')->where('id',$delivery_task)->get();

        return view('employee.rider.task.edit',['tasks'=>$edit,'id'=>$delivery_task]); 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Delivery_task  $delivery_task
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request,$id)
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
     * @param  \App\Models\Delivery_task  $delivery_task
     * @return \Illuminate\Http\Response
     */
    public function destroy(Delivery_task $delivery_task)
    {
        //
    }
    
    public function complete(Request $request,$id)
    {
       
//         $delivery = Delivery_task::findOrFail($id);
       
//         $delivery->task_status = 'completed';
      
// $delivery->save();
$task=DB::table('delivery_tasks')
->where('id', $id)
->update(['task_status' == 'completed']);
return redirect()->back();
    }
    public function fail(Request $request,$id)
    {
      
        $deli = Delivery_task::findOrFail($id);
       
        $deli->task_status='failed';
  
$deli->save();

return redirect()->back();
    }
}
