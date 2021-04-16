<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EvaluationTestResult extends Model
{
    public $table = 'evaluation_test_results';

    protected $fillable = ['attributes'];

    public function user(){
        return $this->hasOne(User::class,'id','user_id');
    }

    public function test(){
        return $this->hasOne(EvaluationTest::class,'id','test_id');
    }
}
