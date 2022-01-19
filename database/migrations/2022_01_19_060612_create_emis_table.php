<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('emis', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->unsignedBigInteger('loan_id');
            $table->foreign('loan_id')->references('id')->on('loans');

            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->decimal('amount',10,3);
            $table->date('date');
            $table->tinyInteger('status')->comment('0=unpaid, 1=Paid')->default(0);
            
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
        Schema::dropIfExists('emis');
    }
}
