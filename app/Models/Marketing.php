<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Marketing extends Model
{
    use HasFactory;
    public function team()
    {
        return $this->belongsTo('App\Models\Team','team_id');
    }
    public function task()
    {
        return $this->hasMany('App\Models\Task','marketing_id');
    }
    public function marketing_task()
    {
        return $this->hasMany('App\Models\Marketing_task','marketing_id');
    }
    protected $table='marketings'; 
}
