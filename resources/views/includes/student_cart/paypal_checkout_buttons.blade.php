@if(env('PAYPAL_CLIENT_ID') != null && !empty(env('PAYPAL_CLIENT_ID')))
	<div id="paypal-button" class="card-header w-75"></div>

	<form id="paypal-form" method="post" action="{{route('paypal.paymnet')}}" class="invisible">
	    @csrf
	    <input type="hidden" name="orderID" id="orderID">
	    <input type="hidden" name="payerID" id="payerID">
	    <input type="hidden" name="paymentID" id="paymentID">
	    <input type="hidden" name="paymentToken" id="paymentToken">
	    @if(Session::has('coupon'))
	        <input type="hidden" value="{{PaypalPrice($total_price- couponDiscountPrice($coupon))}}" name="amount" id="amount">
	    @else
	        <input type="hidden" value="{{PaypalPrice($total_price)}}" name="amount" id="amount">
	    @endif
	</form>

	@section('js')
		<script src="https://www.paypal.com/sdk/js?client-id={{env('PAYPAL_CLIENT_ID')}}"></script>
	    <script type="text/javascript">
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
	                            @if(Session::has('coupon'))
	                            value: '{{ $total_price  - couponDiscountPrice($coupon) }}',
	                            @else
	                            value: '{{ $total_price }}',
	                            @endif
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