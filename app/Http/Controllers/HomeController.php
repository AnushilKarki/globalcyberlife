<?php

namespace App\Http\Controllers;
use DB;
use App\Models\Product;
use App\Models\Delivery_task;
use App\Models\Delivery_parcel;
use App\Models\Shop;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Category;
use App\Models\Gift;
use PDF;
use App\Models\User;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {  $products = Product::take(30)->get();
        $categories = Category::whereNull('parent_id')->get();

  $featuredproducts = Product::where('id','LIKE','2')->get();
 $hemps= DB::table('products')
        ->join('product_categories', function ($join) {
            $join->on('products.id', '=', 'product_categories.product_id')
             ->select('products.name as name', 'products.id as id','products.selling_price as price','products.image as image')
                 ->where('product_categories.category_id', '=', 1);
        })
        ->get();
        $foldings= DB::table('products')
        ->join('product_categories', function ($join) {
            $join->on('products.id', '=', 'product_categories.product_id')
             ->select('products.name as name', 'products.id as id','products.selling_price as price','products.image as image')
                 ->where('product_categories.category_id', '=', 2);
        })
        ->get();
 $culturals= DB::table('products')
        ->join('product_categories', function ($join) {
            $join->on('products.id', '=', 'product_categories.product_id')
             ->select('products.name as name', 'products.id as id','products.selling_price as price','products.image as image')
                 ->where('product_categories.category_id', '=', 3);
        })
        ->get();       

 $cosmetics= DB::table('products')
        ->join('product_categories', function ($join) {
            $join->on('products.id', '=', 'product_categories.product_id')
             ->select('products.name as name', 'products.id as id','products.selling_price as price','products.image as image')
                 ->where('product_categories.category_id', '=', 4);
        })
        ->get();       
$advertisement=DB::table('advertisements')->get();
        $shop = Shop::take(3)->get();
        $arrival = Product::take(30)->get();
$gift = Gift::take(5)->get();
        return view('welcome', ['gifts'=>$gift,'advertisements'=>$advertisement,'shops'=>$shop,'arrivals'=>$arrival,'products' => $products,'categories'=>$categories,'feature'=>$featuredproducts,'hemps'=>$hemps,'foldings'=>$foldings,'culturals'=>$culturals,'cosmetics'=>$cosmetics]);
      
    }

public function franchise(Request $request){
    DB::table('franchises')->insert([
        [
            'email' =>  $request->input('email'),
             'name' => $request->input('name'),
             'address'=> $request->input('address'),
             'phone'=> $request->input('phone'),
             'franchise_location'=> $request->input('location'),
             'education'=> $request->input('education'),
             'investment'=> $request->input('investment'),
             'experience'=> $request->input('experience'),
             'excitement'=> $request->input('excitement'),
             'query'=> $request->input('query')
             
            ],
      
    ]);
    return redirect()->back();
}
public function riderregister(Request $request){
    DB::table('delivery_riders')->insert([
        [

             'name' => $request->input('name'),
             'address'=> $request->input('address'),
             'phone'=> $request->input('contact'),
             'working_address'=> $request->input('location'),
             'vehicle_name'=> $request->input('model'),
             'vehicle_type'=> $request->input('type'),
             'experience'=> $request->input('experience'),
             'excitement'=> $request->input('excitement'),
             'job_type'=> $request->input('jobtype'),
             'email' =>  $request->input('email'),
             'job_shift'=> $request->input('shift'),
             'query'=> $request->input('query')
             
            ],
      
    ]);
    return redirect()->back();
}
public function storeparcel(Request $request){
    $userid= auth()->id();
    if($userid==NULL){
    DB::table('delivery_parcels')->insert([
        [
            'track'=> uniqid('no-'),
             'pickup_address' => $request->input('from'),
             'delivery_address'=> $request->input('to'),
             'sender'=> $request->input('sender'),
             'receiver'=> $request->input('receiver'),
             'pickup_contact_no'=> $request->input('sender_phone'),
             'delivery_contact_no'=> $request->input('receiver_phone'),
             'particular'=>'parcel',
             'available_time'=> $request->input('time'),
             'total_amount_collection'=> $request->input('amount'),
             'weight' =>  $request->input('weight'),
             'status'=> 'pending',
             'query'=> $request->input('query'),
             'email'=>$request->input('email')
             
            ],
      
    ]);
}
else{
    DB::table('delivery_parcels')->insert([
        [
            'track'=> uniqid('no-'),
            'user_id'=>$userid,
             'pickup_address' => $request->input('from'),
             'delivery_address'=> $request->input('to'),
             'sender'=> $request->input('sender'),
             'receiver'=> $request->input('receiver'),
             'pickup_contact_no'=> $request->input('sender_phone'),
             'delivery_contact_no'=> $request->input('receiver_phone'),
             'particular'=>'parcel',
             'available_time'=> $request->input('time'),
             'total_amount_collection'=> $request->input('amount'),
             'weight' =>  $request->input('weight'),
             'status'=> 'pending',
             'query'=> $request->input('query'),
             'email'=>$request->input('email')
             
            ],
      
    ]); 
    
$payment = DB::table('customer_payments')->insert([
  
    'particular'=>'delivery',
    'remaining'=>$this->grand_total,
    'payment_type'=>'to_pay',
    'user_id'=>$userid,
    'total'=>$request->input('amount'),
    'status'=>'pending'
]);
}
    return redirect()->back();
}

public function trackparcel(Request $request){
   $trackid=$request->input('track');
$status=Delivery_parcel::where('track',$trackid)->value('status');

return view('delivery.index',compact('status'));
}

public function avatar(Request $request)
   {
  
  $userid= auth()->id();
  $user = User::find($userid);
  $avatar = $request->file('image');

  $filename = 'h';
   $user->avatar=$filename;
   $path = $request->file('image')->store('avatars');


  $user->save();
  return redirect()->back();
  }
}
