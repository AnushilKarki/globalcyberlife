<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShopPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shop_payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->foreignId('asset_id')->references('id')->on('assets')->onDelete('cascade')->nullable();
            $table->foreignId('advertisement_id')->references('id')->on('advertisements')->onDelete('cascade')->nullable();
            $table->foreignId('liability_id')->references('id')->on('liabilities')->onDelete('cascade')->nullable();
            $table->foreignId('capital_id')->references('id')->on('capitals')->onDelete('cascade')->nullable();
            $table->foreignId('income_id')->references('id')->on('incomes')->onDelete('cascade')->nullable();
            $table->foreignId('expense_id')->references('id')->on('expenses')->onDelete('cascade')->nullable();
            $table->foreignId('parcel_id')->references('id')->on('delivery_parcels')->onDelete('cascade')->nullable();
            $table->string('particular');
            $table->float('total');
            $table->float('paid');
            $table->float('remaining');
            $table->float('tax');
            $table->float('vat');
            $table->enum('payment_method',['cash_on_delivery','card','mobile_wallet'])->default('cash_on_delivery');
            $table->enum('status',['completed','remaining','pending'])->default('pending');
            $table->text('note')->nullable();
            $table->date('date');
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
        Schema::dropIfExists('shop_payments');
    }
}
