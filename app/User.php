<?php

namespace App;

use App\Model\VerifyUser;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use App\Model\Instructor;
use App\Model\Student;
use Mprince\Pointable\Contracts\Pointable;
use Mprince\Pointable\Traits\Pointable as PointableTrait;
use Illuminate\Database\Eloquent\Model;


class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;
    use HasApiTokens;
    use PointableTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'user_type', 'provider_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    // relationBetweenInstructor
    function relationBetweenInstructor()
    {
      return $this->hasOne(Instructor::class,'user_id','id');
    }

    // relationBetweenStudent
    function student()
    {
      return $this->hasOne(Student::class, 'user_id', 'id');
    }

    public function instructor() {
    	return $this->hasOne(Instructor::class, 'user_id', 'id');
    }

    // verifyUser
    public function verifyUser(){
        return $this->hasOne(VerifyUser::class,'user_id','id');
    }

    public function scopeVerify($query){
        return $query->where('verified', true);
    }

    public function getInstructorTypeAttribute() {
    	if($this->user_type == 'Instructor') {
    		return $this->instructor()->first()->type;
    	}
    	return null;
    }

    const countries = [
		'AP' => 'Andhra Pradesh',
		'AR' => 'Arunachal Pradesh',
		'AS' => 'Assam',
		'BR' => 'Bihar',
		'CT' => 'Chhattisgarh',
		'GA' => 'Goa',
		'GJ' => 'Gujarat',
		'HR' => 'Haryana',
		'HP' => 'Himachal Pradesh',
		'JK' => 'Jammu and Kashmir',
		'JH' => 'Jharkhand',
		'KA' => 'Karnataka',
		'KL' => 'Kerala',
		'MP' => 'Madhya Pradesh',
		'MH' => 'Maharashtra',
		'MN' => 'Manipur',
		'ML' => 'Meghalaya',
		'MZ' => 'Mizoram',
		'NL' => 'Nagaland',
		'OR' => 'Odisha',
		'PB' => 'Punjab',
		'RJ' => 'Rajasthan',
		'SK' => 'Sikkim',
		'TN' => 'Tamil Nadu',
		'TG' => 'Telangana',
		'TR' => 'Tripura',
		'UP' => 'Uttar Pradesh',
		'UT' => 'Uttarakhand',
		'WB' => 'West Bengal',
		'AN' => 'Andaman and Nicobar Islands',
		'CH' => 'Chandigarh',
		'DN' => 'Dadra and Nagar Haveli',
		'DD' => 'Daman and Diu',
		'LD' => 'Lakshadweep',
		'DL' => 'National Capital Territory of Delhi',
		'PY' => 'Puducherry'
	];

    //END
}
