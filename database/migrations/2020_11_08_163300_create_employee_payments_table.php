<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmployeePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
          
            $table->foreignId('emp_id')->references('id')->on('users')->onDelete('cascade')->nullable();
            $table->string('particular')->nullable();
            $table->float('total_amount',8,2);
            $table->float('paid',8,2);
            $table->float('remaining',8,2);
            $table->float('tax')->nulalble();
            $table->float('vat')->nullable();
            $table->date('date')->nullable();
            $table->enum('payment_method',['cash_on_delivery','card','mobile_wallet'])->default('cash_on_delivery');
            $table->enum('status',['completed','remaining','pending'])->default('pending');
            $table->text('note')->nullable();
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
        Schema::dropIfExists('employee_payments');
    }
}
