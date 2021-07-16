<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubOrderReturnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_order_returns', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sub_order_id')->references('id')->on('sub_orders')->onDelete('cascade')->nullable();
            $table->text('reason')->nullable();
            $table->float('total_charge')->nullable();
            $table->enum('type',['EXCHANGE','REFUND'])->default('EXCHANGE');
            $table->enum('status',['PENDING','COMPLETED','DECLINED'])->default('PENDING');
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
        Schema::dropIfExists('sub_order_returns');
    }
}
