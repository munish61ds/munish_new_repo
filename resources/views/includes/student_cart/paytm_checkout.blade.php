@if(env('PAYTM_MERCHANT_ID') != "" &&  env('PAYTM_MERCHANT_KEY') != "" &&  env('PAYTM_ACTIVE') != "NO" && paytmRouteForBlade())
{{--PAYTM--}}

<form action="{{ route('paytm.payment') }}" method="POST" id="payTmForm">
    @csrf
    @if(Session::has('coupon'))
        <input type="hidden" name="amount" value="{{ PaytmPrice($total_price - couponDiscountPrice($coupon)) }}">
    @else
        <input type="hidden" name="amount" value="{{ PaytmPrice($total_price) }}">
    @endif
</form>

<a href="javascript:void()" title="Pay via PayTM" onclick="paytmPay()">
	<div class="card border-bottom-0 paytm-top">
		<div class="card-header">
			<div class="checkout-item d-flex align-items-center justify-content-between">
				<span class="widget-title font-size-18 stripe-btn w-75 d-block text-center font-weight-bold m-auto">
						<img src="{{ filePath('paytm.png') }}" height="25px"
							width="80px" alt="Paytm">
				</span>
			</div>
		</div>
	</div>
</a>

@section('js')
	<script>
		function paytmPay(){
			$('#payTmForm').submit();
		}
	</script>
@append

{{--PAYTM ends--}}
@endif