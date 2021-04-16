<?php

namespace App\Model;

use App\Model\Package;
use App\User;
use Illuminate\Database\Eloquent\Model;

class Instructor extends Model
{


    protected $guarded = ['id'];

    /*Package Purchase History*/
    public function purchaseHistory()
    {
        return $this->hasOne(PackagePurchaseHistory::class, 'user_id', 'user_id')->with('package');
    }
    /*Admin Payment History*/

    /*Courses*/
    public function courses()
    {
        return $this->hasMany(Course::class, 'user_id', 'user_id')->with('classes')->with('category');
    }


    // relationBetweenPackage
    public function relationBetweenPackage()
    {
        return $this->hasOne(Package::class, 'id', 'package_id');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    protected function checkAttributeColumn($attributes) {
    	if($attributes != null) {
    		if(count((array) json_decode($attributes))){
    			return true;
    		}
    	}
    	return false;
    }

    public function getPSaluationAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$saluation = json_decode($attrs)->saluation;
    		echo 'Saluation: ' . $saluation . '<br>';
    	}
    }

    public function getPNameAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$first_name = json_decode($attrs)->first_name;
    		$middle_name = json_decode($attrs)->middle_name;
    		$last_name = json_decode($attrs)->last_name;
    		echo '<b>' . $first_name .' '. $middle_name .' '. $last_name . '</b><br>';
    	}
    }

    public function getPFirstNameAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$first_name = json_decode($attrs)->first_name;
    		echo 'first name: ' . $first_name . '<br>';
    	}
    }

    public function getPMiddleNameAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$middle_name = json_decode($attrs)->middle_name;
    		echo 'middle name: ' . $middle_name . '<br>';
    	}
    }

    public function getPLastNameAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$last_name = json_decode($attrs)->last_name;
    		echo 'last name: ' . $last_name . '<br>';
    	}
    }

    public function getPGenderAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$gender = json_decode($attrs)->gender;
    		echo '(' . $gender . ')<br>';
    	}
    }

    public function getPDobAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$dob = json_decode($attrs)->dob;
    		echo 'Date of birth: ' . $dob . '<br>';
    	}
    }

    public function getPPhoneNumberAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$phone_number = json_decode($attrs)->phone_number;
    		echo '' . $phone_number . '<br>';
    	}
    }

    public function getPStateAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$state = json_decode($attrs)->state;
    		echo 'State: ' . $state . '<br>';
    	}
    }

    public function getPPinCodeAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$pin_code = json_decode($attrs)->pin_code;
    		echo 'Pin code: ' . $pin_code . '<br>';
    	}
    }

    public function getPCityAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$city = json_decode($attrs)->city;
    		echo 'City: ' . $city . '<br>';
    	}
    }

    public function getPSubAddress1Attribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$sub_address1 = json_decode($attrs)->sub_address1;
    		echo 'Sub address 1: ' . $sub_address1 . '<br>';
    	}
    }

    public function getPSubAddress2Attribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$sub_address2 = json_decode($attrs)->sub_address2;
    		echo 'Sub address 2: ' . $sub_address2 . '<br>';
    	}
    }

    public function getPQualificationsAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$qualifications = json_decode($attrs)->qualification;
    		if(count($qualifications)) {
    			$results = '';
	    		foreach ($qualifications as $key => $item) {
	    			$results .= 'Degree type: ' . $item->degree_type . '<br>';
	    			$results .= 'Year of passing: ' . $item->year_of_passing . '<br>';
	    			$results .= 'Board: ' . $item->board . '<br>';
	    			$results .= 'Percentage: ' . $item->degree_type . '<hr>';
	    		}
	    		echo substr($results, 0, -4); // to ignore <hr> tag
    		} else {
    			echo 'N/A';
    		}
    	} else {
    		echo 'Qualifications : N/A';
    	}
    }

    public function getPWorkExperienceAttribute() {
    	$attrs = $this->attributes['attributes'];
    	if($this->checkAttributeColumn($attrs)) {
    		$work_experience = json_decode($attrs)->work_experiance;
    		if(count($work_experience)) {
    			$results = '';
	    		foreach ($work_experience as $key => $item) {
	    			$results .= 'Company name: ' . $item->company_name . '<br>';
	    			$results .= 'Job title: ' . $item->title . '<br>';
	    			$results .= 'Tenure: ' . $item->tenure . ' years<hr>';
	    		}
	    		echo substr($results, 0, -4); // to ignore <hr> tag
    		} else {
    			echo 'N/A';
    		}
    	} else {
    		echo 'work experience: N/A';
    	}
    }
}
