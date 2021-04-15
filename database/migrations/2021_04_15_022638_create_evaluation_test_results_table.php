<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEvaluationTestResultsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
    	if(!Schema::hasTable('evaluation_test_results')) {
	        Schema::create('evaluation_test_results', function (Blueprint $table) {
	            $table->id();
	            $table->integer('user_id')->unsigned();
	            $table->integer('question_id')->unsigned();
	            $table->boolean('is_correct');
	            $table->timestamps();
	        });
    	}
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('evaluation_test_results');
    }
}
