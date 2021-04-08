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

@php
	$general_faqs = [];
	$spoken_english_faqs = [];
	$ielts_pte_toefl_faqs = [];
	foreach ($faqs as $faq) {
		if($faq->type == 'general') {
			$general_faqs[] = $faq;
		} else if($faq->type == 'spoken_english') {
			$spoken_english_faqs[] = $faq;
		} else if($faq->type == 'ielts_pte_toefl') {
			$ielts_pte_toefl_faqs[] = $faq;
		}
	}
	$counter = 1;
@endphp

<div class="container margin-bottom-70px">
	<div class="row">
        <div class="col-lg-12">
            <div class="section-heading">
                <h2 class="section__title">Frequently Asked Questions</h2>
                <span class="section-divider"></span>
            </div><!-- end section-heading -->
        </div><!-- end col-md-12 -->
    </div><!-- end row -->
    <div class="row">
    	<div class="col-md-12">
			<section class="accordion-section clearfix mt-3" aria-label="Question Accordions">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					@php
						$q1 = count($general_faqs);
						$col1 = array_slice($general_faqs, 0, intval($q1 / 2), true);
						$col2 = array_diff_key($general_faqs, $col1);
					@endphp
					<span class="badge badge-light badge-type">General</span>
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								@foreach($col1 as $i => $faq)
								<div class="col-md-12">
									<div class="panel panel-default">
									  	<div class="panel-heading p-3 mb-3" role="tab" id="heading0">
											<h3 class="panel-title">
											  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse{{ $i . $counter }}" aria-expanded="true" aria-controls="collapse{{ $i . $counter }}">
												{{ $faq->question }}
											  </a>
											</h3>
									  	</div>
									  	<div id="collapse{{ $i . $counter }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading0">
											<div class="panel-body px-3 mb-4">
											  <p>{{ $faq->answer }}</p>
											</div>
										  </div>
									</div>
								</div>
								@php
									$counter++
								@endphp
								@endforeach
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								@foreach($col2 as $i => $faq)
								<div class="col-md-12">
									<div class="panel panel-default">
									  	<div class="panel-heading p-3 mb-3" role="tab" id="heading0">
											<h3 class="panel-title">
											  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse{{ $i . $counter }}" aria-expanded="true" aria-controls="collapse{{ $i . $counter }}">
												{{ $faq->question }}
											  </a>
											</h3>
									  	</div>
									  	<div id="collapse{{ $i . $counter }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading0">
											<div class="panel-body px-3 mb-4">
											  <p>{{ $faq->answer }}</p>
											</div>
										  </div>
									</div>
								</div>
								@php
									$counter++
								@endphp
								@endforeach
							</div>
						</div>
					</div>
					<br><br>

					@php
						$q1 = count($spoken_english_faqs);
						$col1 = array_slice($spoken_english_faqs, 0, intval($q1 / 2), true);
						$col2 = array_diff_key($spoken_english_faqs, $col1);
					@endphp
					<span class="badge badge-light badge-type">Spoken English</span>
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								@foreach($col1 as $i => $faq)
								<div class="col-md-12">
									<div class="panel panel-default">
									  	<div class="panel-heading p-3 mb-3" role="tab" id="heading0">
											<h3 class="panel-title">
											  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse{{ $i . $counter }}" aria-expanded="true" aria-controls="collapse{{ $i . $counter }}">
												{{ $faq->question }}
											  </a>
											</h3>
									  	</div>
									  	<div id="collapse{{ $i . $counter }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading0">
											<div class="panel-body px-3 mb-4">
											  <p>{{ $faq->answer }}</p>
											</div>
										  </div>
									</div>
								</div>
								@php
									$counter++
								@endphp
								@endforeach
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								@foreach($col2 as $i => $faq)
								<div class="col-md-12">
									<div class="panel panel-default">
									  	<div class="panel-heading p-3 mb-3" role="tab" id="heading0">
											<h3 class="panel-title">
											  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse{{ $i . $counter }}" aria-expanded="true" aria-controls="collapse{{ $i . $counter }}">
												{{ $faq->question }}
											  </a>
											</h3>
									  	</div>
									  	<div id="collapse{{ $i . $counter }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading0">
											<div class="panel-body px-3 mb-4">
											  <p>{{ $faq->answer }}</p>
											</div>
										  </div>
									</div>
								</div>
								@php
									$counter++
								@endphp
								@endforeach
							</div>
						</div>
					</div>
					<br><br>

					@php
						$q1 = count($ielts_pte_toefl_faqs);
						$col1 = array_slice($ielts_pte_toefl_faqs, 0, intval($q1 / 2), true);
						$col2 = array_diff_key($ielts_pte_toefl_faqs, $col1);
					@endphp
					<span class="badge badge-light badge-type">IELTS PTE TOEFL</span>
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								@foreach($col1 as $i => $faq)
								<div class="col-md-12">
									<div class="panel panel-default">
									  	<div class="panel-heading p-3 mb-3" role="tab" id="heading0">
											<h3 class="panel-title">
											  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse{{ $i . $counter }}" aria-expanded="true" aria-controls="collapse{{ $i . $counter }}">
												{{ $faq->question }}
											  </a>
											</h3>
									  	</div>
									  	<div id="collapse{{ $i . $counter }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading0">
											<div class="panel-body px-3 mb-4">
											  <p>{{ $faq->answer }}</p>
											</div>
										  </div>
									</div>
								</div>
								@php
									$counter++
								@endphp
								@endforeach
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								@foreach($col2 as $i => $faq)
								<div class="col-md-12">
									<div class="panel panel-default">
									  	<div class="panel-heading p-3 mb-3" role="tab" id="heading0">
											<h3 class="panel-title">
											  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse{{ $i . $counter }}" aria-expanded="true" aria-controls="collapse{{ $i . $counter }}">
												{{ $faq->question }}
											  </a>
											</h3>
									  	</div>
									  	<div id="collapse{{ $i . $counter }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading0">
											<div class="panel-body px-3 mb-4">
											  <p>{{ $faq->answer }}</p>
											</div>
										  </div>
									</div>
								</div>
								@php
									$counter++
								@endphp
								@endforeach
							</div>
						</div>
					</div>
				</div>
			</section>
    	</div>
    </div>
</div>