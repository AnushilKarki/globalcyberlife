<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
    use HasFactory;
    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }
    public function address()
    {
        return $this->hasOne('App\Models\Address','shop_id');
    }
    public function product()
    {
        return $this->hasMany('App\Models\Product','shop_id');
    }
    public function customer_service()
    {
        return $this->hasMany('App\Models\Customer_service','shop_id');
    }
    public function complain()
    {
        return $this->hasMany('App\Models\Complain','shop_id');
    }
  
    public function note()
    {
        return $this->hasMany('App\Models\Note','shop_id');
    }
    public function credit()
    {
        return $this->hasMany('App\Models\Credit','shop_id');
    }
    public function sub_order()
    {
        return $this->hasMany('App\Models\Sub_order','shop_id');
    }
    public function customer_payment()
    {
        return $this->hasMany('App\Models\Customer_payment','shop_id');
    }
    public function commission()
    {
        return $this->hasOne('App\Models\Commission','shop_id');
    }
    public function advertisement()
    {
        return $this->hasMany('App\Models\Advertisement','shop_id');
    }
    public function shop_goal()
    {
        return $this->hasMany('App\Models\Shop_goal','shop_id');
    }
    public function asset()
    {
        return $this->hasMany('App\Models\Asset','shop_id');
    }
    public function sale()
    {
        return $this->hasMany('App\Models\Sale','shop_id');
    }
    public function liability()
    {
        return $this->hasMany('App\Models\Liability','shop_id');
    }
    public function easy_order()
    {
        return $this->hasMany('App\Models\Easy_order','shop_id');
    }
    public function capital()
    {
        return $this->hasMany('App\Models\Capital','shop_id');
    }
    public function income()
    {
        return $this->hasMany('App\Models\Income','shop_id');
    }
    public function expense()
    {
        return $this->hasMany('App\Models\Expense','shop_id');
    }
    public function payment()
    {
        return $this->hasMany('App\Models\Shop_payment','shop_id');
    }
 
    public function shop_report()
    {
         return $this->hasMany('App\Models\Shop_report','shop_id');
    }

    public function delivery()
    {
        return $this->hasMany('App\Models\Delivery_parcel','shop_id');
    }
    public function shop_credit()
    {
        return $this->hasMany('App\Models\Shop_credit','shop_id');
    }

    public function team()
    {
        return $this->hasMany('App\Models\Team','shop_id');
    }
    public function notice()
    {
        return $this->hasMany('App\Models\Notice','shop_id');
    }
    public function meeting()
    {
        return $this->hasMany('App\Models\Meeting','shop_id');
    }
  
    public function shop_rating()
    {
        return $this->hasMany('App\Models\Shop_rating','shop_id');
    }
    public function employee_payment()
    {
        return $this->hasMany('App\Models\Employee_payment','shop_id');
    }
    public function trial_balance()
    {
        return $this->hasMany('App\Models\Trial_balance','shop_id');
    }
    public function balance_sheet()
    {
        return $this->hasMany('App\Models\Balance_sheet','shop_id');
    }
    public function cash_flow()
    {
        return $this->hasMany('App\Models\Cash_flow','shop_id');
    }
    public function income_statement()
    {
        return $this->hasMany('App\Models\Income_statement','shop_id');
    }
    public function inventory()
    {
        return $this->hasMany('App\Models\Inventory','shop_id');
    }
    public function bankaccount()
    {
        return $this->hasMany('App\Models\BankAccount','shop_id');
    }
    protected $fillable = ['name','is_active','description','email','contact_no'];
    protected $table = 'shops';

}
