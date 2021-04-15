@if(env('STRIPE_KEY') != null || empty(env('STRIPE_KEY')))
	<div class="card-header w-55" id="headingThree">
	    <div class="checkout-item d-flex align-items-center justify-content-between">
	        <label for="radio-8 stripe-label"
	               class="radio-trigger collapsed mb-0 w-100"
	               data-toggle="collapse"
	               data-target="#collapseTwo"
	               aria-expanded="false"
	               aria-controls="collapseTwo">
	            <span class="widget-title font-size-18 stripe-btn d-block text-center">
	            <img src="{{ asset('frontend/images/stripe.png') }}" class="img-fluid" alt="">
	          </span>
	        </label>
	    </div>
	</div>

	<div id="collapseTwo" class="collapse" aria-labelledby="headingThree" data-parent="#paymentMethodExample">
	    <div class="card-body">
	        <div class="contact-form-action stripe-margin">
	            <form role="form"
	                  action="{{ route('instructor.stripe.payment') }}"
	                  method="post"
	                  class="require-validation"
	                  data-cc-on-file="false"
	                  data-stripe-publishable-key="{{ env('STRIPE_KEY') }}"
	                  id="payment-form">
	                @csrf
	                <input type="hidden" name="user_id"
	                       value="{{$user->user_id}}">
	                <input type="hidden"
	                       name="package_id"
	                       value="{{$user->package_id}}">
	                <div class="input-box">
	                    <label class="label-text">@translate(Name
	                        on Card) <span
	                            class="primary-color-2 ml-1">*</span></label>
	                    <div class="form-group">
	                      <span
	                          class="la la-pencil input-icon"></span>
	                        <input class="form-control"
	                               placeholder="Card Name"
	                               type="text"
	                               name="text"
	                               required="">
	                    </div>
	                </div>
	                <div class="input-box">
	                    <label class="label-text">@translate(Card
	                        Number)<span
	                            class="primary-color-2 ml-1">*</span></label>
	                    <div class="form-group">
	                    <span
	                        class="la la-pencil input-icon"></span>
	                        <input
	                            class="form-control card-number"
	                            name="text"
	                            placeholder="1234  5678  9876  5432"
	                            required="" type="text">
	                    </div>
	                </div>
	                <div class="input-box">
	                    <label class="label-text">@translate(Expiry
	                        Month)<span
	                            class="primary-color-2 ml-1">*</span></label>
	                    <div class="form-group">
	                      <span
	                          class="la la-pencil input-icon"></span>
	                        <input
	                            class="form-control card-expiry-month"
	                            placeholder="MM"
	                            required=""
	                            name="text" type="text">
	                    </div>
	                </div>
	                <div class="input-box">
	                    <label class="label-text">@translate(Expiry
	                        Year)<span
	                            class="primary-color-2 ml-1">*</span></label>
	                    <div class="form-group">
	                    <span
	                        class="la la-pencil input-icon"></span>
	                        <input
	                            class="form-control card-expiry-year"
	                            placeholder="YY"
	                            required=""
	                            name="text" type="text">
	                    </div>
	                </div>
	                <div class="input-box">
	                    <label class="label-text">@translate(CVC)<span
	                            class="primary-color-2 ml-1">*</span></label>
	                    <div class="form-group">
	                      <span
	                          class="la la-pencil input-icon"></span>
	                        <input
	                            class="form-control card-cvc"
	                            placeholder="CVC"
	                            required=""
	                            name="text" type="text">
	                    </div>
	                </div>

	                <div class="input-box">
	                    <input type="hidden" name="name"
	                           value="{{$user->name }}">
	                    <input type="hidden"
	                           name="amount_g"
	                           value="{{$user->relationBetweenPackage->price}}">
	                    <input type="hidden"
	                           name="amount"
	                           value="{{$user->relationBetweenPackage->price}}">
	                </div>

	                <button type="submit"
	                        class="theme-btn d-block text-center m-auto">
	                    @translate(Proceed)({{formatPrice($user->relationBetweenPackage->price)}}
	                    )
	                </button>
	            </form>

	        </div>
	    </div>
	</div>

	@section('js')
	    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
	    <script type="text/javascript">
	        "use strict"
	        $(function () {
	            var $form = $(".require-validation");
	            $('form.require-validation').bind('submit', function (e) {
	                var $form = $(".require-validation"),
	                    inputSelector = ['input[type=email]', 'input[type=password]',
	                        'input[type=text]', 'input[type=file]',
	                        'textarea'].join(', '),
	                    $inputs = $form.find('.required').find(inputSelector),
	                    $errorMessage = $form.find('div.error'),
	                    valid = true;
	                $errorMessage.addClass('hide');

	                $('.has-error').removeClass('has-error');
	                $inputs.each(function (i, el) {
	                    var $input = $(el);
	                    if ($input.val() === '') {
	                        $input.parent().addClass('has-error');
	                        $errorMessage.removeClass('hide');
	                        e.preventDefault();
	                    }
	                });

	                if (!$form.data('cc-on-file')) {
	                    e.preventDefault();
	                    Stripe.setPublishableKey($form.data('stripe-publishable-key'));
	                    Stripe.createToken({
	                        number: $('.card-number').val(),
	                        cvc: $('.card-cvc').val(),
	                        exp_month: $('.card-expiry-month').val(),
	                        exp_year: $('.card-expiry-year').val()
	                    }, stripeResponseHandler);
	                }

	            });

	            function stripeResponseHandler(status, response) {
	                if (response.error) {
	                    $('.error')
	                        .removeClass('hide')
	                        .find('.alert')
	                        .text(response.error.message);
	                } else {
						// token contains id, last4, and card type
	                    var token = response['id'];
						// insert the token into the form so it gets submitted to the server
	                    $form.find('input[type=text]').empty();
	                    $form.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
	                    $form.get(0).submit();
	                }
	            }

	        });
	    </script>
	@append
@endif