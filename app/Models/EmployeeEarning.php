<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeEarning extends Model
{
    use HasFactory;
    public function team()
    {
        return $this->belongsTo('App\Models\Team','team_id');
    }
    public function employee()
    {
        return $this->belongsTo('App\Models\User','employee_id');
    }
    protected $table = 'employee_earnings';
}
