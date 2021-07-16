<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScheduleMeetingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedule_meetings', function (Blueprint $table) {
            $table->id();
           
            $table->foreignId('team_id')->references('id')->on('teams')->onDelete('cascade')->nullable();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade')->nullable();
          
            $table->string('particular')->nullable();
            $table->text('objective')->nullable();
            $table->text('meeting_details');
            $table->date('date');
            $table->boolean('is_active')->default(true);
            $table->enum('meeting_type',['yearly','monthly','weekly','daily'])->nullable();
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
        Schema::dropIfExists('schedule_meetings');
    }
}
