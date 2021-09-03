<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliveryParcelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('delivery_parcels', function (Blueprint $table) {
            $table->id();
            $table->string('track')->nullable();
            $table->string('pickup_address')->nullable();
            $table->string('delivery_address')->nullable();
            $table->string('pickup_contact_no')->nullable();
            $table->string('delivery_contact_no')->nullable();
            $table->foreignId('delivery_package_id')->references('id')->on('delivery_packages')->onDelete('cascade')->nullable();
            $table->string('particular')->nullable();
            $table->enum('available_time',['morning','day','evening','night'])->default('day');
            $table->float('total_amount_collection',8,2)->nullable();
            $table->float('weight')->nullable();
            $table->float('km')->nullable();
            $table->float('discount',8,2)->nullable();
            $table->float('delivery_charge',8,2)->nullable();

            $table->enum('status',['pending','packaging_completed','ready_to_deliver','delivery_completed'])->default('pending');
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->foreignId('order_id')->references('id')->on('orders')->onDelete('cascade')->nullable();
           
            $table->enum('delivery_type',['customer','supplier','user','return'])->nullable();
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade')->nullable();
            $table->boolean('is_paid')->default(false);
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
        Schema::dropIfExists('delivery_parcels');
    }
}
