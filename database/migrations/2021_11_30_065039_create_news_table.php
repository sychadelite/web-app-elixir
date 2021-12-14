<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('news', function (Blueprint $table) {
            $table->bigIncrements('id_news');
            $table->unsignedBigInteger('id_pusat');

            $table->string('headline');
            $table->string('content')->nullable();
            $table->string('creator')->nullable();
            $table->bigInteger('views');
            $table->timestamps();

            // $table->foreign('id_pusat')->references('id_pusat')->on('pusat_pdam')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('news');
    }
}
