<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->foreignId('order_id')->references('id')->on('orders')->onDelete('cascade')->nullable();
            $table->foreignId('easy_order_id')->references('id')->on('easy_orders')->onDelete('cascade')->nullable();
            $table->foreignId('credit_id')->references('id')->on('credits')->onDelete('cascade')->nullable();
            $table->foreignId('return_id')->references('id')->on('customer_purchase_returns')->onDelete('cascade')->nullable();
            $table->foreignId('parcel_id')->references('id')->on('delivery_parcels')->onDelete('cascade')->nullable();
            $table->string('particular')->nullable();
            $table->float('total')->nullable();
            $table->float('paid')->nullable();
            $table->float('remaining')->nullable();
            $table->float('tax')->nullable();
            $table->float('vat')->nullable();
            $table->date('date')->nullable();
            $table->float('discount_amount')->nullable();
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
        Schema::dropIfExists('customer_payments');
    }
}
