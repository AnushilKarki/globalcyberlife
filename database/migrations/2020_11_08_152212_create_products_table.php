<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('brand_name')->nullable();
            $table->string('description')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->float('selling_price');
            $table->float('cost_price');          
            $table->string('image');
            $table->string('multiple_image');
            $table->text('contact');
            $table->foreignId('gift_id')->references('id')->on('gifts')->onDelete('cascade')->nullable();
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
        Schema::dropIfExists('products');
    }
}
