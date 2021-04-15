@if(env('PAYPAL_CLIENT_ID') != null && !empty(env('PAYPAL_CLIENT_ID')))
	<div id="paypal-button" class="card-header w-55"></div>
	<form id="paypal-form" method="post" action="{{route('instructor.paypal.payment')}}">
	    @csrf
	    <input type="hidden" name="orderID" id="orderID">
	    <input type="hidden" name="amount_g"
	           value="{{$user->relationBetweenPackage->price}}">
	    <input type="hidden" name="package_id"
	           value="{{$user->package_id}}">
	    <input type="hidden" name="user_id"
	           value="{{$user->user_id}}">
	    <input type="hidden" name="paymentID"
	           id="paymentID">
	    <input type="hidden" name="paymentToken"
	           id="paymentToken">
	    <input type="hidden"
	           value="{{$user->relationBetweenPackage->price}}"
	           name="amount" id="amount">
	</form>

	@section('js')
		<script src="https://www.paypal.com/sdk/js?client-id={{env('PAYPAL_CLIENT_ID')}}"></script>
	    <script>
	        paypal.Buttons({
	            locale: 'en_US',
	            style: {
	                size: 'responsive',
	                color: 'gold',
	                shape: 'pill',
	                label: 'checkout',
	            },

	            // Enable Pay Now checkout flow (optional)
	            commit: true,

	            // Set up a payment
	            createOrder: function (data, actions) {
	                return actions.order.create({
	                    purchase_units: [{
	                        amount: {
	                            value: '{{ $user->relationBetweenPackage->price }}',
	                            currency: 'USD'
	                        }
	                    }]
	                });
	            },
	           // Execute the payment
	            onApprove: function (data, actions) {
	                return actions.order.capture().then(function(details) {
	                    // Show a confirmation message to the buyer
	                    /*append data in input form*/
	                    $('#orderID').val(data.orderID);
	                    $('#payerID').val(data.payerID);
	                    $('#paymentID').val(data.paymentID)
	                    $('#paymentToken').val(data.paymentToken)
	                    $('#paypal-form').submit();
	                });
	            }
	        }).render('#paypal-button');

	    </script>
	@append
@endif