<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee_profile extends Model
{
    use HasFactory;
    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }
    public function task_point()
    {
        return $this->hasOne('App\Models\Task_point','employee_id');
    }
    public function earning()
    {
        return $this->hasOne('App\Models\Earning','employee_id');
    }
    public function delivery_task()
    {
       return $this->hasMany('App\Models\Delivery_task','head_id');
    }
    public function delivery_rider()
    {
       return $this->hasMany('App\Models\Delivery_task','rider_id');
    }
    public function marketing_task()
    {
       return $this->hasMany('App\Models\Marketing_task','head_id');
    }
  
    public function service_task()
    {
       return $this->hasMany('App\Models\Customer_service_task','head_id');
    }
    public function service_army()
    {
       return $this->hasMany('App\Models\Customer_service_task','army_id');
    }
 
 
    public function finance_task()
    {
       return $this->hasMany('App\Models\Financial_task','head_id');
    }
    public function finance_army()
    {
       return $this->hasMany('App\Models\Financial_task','army_id');
    }
 


    public function delivery_rider_report()
    {
        return $this->hasMany('App\Models\Delivery_rider_report','rider_id');
    }

    public function service_report()
    {
        return $this->hasMany('App\Models\Customer_service_report','army_id');
    }
    
    public function finance_report()
    {
        return $this->hasMany('App\Models\Financial_report','army_id');
    }
  
    public function marketing_report()
    {
        return $this->hasMany('App\Models\Marketing_report','army_id');
    }
 

    public function employee_payment()
    {
        return $this->hasMany('App\Models\Employee_payment','emp_id');
    }
    public function meeting()
    {
        return $this->hasMany('App\Models\Schedule_meeting','emp_id');
    }
}
