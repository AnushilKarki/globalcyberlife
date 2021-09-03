<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShopReportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shop_reports', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shop_id')->references('id')->on('shops')->onDelete('cascade')->nullable();
     
            $table->date('date');
            $table->float('total_credit_amount',8,2);
            $table->float('total_expense_amount',8,2);
            $table->float('total_income_amount',8,2);
            $table->float('total_commision_amount',8,2);
            $table->float('total_capital_amount',8,2);
            $table->float('total_liability_amount',8,2);
            $table->float('total_asset_amount',8,2);
            $table->integer('total_task_completed');
            $table->integer('total_task_failed');
            $table->integer('goal_completed');
            $table->integer('goal_failed');
            $table->float('total_profit',8,2);
            $table->float('total_sale',8,2);
            $table->float('total_advertisement_amount');
            $table->integer('total_complain');
            $table->float('total_customer_return_amount');
            $table->float('total_shop_return_amount');
            $table->integer('total_delivery_completed');
            $table->float('total_purchase_amount');
            $table->integer('total_order');
            $table->integer('total_teams');
            $table->enum('report_type',['yearly','monthly','weekly','daily']);
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
        Schema::dropIfExists('shop_reports');
    }
}
