<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EvaluationTestCategory extends Model
{
	public $table = "evaluation_test_categories";

	public function tests(){
        return $this->hasMany(EvaluationTest::class,'category_id','id');
   }
}
