@section('css')
	<style type="text/css">
		.accordion-section .panel-default > .panel-heading {
		    border: 0;
		    background: #f4f4f4;
		    padding: 0;
		    border-radius: 6px;
		}
		.accordion-section .panel-default .panel-title {
			margin-right: 38px;
		}
		.accordion-section .panel-default .panel-title a {
		    display: block;
		    line-height: 33px;
		    font-style: italic;
		    font-size: 23px;
		    color: #233d63 !important;
		}
		.accordion-section .panel-default .panel-title a:after {
		    font-family: 'FontAwesome';
		    font-style: normal;
		    font-size: 28px;
		    content: "\f068";
		    color: #1f7de2;
		    position: absolute;
		    right: 31px;
		    top: 18px;
		}
		.accordion-section .panel-default .panel-title a.collapsed:after {
		    content: "\f067";
		    color: #233d63 !important;
		}
		.accordion-section .panel-default .panel-body {
		    font-size: 1.2rem;
		}
		.accordion-section .badge-type {
			margin-bottom: 20px;
		    font-size: 20px;
		    margin-top: -18px;
		    display: table;
		    box-shadow: 1px 1px 2px #AAA;
		    padding: 10px 30px;
		    color: #2d2d2d;
		}
	</style>
@append


<div id="carouselHomePageMid1Indicators" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
			<li data-target="#carouselHomePageMid1Indicators" data-slide-to="0" class="active"></li>
	</ol>
	<div class="carousel-inner" role="listbox">
		<div class="carousel-item active" style="background-image: url('{{ filePath('best_online_learning.jpg') }}')">
			<div class="carousel-caption d-none d-md-block">
				<!--<span class="display-4 main-title custom_span_class">About Us</span>-->
			</div>
			</div>
	</div>
</div>
<div class="container margin-bottom-70px">

	<div class="row">
		<div class="col-lg-12">
				<div class="section-heading">
						<h2 class="section__title">About Us</h2>
						<span class="section-divider"></span>
				</div><!-- end section-heading -->
		</div><!-- end col-md-12 -->
	</div><!-- end row -->
	<div class="row">
		<div class="col-md-12">
		<section class="accordion-section clearfix mt-3" aria-label="Question Accordions">
		<p>LanguaFina specializes in perfecting the art of the English language.</p>
			<p>We, as language experts with a proven track record in imparting skill-based trainings, provide the necessary means to achieve the desired command over the language. Furthermore, enhancement of flow, vocabulary, pronunciation, and confidence in making use of English in every possible way is what we focus on. </p>
		</section>
		</div>
	</div>
</div>