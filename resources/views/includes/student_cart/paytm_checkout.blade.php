@if(env('PAYTM_MERCHANT_ID') != "" &&  env('PAYTM_MERCHANT_KEY') != "" &&  env('PAYTM_ACTIVE') != "NO" && paytmRouteForBlade())
	<div class="card-header" style="margin-bottom: -11px; padding: 0px 10px;">
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
						<span class="widget-title font-size-18 stripe-btn w-75 d-block text-center font-weight-bold m-auto"
							style="background: #EEE; border: 1px solid #666;">
								<img src="{{ filePath('paytm.png') }}" height="25px"
									width="80px" alt="Paytm">
						</span>
					</div>
				</div>
			</div>
		</a>
	</div>

	@section('js')
		<script>
			function paytmPay(){
				$('#payTmForm').submit();
			}
		</script>
	@append

@endif