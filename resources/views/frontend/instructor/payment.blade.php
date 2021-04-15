@extends('frontend.app')
@section('content')
    <!-- ================================
	START SIGN UP AREA
	================================= -->
    <section class="sign-up section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="card-box-shared">
                        <div class="card-box-shared-title text-center">
                            <h3 class="widget-title font-size-35">@translate(Create an Account and) <br>
                                @translate(Start Teaching)!</h3>
                        </div>
                        @if (Session::has('message'))
                            <div class="alert alert-info text-center">{{ Session::get('message') }}</div>
                        @endif
                        <div class="card-box-shared-body">
                            <div class="contact-form-action">
                                <div class="row">
                                    {{--Radio button--}}
                                    <div class="m-auto text-center pt-5">
                                        <div class="post-card theme-bg text-white">
                                            <div class="post-card-content">
                                                @if($user->relationBetweenPackage->image ?? false)
                                                    <img src="{{filePath($user->relationBetweenPackage->image)}}" alt=""
                                                         class="img-fluid">
                                                    <h2 class="widget-title mt-4 mb-2">
                                                        @endif
                                                        @translate(Price):{{onlyPrice($user->relationBetweenPackage->price)}}</h2>
                                                    <p>{{getSystemSetting('type_name')->value}} @translate(Commission
                                                        is):{{$user->relationBetweenPackage->commission}}%</p>
                                            </div><!-- end post-card-content -->
                                            @error('package')
                                            <span class="invalid-feedback" role="alert">
				                            	<strong>{{ $message }}</strong>
				                          	</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-lg-12 ">
                                        <div class="input-box">
                                            <div class="card-box-shared">
                                                <div class="card-box-shared-title">
                                                    <h3 class="widget-title">@translate(Select Payment Method)</h3>
                                                </div>
                                                <div class="card-box-shared-body p-0">
                                                    <div class="payment-method-wrap">
                                                        <div class="checkout-item-list">
                                                            <div class="accordion" id="paymentMethodExample">
                                                                <div class="card">
                                                                    {{-- Stripe --}}
                                                        			@include('includes.instructor.stripe_checkout')
                                                                </div>

                                                                <div class="card">
                                                                	{{-- Paypal --}}
	                                            					@include('includes.instructor.paypal_checkout_buttons')
                                                                </div>
                                                            </div><!-- end accordion -->
                                                        </div>
                                                    </div><!-- end payment-method-wrap -->
                                                </div><!-- end card-box-shared-body -->
                                            </div>
                                        </div>
                                    </div><!-- end col-md-12 -->

                                </div><!-- end row -->
                            </div><!-- end contact-form -->
                        </div>
                    </div>
                </div><!-- end col-md-7 -->
            </div><!-- end row -->
        </div><!-- end container -->
    </section><!-- end sign-up -->
@endsection