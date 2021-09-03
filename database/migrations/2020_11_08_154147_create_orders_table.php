<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
          
            $table->enum('status',['processing','completed','declined','returned','exchanged'])->default('processing');
            $table->float('grand_total')->nullable();
            $table->float('delivery_charge')->nullable();
            $table->integer('item_count')->nullable();
            $table->boolean('is_paid')->default(false);
            $table->enum('payment_method',['cash_on_delivery','card','mobile_wallet'])->default('cash_on_delivery');
            $table->string('order_number');
            $table->enum('order_type',['gift','shopping'])->default('shopping');

            $table->string('shipping_fullname')->nullable();
            $table->string('shipping_address')->nullable();
            $table->string('shipping_city')->nullable();
            $table->string('shipping_state')->nullable();
            $table->string('shipping_zipcode')->nullable();
            $table->string('shipping_district')->nullable();
            $table->string('shipping_time')->nullable();
            $table->string('shipping_phone');
            $table->string('notes')->nullable();
            
    $table->string('paypal_orderid')->nullable();

            $table->string('billing_fullname')->nullable();
            $table->string('billing_address')->nullable();
            $table->string('billing_city')->nullable();
            $table->string('billing_state')->nullable();
            $table->string('billing_zipcode')->nullable();
            $table->string('billing_phone')->nullable();
            $table->foreignId('gift_id')->references('id')->on('gifts')->onDelete('cascade')->nullable();
            $table->text('review')->nullable();
          //add giftI-d to represent if gift
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade')->nullable();

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
        Schema::dropIfExists('orders');
    }
}
