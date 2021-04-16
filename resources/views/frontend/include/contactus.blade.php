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
						<h2 class="section__title">Contact Us</h2>
						<span class="section-divider"></span>
				</div><!-- end section-heading -->
		</div><!-- end col-md-12 -->
	</div><!-- end row -->
	<div class="row">
		<div class="col-md-12">
			<section class="accordion-section clearfix mt-3" aria-label="Question Accordions">
				<div class="row align-items-stretch no-gutters contact-wrap">
					<div class="col-md-6">
						<div class="form h-100">
							<h3>Reach out To Us</h3>
							<form class="mb-5" method="post" id="contactForm" name="contactForm">
								<div class="row">
									<div class="col-md-12 form-group">
										<label for="" class="col-form-label">Name *</label>
										<input type="text" class="form-control" name="name" id="name" required placeholder="Your name">
									</div>
									<div class="col-md-12 form-group">
										<label for="" class="col-form-label">Email *</label>
										<input type="text" class="form-control" name="email" id="email" required  placeholder="Your email id">
									</div>
								
									<div class="col-md-12 form-group">
										<label for="" class="col-form-label">Mobile No.</label>
										<input type="text" class="form-control" name="phone" id="phone"  placeholder="Your mobile no.">
									</div>									
								</div>

								<div class="row">
									<div class="col-md-12 form-group">
										<label for="message" class="col-form-label">Message</label>
										<textarea class="form-control" name="message" id="message" cols="30" rows="4"  placeholder="Tell us about the courses you are intersted in."></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 form-group">
										<input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4">
										<span class="submitting"></span>
									</div>
								</div>
							</form>

							<div id="form-message-warning mt-4"></div> 
							<div id="form-message-success" style="display:none;">
								Your message was sent, thank you!
							</div>

						</div>
					</div>
				</div>
	 
			</section>
		</div>
	</div>
</div>