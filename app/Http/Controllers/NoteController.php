<?php

namespace App\Http\Controllers;
use App\Models\Note;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class NoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $note = DB::table('notes')->where('user_id',$userid)->get();
        return view('customer.note.index',['notes'=>$note]);
    }
    public function shopindex()
    {

        $note = DB::table('notes')->where('shop_id',auth()->user()->shop->id)->get();
        return view('shopadmin.note.index',['notes'=>$note]);
    }
    public function shopstore(Request $request)
    {
 
        $notes = new Note();
        $notes->shop_id=auth()->user()->shop->id;
     
        $notes->title=$request->input('title');
        $notes->textarea=$request->input('text');
     
$notes->save();
return redirect('/shopnote');
    }
    public function shopupdate(Request $request,$id)
    {
        $notes = Note::find($id);
       
        $notes->title=$request->input('title');
        $notes->textarea=$request->input('note');
$notes->save();
return redirect('/shopnote');
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
        $notes = new Note();
        $notes->user_id=$userid;
     
        $notes->title=$request->input('title');
        $notes->textarea=$request->input('text');
     
$notes->save();
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
        
        $edit = DB::table('notes')->where('id',$id)->get();
        return view('customer.note.edit',['notes'=>$edit,'id'=>$id]); 
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
        $notes = Note::find($id);
       
        $notes->title=$request->input('title');
        $notes->textarea=$request->input('note');
$notes->save();
return redirect('/notes');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $note=Note::findOrFail($id);
        $note->delete();
        return redirect()->back();
    }
}
