<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliveryTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('delivery_tasks', function (Blueprint $table) {
            $table->id();

            $table->enum('task_status',['pending','on_way','completed','failed'])->default('pending');
            $table->foreignId('delivery_id')->references('id')->on('delivery_parcels')->onDelete('cascade')->nullable();
            $table->foreignId('delivery')->references('id')->on('deliveries')->onDelete('cascade')->nullable();
            $table->float('rider_earning')->nullable();
            $table->foreignId('route_id')->references('id')->on('routes')->onDelete('cascade')->nullable();
            $table->string('reason')->nullable();
            $table->date('date')->nullable();
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
        Schema::dropIfExists('delivery_tasks');
    }
}
