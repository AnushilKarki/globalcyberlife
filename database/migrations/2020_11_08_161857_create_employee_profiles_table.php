<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmployeeProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_profiles', function (Blueprint $table) {
            $table->id();
           
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade')->nullable();
            $table->string('role');
            $table->text('objective');
            $table->string('contact');
            $table->enum('field',['marketing','customer','delivery','financial']);
            $table->integer('total_task_completed');
            $table->integer('total_task_failed');
            $table->integer('total_task_point');
            $table->integer('total_report_submitted');
            $table->integer('total_reward');
            $table->float('total_earning');
            $table->float('today_earning');
            $table->float('salary');
            $table->integer('total_payment');
            $table->boolean('is_active')->default(true);
            $table->enum('goal_status',['not_completed','completed'])->nullable();
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
        Schema::dropIfExists('employee_profiles');
    }
}
