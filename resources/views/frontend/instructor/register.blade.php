@extends('frontend.app')

@section('css')
	<link rel="stylesheet" type="text/css" href="{{ asset('vendor/flexible-smart-wizard/dist/css/smart_wizard_all.css') }}">
	<style type="text/css">
		.instructor-register input[type="radio"]:checked + div {
			background-color: #FFF;
			border: 3px solid rgba(8,0,134,0.5);
			color: inherit !important;
		}
		.contact-form-action select {
			padding: 15px !important;
		}
		.contact-form-action input {
			padding: 10px 15px !important;
		}
		.contact-form-action .info-title {
			font-weight: 600;
    		margin-bottom: 25px;
		}
		.contact-form-action .btn-light {
			color: rgba(8,0,134,1) !important;
			border: 1px solid rgba(8,0,134,0.5);
		}
		.contact-form-action .info-title:not(:first-of-type) {
    		margin-top: 35px;
		}
		.sign-up .card-box-shared {
			background-color: #FCFCFC !important;
		}
		.sign-up .card-box-shared-body {
			padding: 0 !important;
		}
		.sign-up .label-text {
			margin-bottom: 1px !important;
		}
		.sign-up .tab-pane {
			padding: 25px !important;
		}
		#smartwizard {
			border: 0;
		}
		.smartwizard .nav .nav-item span {
			font-size: 13px;
		}
		.sign-up .container-item .sr-no {
			padding: 10px;
		}
		.sign-up .container-item .remove-item {
			margin-top: 32px;
		    font-size: 20px;
		    padding: 5px 11px;
		}
		.smartwizard .toolbar-bottom {
			display: none;
		}
	</style>
@append

{{-- <label class="label-text">@translate(Select A Package)<span class="primary-color-2 ml-1">*</span></label>
	<div class="row">
    @foreach($packages as $item)
        <div class="col-lg-4 column-td-half instructor-register">
            <label>
                <input type="radio" required name="package_id" value="{{$item->id}}" class="card-input-element">
                @error('package_id')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                @enderror
                    <div class="post-card text-center">
                        <div class="post-card-content">
                            <img src="{{filePath($item->image)}}" alt="" class="img-fluid" />
                            <h2 class="widget-title mt-4 mb-2">
                                {{formatPrice($item->price)}}
                            </h2>
                            <div>
                                @translate(If you buy this package, admin will get)
                                <h3 class="text-info text-dark"> {{$item->commission}} % </h3>
                                @translate(of the course price for each enrollment of that course)
                            </div>
                        </div>
                    </div>
            </label>
        </div>
    @endforeach
</div> --}}

@section('content')
<!-- ================================
       START SIGN UP AREA
================================= -->
<section class="sign-up section--padding padding-top-10px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 mx-auto">
                <div class="row">
                    <div class="col-lg-12">
                        <p class="mt-2 mb-2">@translate(Already have an account)? <a href="{{ route('login') }}" class="primary-color-2">@translate(Log in)</a></p>
                    </div>
                </div>
                <div class="card-box-shared">
                    <div class="card-box-shared-title text-center">
                        <h3 class="widget-title font-size-35 text-success">@translate(Create an Account by Few Steps and Start Teaching)!</h3>
                    </div>
                    <div class="card-box-shared-body">
                        <div class="contact-form-action">
                            <form method="post" action="{{ route('instructor.create') }}">
                            	@csrf
                            	<div class="smartwizard">
									<div id="smartwizard">
									    <ul class="nav">
									        <li class="nav-item">
									          <a class="nav-link" href="#step-1">
									            <strong>Step 1</strong> <br>
									            <span>Basic information</span>
									          </a>
									        </li>
									        <li class="nav-item">
									          <a class="nav-link" href="#step-2">
									            <strong>Step 2</strong> <br>
									            <span>Contact and Address Details</span>
									          </a>
									        </li>
									        <li class="nav-item">
									          <a class="nav-link" href="#step-3">
									            <strong>Step 3</strong> <br>
									            <span>Qualification & Work Experience Details</span>
									          </a>
									        </li>
									        <li class="nav-item">
									          <a class="nav-link " href="#step-4">
									            <strong>Step 4</strong> <br>
									            <span>Preparing an evaluation test</span>
									          </a>
									        </li>
									    </ul>
									    <div class="tab-content">
									        <div id="step-1" class="tab-pane" role="tabpanel" aria-labelledby="step-1">
									            <h2 class="info-title">Basic Details</h2>
									            <div>
										            <div class="row">
					                                	<div class="col-lg-3 col-6">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Saluation)</label>
					                                            <div class="form-group">
					                                            	<select name="saluation" class="form-control @error('saluation') is-invalid @enderror" required>
					                                            		<option value="mr">Mr</option>
					                                            		<option value="ms">Ms</option>
					                                            	</select>
					                                                @error('saluation')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                	<div class="col-lg-3 col-6">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(First Name)<span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('first_name') is-invalid @enderror" type="text" name="first_name" required value="{{ old('first_name') }}">
					                                                @error('first_name')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                	<div class="col-lg-3 col-6">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Middle Name)</label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('middle_name') is-invalid @enderror" type="text" name="middle_name" value="{{ old('middle_name') }}">
					                                                @error('middle_name')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                	<div class="col-lg-3 col-6">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Last Name)<span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('last_name') is-invalid @enderror" type="text" name="last_name" required value="{{ old('last_name') }}">
					                                                @error('last_name')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                </div>
					                                <div class="row">
					                                    <div class="col-lg-12 col-12">
					                                        <div class="input-box">
					                                        	@livewire('instructor.register.email-address')
					                                        </div>
					                                    </div>
					                                </div>
					                                <div class="row">
					                                    <div class="col-lg-6 col-12">
					                                        <div class="input-box">
					                                            <label class="label-text">@translate(Password)<span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('password') is-invalid @enderror" type="password" name="password" placeholder="Password" required>
					                                                <small id="emailHelp" class="form-text text-muted">Password minimum 8 characters.</small>
					                                                @error('password')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="col-lg-6 col-12">
					                                        <div class="input-box">
					                                            <label class="label-text">@translate(Confirm Password)<span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('confirm_password') is-invalid @enderror" type="password" name="confirm_password" placeholder="Confirm password" required>
					                                                @error('confirm_password')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                    </div>
					                                </div>
					                                <div class="row">
					                                	<div class="col-lg-6 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Gender)</label>
					                                            <div class="form-group">
					                                            	<select name="gender" class="form-control @error('gender') is-invalid @enderror" required>
					                                            		<option value="male">Male</option>
					                                            		<option value="female">Female</option>
					                                            	</select>
					                                                @error('gender')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                	<div class="col-lg-6 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Date of birth) <span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                            	<input type="date" name="dob" class="form-control @error('dob') is-invalid @enderror" required>
					                                                @error('dob')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                </div>
									            </div>
									        </div>
									        <div id="step-2" class="tab-pane" role="tabpanel" aria-labelledby="step-2">
									            <h2 class="info-title">Contact and Address Details</h2>
									            <div>
										            <div class="row">
					                                	<div class="col-lg-6 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Phone number)<span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('phone_number') is-invalid @enderror" type="text" name="phone_number" required value="{{ old('phone_number') }}">
					                                                @error('phone_number')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                </div>
					                                <div class="row">
					                                	<div class="col-lg-4 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(State)<span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                                <select name="state" class="form-control @error('state') is-invalid @enderror" required>
					                                                	@foreach(\App\User::countries as $state)
					                                            		<option value="{{ $state }}">{{ $state }}</option>
					                                            		@endforeach
					                                            	</select>
					                                                @error('state')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                	<div class="col-lg-4 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Pin code)</label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('pin_code') is-invalid @enderror" type="text" name="pin_code" value="{{ old('pin_code') }}">
					                                                @error('pin_code')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                	<div class="col-lg-4 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(City)<span class="primary-color-2 ml-1">*</span></label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('city') is-invalid @enderror" type="text" name="city" required value="{{ old('city') }}">
					                                                @error('city')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                </div>
					                                <div class="row">
					                                	<div class="col-lg-6 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(Aread/Colony/Street/Sector/Village)</label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('sub_address1') is-invalid @enderror" type="text" name="sub_address1" value="{{ old('sub_address1') }}">
					                                                @error('sub_address1')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                </div>
					                                <div class="row">
					                                	<div class="col-lg-6 col-12">
					                                		<div class="input-box">
					                                            <label class="label-text">@translate(House/Flat/Building/Apartment)</label>
					                                            <div class="form-group">
					                                                <input class="form-control @error('sub_address2') is-invalid @enderror" type="text" name="sub_address2" value="{{ old('sub_address2') }}">
					                                                @error('sub_address2')
					                                                <span class="invalid-feedback" role="alert">
					                                                  <strong>{{ $message }}</strong>
					                                                </span>
					                                                @enderror
					                                            </div>
					                                        </div>
					                                	</div>
					                                </div>
									            </div>
									        </div>
									        <div id="step-3" class="tab-pane" role="tabpanel" aria-labelledby="step-3">
									        	<h2 class="info-title">
									        		Qualification Details
									        		<a class="btn btn-light btn-md add-more-degree" href="javascript:;" role="button">
										        		<i class="fa fa-plus"></i> Add degree
										        	</a>
									        	</h2>
									        	<div id="degree-container">
									        		<div class="container-item degree-container-item">
									        			<div class="row">
									        				<div class="col-lg-1">
									        					<label class="label-text">Sr. No</label>
									        					<div class="sr-no">1</div>
									        				</div>
									        				<div class="col-lg-2">
						                                		<div class="input-box">
						                                            <label class="label-text">@translate(Degree)</label>
						                                            <div class="form-group">
						                                            	<select name="qualification[0][degree_type]"
						                                            		id="degree_type_0" class="form-control @error('qualification[0][degree_type]') is-invalid @enderror" required>
						                                            		<option value="secondary_degree">Secondary degree</option>
						                                            		<option value="associate_degree">Associate Degree</option>
						                                            		<option value="bachelor_degree">Bachelor's Degree</option>
						                                            		<option value="master_degree">Master's Degree</option>
						                                            		<option value="doctoral_degree">Doctoral Degree</option>
						                                            	</select>
						                                                @error('qualification[0][degree_type]')
						                                                <span class="invalid-feedback" role="alert">
						                                                  <strong>{{ $message }}</strong>
						                                                </span>
						                                                @enderror
						                                            </div>
						                                        </div>
					                                		</div>
					                                		<div class="col-lg-3">
						                                		<div class="input-box">
						                                            <label class="label-text">@translate(Year of passing)<span class="primary-color-2 ml-1">*</span></label>
						                                            <div class="form-group">
						                                                <input class="form-control @error('qualification[0][year_of_passing]') is-invalid @enderror" type="date" name="qualification[0][year_of_passing]" required value="{{ old('qualification[0][year_of_passing]') }}">
						                                                @error('qualification[0][year_of_passing]')
						                                                <span class="invalid-feedback" role="alert">
						                                                  <strong>{{ $message }}</strong>
						                                                </span>
						                                                @enderror
						                                            </div>
						                                        </div>
					                                		</div>
					                                		<div class="col-lg-3">
						                                		<div class="input-box">
						                                            <label class="label-text">@translate(Board/university)<span class="primary-color-2 ml-1">*</span></label>
						                                            <div class="form-group">
						                                                <input class="form-control @error('qualification[0][board]') is-invalid @enderror" type="text" name="qualification[0][board]" required value="{{ old('qualification[0][board]') }}">
						                                                @error('qualification[0][board]')
						                                                <span class="invalid-feedback" role="alert">
						                                                  <strong>{{ $message }}</strong>
						                                                </span>
						                                                @enderror
						                                            </div>
						                                        </div>
						                                	</div>
						                                	<div class="col-lg-2">
						                                		<div class="input-box">
						                                            <label class="label-text">@translate(Percentage (%))<span class="primary-color-2 ml-1">*</span></label>
						                                            <div class="form-group">
						                                                <input class="form-control @error('qualification[0][percentage]') is-invalid @enderror" type="number" name="qualification[0][percentage]" required value="{{ old('qualification[0][percentage]') }}">
						                                                @error('qualification[0][percentage]')
						                                                <span class="invalid-feedback" role="alert">
						                                                  <strong>{{ $message }}</strong>
						                                                </span>
						                                                @enderror
						                                            </div>
						                                        </div>
						                                	</div>
					                                		<div class="col-lg-1">
					                                			<label class="label-text"></label>
					                                			<a href="javascript:void(0)" class="degree-remove-item remove-item btn btn-sm btn-outline-danger remove-social-media">
					                                				<i class="fa fa-trash"></i>
					                                			</a>
					                                		</div>
									        			</div>
									        		</div>
									        	</div>
									        	<hr>
									        	<h2 class="info-title">
									        		Work experiance details
									        		<a class="btn btn-light btn-md add-more-work-experiance" href="javascript:;" role="button">
										        		<i class="fa fa-plus"></i> Add work experiance
										        	</a>
									        	</h2>
									        	<div id="work-experiance-container">
									        		<div class="container-item work-experiance-container-item">
									        			<div class="row">
									        				<div class="col-lg-1">
									        					<label class="label-text">Sr. No</label>
									        					<div class="sr-no">1</div>
									        				</div>
									        				<div class="col-lg-3">
						                                		<div class="input-box">
						                                            <label class="label-text">@translate(Company Name)<span class="primary-color-2 ml-1">*</span></label>
						                                            <div class="form-group">
						                                                <input class="form-control @error('work_experiance[0][company_name]') is-invalid @enderror" type="text" name="work_experiance[0][company_name]" required value="{{ old('work_experiance[0][company_name]') }}">
						                                                @error('work_experiance[0][company_name]')
						                                                <span class="invalid-feedback" role="alert">
						                                                  <strong>{{ $message }}</strong>
						                                                </span>
						                                                @enderror
						                                            </div>
						                                        </div>
						                                	</div>
						                                	<div class="col-lg-3">
						                                		<div class="input-box">
						                                            <label class="label-text">@translate(Title)</label>
						                                            <div class="form-group">
						                                                <input class="form-control @error('work_experiance[0][title]') is-invalid @enderror" type="text" name="work_experiance[0][title]" value="{{ old('work_experiance[0][title]') }}">
						                                                @error('work_experiance[0][title]')
						                                                <span class="invalid-feedback" role="alert">
						                                                  <strong>{{ $message }}</strong>
						                                                </span>
						                                                @enderror
						                                            </div>
						                                        </div>
						                                	</div>
						                                	<div class="col-lg-3">
						                                		<div class="input-box">
						                                            <label class="label-text">@translate(Tenure)</label>
						                                            <div class="form-group">
						                                            	<select name="work_experiance[0][tenure]"
						                                            		id="tenure_0" class="form-control @error('work_experiance[0][tenure]') is-invalid @enderror" required>
						                                            		<option value="1to2">1 Year to 2 Years</option>
						                                            		<option value="2to5">2 Years to 5 Years</option>
						                                            		<option value="5to10">5 Years to 10 Years</option>
						                                            		<option value="more10">Above 10 Years</option>
						                                            	</select>
						                                                @error('work_experiance[0][tenure]')
						                                                <span class="invalid-feedback" role="alert">
						                                                  <strong>{{ $message }}</strong>
						                                                </span>
						                                                @enderror
						                                            </div>
						                                        </div>
					                                		</div>
					                                		<div class="col-lg-1">
					                                			<label class="label-text"></label>
					                                			<a href="javascript:void(0)" class="work-experiance-remove-item remove-item btn btn-sm btn-outline-danger remove-social-media">
					                                				<i class="fa fa-trash"></i>
					                                			</a>
					                                		</div>
									        			</div>
									        		</div>
									        	</div>
									        </div>
									        <div id="step-4" class="tab-pane" role="tabpanel" aria-labelledby="step-4">
									            <h2 class="info-title">Evaluation test</h2>
									            <div>Teacher quality assessment generally includes reviews of qualifications, teacher knowledge tests, practice notes, and student learning gains. Teacher quality evaluations are currently used in policy creation, hiring and grant decisions, teacher ratings, merit rewards, and data to inform teachers' professional growth. Teacher evaluation is a process used to measure teacher effectiveness based on student learning and success. Teachers' ratings have changed over the years. In previous years, teacher evaluations were based on the personal characteristics of the teacher, however, from the early 1950s through the 1980s, teacher evaluations took a shift and began to focus on teacher teaching, which was noticed in student outcomes. After the 1980s, teacher ratings were measured based on increased professional development, accountability, and school improvement.</div>
									        	<div class="row mt-3">
									        		<div class="col-lg-12">
									        			<div class="form-group form-check">
									        				<input type="hidden" name="agree_ev_test" value="0">
														    <input type="checkbox" class="form-check-input @error('agree_ev_test') is-invalid @enderror mt-2"
														    	required
														    	id="agree_ev_test" name="agree_ev_test" value="{{ old('agree_ev_test') ? old('agree_ev_test') : 1 }}">
														    <label class="form-check-label label-text" for="agree_ev_test">
														    	@translate(I agree to take an evaluation test.) *
														    </label>
			                                                @error('agree_ev_test')
			                                                <span class="invalid-feedback" role="alert">
			                                                  <strong>{{ $message }}</strong>
			                                                </span>
			                                                @enderror
														</div>
				                                	</div>
				                                	<div class="col-lg-12">
									        			<div class="form-group form-check">
									        				<input type="hidden" name="agree_terms_cond" value="0">
														    <input type="checkbox" class="form-check-input @error('agree_terms_cond') is-invalid @enderror mt-2"
														    	required
														    	id="agree_terms_cond" name="agree_terms_cond" value="{{ old('agree_terms_cond') ? old('agree_terms_cond') : 1 }}">
														    <label class="form-check-label label-text" for="agree_terms_cond">
														    	@translate(I agree for)
														    	<a href="#">@translate(terms and conditions)</a>
														    	@translate(of Langufina.) *
														    </label>
			                                                @error('agree_terms_cond')
			                                                <span class="invalid-feedback" role="alert">
			                                                  <strong>{{ $message }}</strong>
			                                                </span>
			                                                @enderror
														</div>
				                                	</div>
									        	</div>
									        </div>
									    </div>
									</div>
									<div class="mb-3 ml-4">
										<p class="text-danger mb-3" id="fill_required" style="display: none;">
											Please fill required/invalid fields first.
										</p>
										<button class="btn btn-primary" id="prev-btn" type="button">
											<i class="fa fa-arrow-left"></i>
											Previous step
										</button>
									    <button class="btn btn-primary" id="next-btn" type="button">
									    	Next step
									    	<i class="fa fa-arrow-right"></i>
									    </button>
									    <button class="btn btn-primary ml-4 pr-4 pl-4" id="submit-btn" type="submit">Submit</button>
									</div>
						        </div>
                            </form>
                        </div><!-- end contact-form -->
                    </div>
                </div>
            </div><!-- end col-md-7 -->
        </div><!-- end row -->

    </div><!-- end container -->
</section><!-- end sign-up -->
<!-- ================================
       START SIGN UP AREA
================================= -->
@append

@section('js')
	<script type="text/javascript" src="{{ asset('vendor/flexible-smart-wizard/dist/js/jquery.smartWizard.min.js') }}"></script>
	<script type="text/javascript">
		$(document).ready(function(){

            // Step show event
            $("#smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection, stepPosition) {
                $("#prev-btn").removeClass('disabled')
                $("#next-btn").removeClass('disabled')
                $("#submit-btn").removeClass('disabled').removeAttr('disabled');
                if(stepPosition === 'first') {
                    $("#prev-btn").addClass('disabled');
                    $("#submit-btn").addClass('disabled').attr('disabled', 'disabled');
                } else if(stepPosition === 'last') {
                    $("#next-btn").addClass('disabled');
                    $("#submit-btn").removeClass('disabled').removeAttr('disabled');
                } else {
                	$("#submit-btn").addClass('disabled').attr('disabled', 'disabled');
                    $("#prev-btn").removeClass('disabled');
                    $("#next-btn").removeClass('disabled');
                }
            });

            $('body').delegate('#prev-btn, #next-btn', 'click', function(){
            	var body = $("html, body");
            	if(!$(this).hasClass('disabled')) {
	            	body.stop().animate({scrollTop:200}, 500, 'swing');
            	}
            })

            // Smart Wizard
            $('#smartwizard').smartWizard({
                selected: 0,
                theme: 'arrows', // default, arrows, dots, progress
                // darkMode: true,
                transition: {
                    animation: 'slide-horizontal', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
                },
            });

            // check valid step
            function checkValidStep(step_index) {
            	let status = true;
            	$(`#step-${step_index} [required]`).each(function(){
            		if($(this).hasClass('is-invalid')) {
            			status = false;
            		}
            		if($(this).attr('type') == 'checkbox') {
            			if(!$(this).prop('checked')) {
            				status = false;
            			}
            		} else {
	            		if($(this).val() == '' || $(this).val() == null) {
	            			status = false;
	            		}
            		}
            	});
            	return status;
            }

            $("#next-btn").on("click", function() {
            	var step_index = parseInt($('#smartwizard').smartWizard("getStepIndex")) + 1;
                if(checkValidStep(step_index)) {
                	$('#fill_required').hide();
	                $('#smartwizard').smartWizard("next");
	                return true;
                } else {
                	$('#fill_required').show();
                }
            });
            $("#prev-btn").on("click", function() {
            	var step_index = parseInt($('#smartwizard').smartWizard("getStepIndex"));
                if(checkValidStep(step_index)) {
                	$('#fill_required').hide();
	                $('#smartwizard').smartWizard("prev");
	                return true;
                } else {
                	$('#fill_required').show();
                }
            });

            // Demo Button Events
            $("#got_to_step").on("change", function() {
                // Go to step
                var step_index = $(this).val() - 1;
                $('#smartwizard').smartWizard("goToStep", step_index);
                return true;
            });
            $("#is_justified").on("click", function() {
                // Change Justify
                var options = {
                  justified: $(this).prop("checked")
                };

                $('#smartwizard').smartWizard("setOptions", options);
                return true;
            });

            $("#animation").on("change", function() {
                // Change theme
                var options = {
                  transition: {
                      animation: $(this).val()
                  },
                };
                $('#smartwizard').smartWizard("setOptions", options);
                return true;
            });

            $("#theme_selector").on("change", function() {
                // Change theme
                var options = {
                  theme: $(this).val()
                };
                $('#smartwizard').smartWizard("setOptions", options);
                return true;
            });
        });
	</script>
	<script src="{{ asset('vendor/clone-field-increment/cloneData.js') }}" type="text/javascript"></script>
	<script type="text/javascript">
		$('.add-more-degree').cloneData({
	        mainContainerId: 'degree-container', // Main container Should be ID
	        cloneContainer: 'degree-container-item', // Which you want to clone
	        removeButtonClass: 'degree-remove-item', // Remove button for remove cloned HTML
	        removeConfirm: true, // default true confirm before delete clone item
	        removeConfirmMessage: 'Are you sure want to delete?', // confirm delete message
	        minLimit: 1, // Default 1 set minimum clone HTML required
	        maxLimit: 3, // Default unlimited or set maximum limit of clone HTML
	        defaultRender: 1,
	        init: function () {},
	        beforeRender: function () {
	        	$('.sign-up .tab-content').css('height', 'auto');
	        },
	        afterRender: function () {
	            $('.degree-container-item').each(function(i){
	            	$(this).find('.sr-no').html(i+1);
	            })
	        },
	        afterRemove: function () {
	        	$('.degree-container-item').each(function(i){
	            	$(this).find('.sr-no').html(i+1);
	            })
	        }
    	});
    	$('.add-more-work-experiance').cloneData({
	        mainContainerId: 'work-experiance-container', // Main container Should be ID
	        cloneContainer: 'work-experiance-container-item', // Which you want to clone
	        removeButtonClass: 'work-experiance-remove-item', // Remove button for remove cloned HTML
	        removeConfirm: true, // default true confirm before delete clone item
	        removeConfirmMessage: 'Are you sure want to delete?', // confirm delete message
	        minLimit: 1, // Default 1 set minimum clone HTML required
	        maxLimit: 4, // Default unlimited or set maximum limit of clone HTML
	        defaultRender: 1,
	        init: function () {},
	        beforeRender: function () {
	        	$('.sign-up .tab-content').css('height', 'auto');
	        },
	        afterRender: function () {
	            $('.work-experiance-container-item').each(function(i){
	            	$(this).find('.sr-no').html(i+1);
	            })
	        },
	        afterRemove: function () {
	        	$('.work-experiance-container-item').each(function(i){
	            	$(this).find('.sr-no').html(i+1);
	            })
	        }
    	});
	</script>
@append