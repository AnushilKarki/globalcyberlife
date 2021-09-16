<?php

namespace App\Http\Controllers;
use App\Models\Shop_rating;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class ShopRatingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userid= auth()->id();
        $rating = DB::table('shop_ratings')->where('user_id',$userid)->get();
        return view('customer.review.index',['reviews'=>$rating]);
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
        $review = new Shop_rating();
        $review->user_id=auth()->user()->id;
     
        $review->type=$request->input('type');
        $review->review=$request->input('review');
        $review->rating=$request->input('rating');
     
$review->save();
return redirect('/shopratings');
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
        $edit = DB::table('shop_ratings')->where('id',$id)->get();
        return view('customer.review.edit',['review'=>$edit,'id'=>$id]); 
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
        $review = Shop_rating::find($id);
        $review->type=$request->input('type');
        $review->review=$request->input('review');
        $review->rating=$request->input('rating');
        $review->save();
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
        $review=Shop_rating::findOrFail($id);
        $review->delete();
        return redirect()->back();
    }
}
