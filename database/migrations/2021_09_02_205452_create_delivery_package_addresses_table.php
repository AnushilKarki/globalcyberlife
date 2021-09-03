<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliveryPackageAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('delivery_package_addresses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('delivery_package_id')->references('id')->on('delivery_packages')->onDelete('cascade')->nullable();
            $table->string('address')->nullable();
            $table->float('longitude',8,4)->nullable();
            $table->float('latitude',8,4)->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->boolean('is_active')->default(false);
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
        Schema::dropIfExists('delivery_package_addresses');
    }
}
