<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMarketingTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('marketing_tasks', function (Blueprint $table) {
            $table->id();
           
            $table->foreignId('army_id')->references('id')->on('users')->onDelete('cascade')->nullable();
            $table->enum('task_status',['pending','on_way','completed','failed'])->default('pending');
            $table->foreignId('marketing_id')->references('id')->on('marketings')->onDelete('cascade')->nullable();
            $table->float('head_earning');
            $table->float('marketing_earning');
            $table->enum('available_time',['morning','day','evening','night']);
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
        Schema::dropIfExists('marketing_tasks');
    }
}
