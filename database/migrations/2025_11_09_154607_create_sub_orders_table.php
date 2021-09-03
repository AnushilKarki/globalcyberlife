<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_orders', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('shop_id');

            $table->foreign('shop_id')->references('id')->on('shops')->nullable();
            $table->unsignedBigInteger('order_id');

            $table->foreign('order_id')->references('id')->on('orders')->nullable();
            $table->unsignedBigInteger('user_id');

            $table->foreign('user_id')->references('id')->on('users')->nullable();
          
          
            $table->enum('status',['processing','completed','declined','returned','exchanged'])->default('processing');
            $table->float('grand_total')->nullable();
            $table->integer('item_count')->nullable();
            $table->text('note')->nullable();
            $table->text('review')->nullable();
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
        Schema::dropIfExists('sub_orders');
    }
}
