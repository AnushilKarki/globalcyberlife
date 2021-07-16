<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('addresses', function (Blueprint $table) {
            $table->id();
            $table->string('address')->nullable(); 
            $table->string('street')->nullable();
            $table->string('district')->nullable();
            $table->string('zone')->nullable();
            $table->string('country')->nullable();
            $table->string('state')->nullable();
            $table->string('zip')->nullable();
            $table->string('fax')->nullable();
            $table->string('contact')->nullable();
            $table->float('km')->nullable();
            $table->text('details')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->boolean('is_active')->default(true);
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
        Schema::dropIfExists('addresses');
    }
}
