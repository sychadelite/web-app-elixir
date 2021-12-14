<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnTimestampKeteranganJumlahBiayaFotoToTagihanTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tagihan_user', function (Blueprint $table) {
            $table->enum('keterangan', ['rekening_air', 'rekening_non_air', 'angsuran']);
            $table->integer('jumlah')->nullable();
            $table->bigInteger('biaya')->nullable();
            $table->string('foto')->nullable();

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
        Schema::table('tagihan_user', function (Blueprint $table) {
            $table->timestamps();
        });
    }
}
