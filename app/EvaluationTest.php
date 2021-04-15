<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EvaluationTest extends Model
{
    public $table = "evaluation_tests";

    public function questions(){
        return $this->hasMany(EvaluationTestQuestion::class,'test_id','id')->where('status',1);
    }

    public function category(){
        return $this->hasOne(EvaluationTestCategory::class,'id','category_id');
    }
}
