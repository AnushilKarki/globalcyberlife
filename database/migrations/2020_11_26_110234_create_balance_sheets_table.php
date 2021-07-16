<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBalanceSheetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('balance_sheets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
         
                
            $table->date('date')->nullable();
            $table->float('credit_amount');
            $table->float('debit_amount');
            $table->float('total_current_asset');
            $table->float('total_fixed_asset');
            $table->float('total_other_asset');
            $table->float('total_current_liability');
            $table->float('total_longterm_liability');
            $table->float('total_capital');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('balance_sheets');
    }
}
