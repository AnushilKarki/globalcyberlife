<?php

namespace App\Http\Controllers;
use DB;
use App\Models\Product;
use App\Models\Shop;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Category;
use PDF;
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

        return view('welcome', ['advertisements'=>$advertisement,'shops'=>$shop,'arrivals'=>$arrival,'products' => $products,'categories'=>$categories,'feature'=>$featuredproducts,'hemps'=>$hemps,'foldings'=>$foldings,'culturals'=>$culturals,'cosmetics'=>$cosmetics]);
      
    }


    
}
