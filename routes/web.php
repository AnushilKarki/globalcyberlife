<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SocialiteController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PayPalController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\SubOrderController;
use App\Http\Controllers\CustomerOrderController;
use App\Http\Controllers\NewsletterController;
use App\Http\Controllers\CustomerPurchaseReturnController;
use App\Http\Controllers\NoteController;
use App\Http\Controllers\CreditController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ComplainController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\EasyOrderController;
use App\Http\Controllers\CustomerServiceController;
use App\Http\Controllers\NoticeController;
use App\Http\Controllers\CustomerPaymentController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\DeliveryRiderController;
use App\Http\Controllers\DeliveryParcelController;
use App\Http\Controllers\DeliveryTaskController;
use App\Http\Controllers\Shopadmin\ShopOrderController;
use App\Http\Controllers\Rider\TaskController;
use App\Http\Controllers\Rider\RiderTaskController;
use App\Http\Controllers\Rider\EarningController;
use App\Http\Controllers\Rider\PaymentController;
use App\Http\Controllers\Shopadmin\ShopOrderReturnController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\Models\Shop;


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});


Route::get('/', [HomeController::class,'index'])->name('home');


Route::middleware(['auth'])->get('/home',function(){
    return view('customer.home');
});

Route::middleware(['auth','role:shopadmin'])->get('/shopadmin',function(){
    return view('shopadmin.home');
});

Route::resource('blogs', BlogController::class)->middleware(['auth']);

Route::resource('customerorders', CustomerOrderController::class)->middleware(['auth']);


Route::resource('customerpurchasereturns', CustomerPurchaseReturnController::class)->middleware(['auth']);

Route::resource('notes', NoteController::class)->middleware(['auth']);

Route::middleware(['auth','role:shopadmin'])->get('/shopnote',[NoteController::class,'shopindex'])->name('notes.shop');

Route::middleware(['auth','role:shopadmin'])->post('/shopnoteedit',[NoteController::class,'shopstore'])->name('notes.shop.store');
Route::middleware(['auth','role:shopadmin'])->put('/shopnoteupdate/{id}',[NoteController::class,'shopupdate'])->name('notes.shop.update');


Route::resource('credits', CreditController::class)->middleware(['auth']);

Route::resource('newsletters',NewsletterController::class)->middleware(['auth']);

Route::middleware(['auth','role:shopadmin'])->get('/shopcredit',[CreditController::class,'shopindex'])->name('credits.shop');

Route::resource('profiles', ProfileController::class)->middleware(['auth']);

Route::resource('complains', ComplainController::class)->middleware(['auth']);

Route::middleware(['auth','role:shopadmin'])->get('/shopcomplain',[ComplainController::class,'shop'])->name('complains.shop');

Route::middleware(['auth','role:shopadmin'])->get('/shopedit/{id}',[ComplainController::class,'shopedit'])->name('complains.shop.edit');
Route::middleware(['auth','role:shopadmin'])->get('/shopupdate/{id}',[ComplainController::class,'shopupdate'])->name('complains.shop.update');

Route::resource('discounts', DiscountController::class)->middleware(['auth']);

Route::middleware(['auth','role:shopadmin'])->get('/shopdiscount',[DiscountController::class,'shopindex'])->name('discounts.shop');

Route::resource('easyorders', EasyOrderController::class)->middleware(['auth']);

Route::resource('customerservices', CustomerServiceController::class)->middleware(['auth']);


Route::middleware(['auth','role:shopadmin'])->get('/shopcustomerservice',[CustomerServiceController::class,'shop'])->name('customerservices.shop');

Route::middleware(['auth','role:shopadmin'])->get('/shopcustomerservice/{id}',[CustomerServiceController::class,'shopedit'])->name('customerservices.shop.edit');
Route::middleware(['auth','role:shopadmin'])->put('/shopcustomerservice/{id}',[CustomerServiceController::class,'shopupdate'])->name('customerservices.shop.update');

Route::resource('notices', NoticeController::class)->middleware(['auth']);

Route::resource('customerpayments',CustomerPaymentController::class)->middleware(['auth']);


Route::resource('shoporders', ShopOrderController::class)->middleware(['auth','role:shopadmin']);


Route::resource('shoporderreturns', ShopOrderReturnController::class)->middleware(['auth','role:shopadmin']);

//route for riders control
Route::middleware(['auth','role:rider'])->get('/riderhome',function(){
    return view('employee.home');
});


Route::resource('riders', DeliveryRiderController::class)->middleware(['auth']);

Route::resource('parcels', DeliveryParcelController::class)->middleware(['auth']);

Route::resource('deliverytasks', DeliveryTaskController::class)->middleware(['auth']);

Route::middleware(['auth'])->get('/verifytask',[DeliveryTaskController::class,'verify'])->name('verifytask');


Route::resource('updatetasks', RiderTaskController::class)->middleware(['auth']);

Route::resource('ridertasks',TaskController::class)->middleware(['auth']);
Route::middleware(['auth'])->get('/update',[TaskController::class,'up']);
Route::middleware(['auth'])->put('/completetask/{id}',[TaskController::class,'complete'])->name('complete');
Route::middleware(['auth'])->put('/failtask/{id}',[TaskController::class,'fail'])->name('fail');

Route::resource('riderearnings',EarningController::class)->middleware(['auth']);

Route::resource('riderpayments',PaymentController::class)->middleware(['auth']);

Route::middleware(['auth'])->put('/deliverytask',[DeliveryTaskController::class,'mytask'])->name('ridertasks.up');

Route::middleware(['auth'])->get('/deliverytaskedit/{id}',[DeliveryTaskController::class,'action'])->name('deliverytasks.action');

//end rider route

Route::middleware(['auth'])->get('/changepassword',function(){
    return view('auth.update-password');
});
Route::middleware(['guest'])->get('/sign-in/github',[SocialiteController::class,'github']);
Route::middleware(['guest'])->get('/sign-in/github/redirect',[SocialiteController::class,'githubRedirect']);

Route::middleware(['guest'])->get('/sign-in/facebook',[SocialiteController::class,'facebook']);
Route::middleware(['guest'])->get('/sign-in/facebook/redirect',[SocialiteController::class,'facebookRedirect']);



Route::middleware(['auth'])->get('/addtocart/{product}',[CartController::class,'add'])->name('cart.add');

Route::middleware(['auth'])->get('/cart',[CartController::class,'index'])->name('cart.index');


Route::middleware(['auth'])->post('/cart/delivery',[CartController::class,'delivery'])->name('cart.delivery');

Route::middleware(['auth'])->get('/cartdestroy/{itemid}',[CartController::class,'destroy'])->name('cart.destroy');


Route::middleware(['auth'])->get('/cartupdate/{itemid}',[CartController::class,'update'])->name('cart.update');


Route::middleware(['auth'])->post('/cartcheckout',[CartController::class,'checkout'])->name('cart.checkout');

Route::middleware(['auth'])->post('/cart/apply-coupon',[CartController::class,'applyCoupon'])->name('cart.coupon');

Route::middleware(['auth'])->post('/cart/apply-shipping',[CartController::class,'shipping'])->name('cart.shipping');


Route::resource('orders', OrderController::class)->middleware(['auth']);

Route::resource('shops', ShopController::class)->middleware(['auth']);

Route::middleware(['auth'])->get('/paypal/checkout/{order}',[PayPalController::class,'getExpressCheckout'])->name('paypal.checkout');

Route::middleware(['auth'])->get('/paypal/checkout-success/{order}',[PayPalController::class,'getExpressCheckoutsuccess'])->name('paypal.success');

Route::middleware(['auth'])->get('/paypal/checkout-cancel',[PayPalController::class,'cancelpage'])->name('paypal.cancel');


Route::get('/products/search', [ProductController::class,'search'])->name('products.search');


Route::get('/products/searchbyprice', [ProductController::class,'searchbyprice'])->name('products.search.price');

Route::resource('products', ProductController::class);

Route::get('/delivery',function(){
    $status=NULL;
return view('delivery.index',compact('status'));
}
);

// Route::get('/po',CouponController::class,'pdf');
// // $pdf = PDF::loadView('pdf.invoice',['cartitems'=>$cartitems]);
// //                 $pdf->setOrientation('landscape');
// //                 return $pdf->stream('invoice.pdf');
// //                 //empty the cart
// Route::get('/invoicepdf',function(){
//     $html = '<h1>hello pdf</h1>';
//     $pdf = PDF::loadHtml($html);
//     return $pdf->stream('invoice.pdf');
//     // return $pdf->stream('invoice.pdf');
// //     $cartitems=\Cart::session(auth()->id())->getContent();
// //      $pdf = PDF::loadView('cart.index',$cartitems);
// //  return $pdf->stream('invoice.pdf');
// //  $cartitems=\Cart::session(auth()->id())->getContent();
// //  $pdf = PDF::loadView('pdf.invoice', $cartitems);
// //  return $pdf->download('invoice.pdf');
// });
Route::get('/pdf',function(){
    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML('<h1>Test</h1>');
    return $pdf->stream();
});

//delivery company 
Route::post('/franchise',[HomeController::class,'franchise'])->name('franchise.store');

Route::post('/rider',[HomeController::class,'riderregister'])->name('rider.store');

Route::post('/storeparcel',[HomeController::class,'storeparcel'])->name('package.store');

Route::post('/trackparcel',[HomeController::class,'trackparcel'])->name('parcel.track');