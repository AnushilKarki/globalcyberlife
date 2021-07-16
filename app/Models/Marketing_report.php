<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Marketing_report extends Model
{
    use HasFactory;
    public function marketing_army()
    {
        return $this->belongsTo('App\Models\User','army_id');
    }
    protected $table='marketing_reports';
}
