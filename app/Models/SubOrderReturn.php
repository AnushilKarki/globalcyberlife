<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubOrderReturn extends Model
{
    use HasFactory;
    public function suborder()
    {
        return $this->belongsTo('App\Models\Sub_order','sub_order_id');
    }
    protected $table='sub_order_returns';
}
