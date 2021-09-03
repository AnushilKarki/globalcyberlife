<?php

namespace App\Observers;
use Illuminate\Support\Facades\DB;
use App\Models\Stock;

class StockObserver
{
    
    /**
     * Handle the Stock "created" event.
     *
     * @param  \App\Models\Stock  $stock
     * @return void
     */
    public function created(Stock $stock)
    {
        
   

     
    

    }

    /**
     * Handle the Stock "updated" event.
     *
     * @param  \App\Models\Stock  $stock
     * @return void
     */
    public function updated(Stock $stock)
    {
        
        if($stock->getOriginal('quantity') > 0 && $stock->quantity <= 0)

{
//send mail to customer
// Mail::to($shop->owner)->send(new ShopActivated($shop));

//change role from scustomer to sel ler




DB::transaction(function () {
    DB::update('update stocks set is_active = false where quantity <= 0');

    
}, 5);

}
if($stock->getOriginal('quantity') <= 0 && $stock->quantity > 0)

{
//send mail to customer
// Mail::to($shop->owner)->send(new ShopActivated($shop));

//change role from scustomer to sel ler




DB::transaction(function () {
    DB::update('update stocks set is_active = true where quantity > 0');

    
}, 5);

}

// $stock=Stock::where('product_id',$stock->product_id)->get();
// if($stock != NULL){
//     foreach($stock as $sto)
//     {
//         if($sto->quantity > 0){
            
//     DB::transaction(function () {
  
//     DB::table('products')
//             ->where('id', $sto->product_id)
//             ->update(['is_active' => true]);
    
//     }, 5);
           
//         }
//     }
// }

    }

    /**
     * Handle the Stock "deleted" event.
     *
     * @param  \App\Models\Stock  $stock
     * @return void
     */
    public function deleted(Stock $stock)
    {
        //
    }

    /**
     * Handle the Stock "restored" event.
     *
     * @param  \App\Models\Stock  $stock
     * @return void
     */
    public function restored(Stock $stock)
    {
        //
    }

    /**
     * Handle the Stock "force deleted" event.
     *
     * @param  \App\Models\Stock  $stock
     * @return void
     */
    public function forceDeleted(Stock $stock)
    {
        //
    }
}
