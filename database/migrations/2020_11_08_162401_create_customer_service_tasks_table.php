<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerServiceTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_service_tasks', function (Blueprint $table) {
            $table->id();
           
            $table->foreignId('army_id')->references('id')->on('users')->onDelete('cascade')->nullable();
            $table->enum('task_status',['pending','on_way','completed','failed'])->default('pending');
            $table->foreignId('service_id')->references('id')->on('services')->onDelete('cascade')->nullable();
  
            $table->enum('available_time',['morning','day','evening','night','all']);
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
        Schema::dropIfExists('customer_service_tasks');
    }
}
