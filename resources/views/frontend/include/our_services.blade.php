@section('css')
	<style type="text/css">
		.our_services .card {
		    cursor: pointer;
		    margin: 5px;
		    margin-bottom: 30px;
		    margin-top: 0;
		    border: 0;
		}
		.our_services .card-body.hover,
		.our_services .card-body:hover {
		    box-shadow: 0 10px 20px rgba(0, 0, 0, .2)
		}
		.our_services .card-body {
			border: 1px solid #EEE;
			border-radius: 10px;
			min-height: 350px;
		}
		.our_services .card-content {
			border: none;
			padding: 0;
		}
		.our_services .img {
		    margin-bottom: 35px;
		    -webkit-filter: drop-shadow(5px 5px 3px #999);
		    filter: drop-shadow(5px 5px 3px #999);
		    width: 100px;
		}
		.our_services .card-title {
		    font-weight: 600;
		    margin-top: 0;
		    margin-bottom: 15px;
		    font-size: 130%;
		    color: rgba(8,0,134,0.7) !important;
		}
		.our_services .card-body img {
			margin-top: 0;
		}
		.our_services .card-body .card-subtitle {
			margin-top: 0;
			line-height: 22px;
			text-align: justify;
    		text-align-last: center;
    		font-size: 17px;
		}
		.our_services button.focus,
		.our_services button:focus {
		    outline: 0;
		    box-shadow: none !important
		}
		.our_services .ft {
		    margin-top: 0
		}
		.our_services .chk {
		    margin-bottom: 5px
		}
		.our_services .rck {
		    margin-top: 20px;
		    padding-bottom: 15px
		}
		.our_services .sub-title {
			margin-bottom: 40px;
		}
	</style>
@append

<div class='our_services container-fluid mx-auto mt-5 mb-5 col-12' style="text-align: center">
	<div class="section-heading">
        <h2 class="section__title">@translate(Why People Believe in Us?)</h2>
        <span class="section-divider"></span>
    </div><!-- end section-heading -->
    <p class="text-muted sub-title">
    	@translate(LanguaFina specializes in perfecting the art of the English language.)</small>
    </p>
    <div class="row" style="justify-content: center">
        <div class="card col-md-3 col-12">
            <div class="card-content">
                <div class="card-body"> <img class="img" src="{{ asset('frontend/images/our_services/one_on_one_serssions.svg') }}" />
                    <div class="shadow"></div>
                    <div class="card-title">@translate(One on One Sessions)</div>
                    <div class="card-subtitle">
                        <p> <small class="text-muted">Every class is designed specifically for you to overcome fears, build confidence and improve fluency.</small> </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card col-md-3 col-12">
            <div class="card-content">
                <div class="card-body"> <img class="img" src="{{ asset('frontend/images/our_services/tests.svg') }}" />
                    <div class="card-title">@translate(Practice Tests)</div>
                    <div class="card-subtitle">
                        <p> <small class="text-muted">Track your progress with regular practice tests and feedbacks to ease out the learning process.</small> </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card col-md-3 col-12">
            <div class="card-content">
                <div class="card-body"> <img class="img rck" src="{{ asset('frontend/images/our_services/extra_mat.svg') }}" />
                    <div class="card-title">@translate(Extra Learning Materials)</div>
                    <div class="card-subtitle">
                        <p> <small class="text-muted">Languafina provides its students with additional authentic and quality content apart from what is provided to them during their classes. We believe in self practice and promote that by provide extra learning materials.</small> </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card col-md-3 col-12">
            <div class="card-content">
                <div class="card-body"> <img class="img rck" src="{{ asset('frontend/images/our_services/extra-time.svg') }}" />
                    <div class="card-title">@translate(Flexible Hours)</div>
                    <div class="card-subtitle">
                        <p> <small class="text-muted">With us you can learn English at a time and pace that is as flexible and dynamic as per your schedule.</small> </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card col-md-3 col-12">
            <div class="card-content">
                <div class="card-body"> <img class="img rck" src="{{ asset('frontend/images/our_services/anywhere.svg') }}" />
                    <div class="card-title">@translate(Anytime Anywhere)</div>
                    <div class="card-subtitle">
                        <p> <small class="text-muted">The teaching methods at LANGUAFINA are customizable so you can access your personalized study program where you want, when you can.</small> </p>
                    </div>
                </div>
            </div>
        </div>
        <!--<div class="card col-md-3 col-12">
            <div class="card-content">
                <div class="card-body"> <img class="img rck" src="{{ asset('frontend/images/our_services/testimonials.svg') }}" />
                    <div class="card-title">@translate(Testimonials)</div>
                    <div class="card-subtitle">
                        <p> <small class="text-muted">Buying or selling a home is often the largest transaction anyone does in their life. we guide you through the process so that you can be confident in reaching your dream outcome.</small> </p>
                    </div>
                </div>
            </div>
        </div-->
    </div>
    {{-- <div class="ft">
        <p class="chk"><small class="text-muted">Still not sure?</small></p>
        <a href="#" class="theme-btn line-height-40 text-capitalize">Read All Testimonials</a>
    </div> --}}
</div>