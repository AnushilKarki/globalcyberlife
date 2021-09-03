<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoutesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('routes', function (Blueprint $table) {
            $table->id();
            $table->string('starting_location')->nullable();
            $table->string('ending_location')->nullable();
            $table->string('route_name');
            $table->float('km')->nullable();
            $table->float('total_count')->nullable();
            $table->text('details')->nullable();
            $table->foreignId('rider_id')->references('id')->on('delivery_riders')->onDelete('cascade')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->enum('status',['collecting','route','ready','completed'])->default('collecting');
            $table->enum('time',['morning','day','evening','night'])->nullable();
            $table->boolean('is_active')->default(true);
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
        Schema::dropIfExists('routes');
    }
}
