<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use App\Models\Product;


use TCG\Voyager\Models\Category;
use Illuminate\Http\Request;
use App\Models\Shop;
use App\Models\User;
use App\Models\Gift;
class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('shops.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'=>'required'
        ]);
        $shop=auth()->user()->shop()->create([
            'name'=>$request->input('name'),
            'description'=>$request->input('description'),
        ]);
        $admins=User::whereHas('role',function($q){
            $q->where('name','admin');
        })->get();
        // Mail::to($admins)->send(new ShopActivationRequest($shop));
        return redirect()->route('home');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $products = Product::take(30)->get();
       
        $gift = Gift::take(5)->get();
       
        $category = Category::whereNull('parent_id')->get();
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
        $shop = Shop::take(6)->get();
        $arrival = Product::take(30)
        ->where('shop_id',$id)
        ->get();

        return view('shop.index', ['advertisements'=>$advertisement,'shops'=>$shop,'arrivals'=>$arrival,'products' => $products,'categories'=>$category,'feature'=>$featuredproducts,'hemps'=>$hemps,'foldings'=>$foldings,'culturals'=>$culturals,'cosmetics'=>$cosmetics,'gifts'=>$gift]);
      
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
