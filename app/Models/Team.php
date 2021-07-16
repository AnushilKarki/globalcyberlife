<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    use HasFactory;
    public function shop()
    {
        return $this->belongsTo('App\Models\Shop','shop_id');
    }
    public function leader()
    {
        return $this->belongsTo('App\Models\User','team_leader_id');
    }
    public function team_member()
    {
       return $this->belongsToMany('App\Models\User','team_members','team_id','user_id')->withPivot('is_active');
    }
    public function notice()
    {
        return $this->hasMany('App\Models\Notice','team_id');
    }
    public function meeting()
    {
        return $this->hasMany('App\Models\Meeting','team_id');
    }
  
    public function goal()
    {
        return $this->hasMany('App\Models\Team_goal','team_id');
    }
    public function service()
    {
        return $this->hasMany('App\Models\Service','team_id');
    }
    public function marketing()
    {
        return $this->hasMany('App\Models\Marketing','team_id');
    }
 
    public function delivery()
    {
        return $this->hasMany('App\Models\Delivery','team_id');
    }
    public function earning()
    {
        return $this->hasOne('App\Models\Team','team_id');
    }
    public function team_report()
    {
        return $this->hasMany('App\Models\Team_report','team_id');
    }
    protected $table='teams';
}
