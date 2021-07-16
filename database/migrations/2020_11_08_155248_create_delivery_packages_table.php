<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliveryPackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('delivery_packages', function (Blueprint $table) {
            $table->id();
            $table->string('particular');
            $table->enum('delivery_task',['parcel','groceries','food','document','ridesharing','courier']);
            $table->float('delivery_rate')->nullable();
            $table->float('delivery_max_charge')->nullable();
            $table->float('delivery_rider_rate')->nullable();
            $table->float('delivery_rider_max_charge')->nullable();
            $table->string('total_days_of_delivery')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->float('delivery_weight')->nullable();
            $table->float('delivery_distance')->nullable();
            $table->float('hourly_rate')->nullable();
            $table->float('delivery_additional_rate')->nullable();
            $table->float('petrol_per_km')->nullable();
            $table->float('recharge_amount')->nullable();
            $table->enum('delivery_type',['standard','express','custom','emergency','others']);
            $table->enum('delivery_vehicle',['motorbike','cycle','electric_bike','electric_car','van','truck','taxi','bus','other']);
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
        Schema::dropIfExists('delivery_packages');
    }
}
