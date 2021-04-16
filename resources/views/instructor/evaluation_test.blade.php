<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Instructor evaluation test</title>
  	<link rel="stylesheet preload" as="style" type="text/css" href="{{ asset('vendor/evaluation_test/css/bootstrap.min.css')}}">
  	<link rel="stylesheet preload" as="style" href="{{ asset('vendor/evaluation_test/css/css1.css')}}">
  	<link rel="stylesheet preload" as="style" href="{{ asset('vendor/evaluation_test/css/css2.css')}}">
  	<link rel="stylesheet preload" as="style" href="{{ asset('vendor/evaluation_test/css/css3.css')}}">
	<link rel="stylesheet preload" as="style" href="{{ asset('vendor/evaluation_test/css/css4.css')}}">
  	<link rel="stylesheet preload" as="style" href="{{ asset('vendor/evaluation_test/css/css5.css')}}">
	<link rel="stylesheet preload" as="style" type="text/css" href="{{ asset('vendor/evaluation_test/css/responsive3.css')}}" id="responsive3">
	<link rel="stylesheet preload" as="style" type="text/css" href="{{ asset('vendor/evaluation_test/css/responsive2.css')}}" id="responsive2">
	<link rel="stylesheet preload" as="style" type="text/css" href="{{ asset('vendor/evaluation_test/css/responsive1.css')}}" id="responsive1">
	<link rel="stylesheet preload" as="style" type="text/css" href="{{ asset('vendor/evaluation_test/css/responsive0.css')}}" id="responsive0">
	<link rel="stylesheet preload" as="style" type="text/css" href="{{ asset('vendor/evaluation_test/css/cmq.styles.min.css')}}" id="styles">
	<link rel="stylesheet preload" as="style" type="text/css" href="{{ asset('vendor/evaluation_test/css/mediaquiery_min.css')}}" id="mediaquiery_min">
	<link rel="dns-prefetch" href="http://fonts.googleapis.com">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i">
  	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
	<link rel="stylesheet" type="text/css" href="{{ asset('vendor/evaluation_test/css/fontawesome-all.min.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('vendor/evaluation_test/css/component.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('vendor/evaluation_test/css/lightbox.min.css')}}">
	<link rel="stylesheet" type="text/css" href="{{ asset('vendor/evaluation_test/css/viewbox.css')}}">
	<link rel="stylesheet preload" as="style"  type="text/css" href="{{ asset('vendor/evaluation_test/css/animate.css')}}">

	<style type="text/css">
		.training_page {
			padding-top: 30px !important;
		}
		.about_bg {
			padding: 35px !important;
		}
	</style>
</head>
<body>

	 <div id="nav-icon" class="menu-button visible-xs">
	   <span class="burger-icon"></span>
	 </div>  <!-- header part close-->
	   <section class="container-fluid about_bg">
	   <div class="container">
	     <div class="row">
	       <div class="col-md-6 col-sm-12 col-xs-12 interview padding_left1">
	         <h1 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.3s">
	           Languafina Instructor Evaluation Test</h1>
	       </div>
	       <div class="col-md-6 col-sm-12 col-xs-12 text-right padding_zero wow fadeInRight" data-wow-duration="1s"
	         data-wow-delay="0.3s">
	         <a href="{{ url('/') }}" title="Home page">
	           <p>Home page
	         </a></p>
	       </div>
	     </div>
	   </div>
	 </section>
	 <!-- first section part end -->
	 <!-- second section part first -->
	 <section class="container-fluid training_page quiz-part-mobile">
	   <div class="container">
	     <div class="row">
	       <!-- Mobile Respomsive Menu start -->
	       <!-- End -->
	       <div class="col-md-8 col-sm-8 col-lg-9 col-xs-12 auto-mx padding_right1 padding_left1 remove_padding_mobile">  <ul class="workshop_page_ul right-side" style="list-style: none;">
	           <div class="col-md-12 col-sm-12 col-xs-12 heading-html padding_zero">
	             <img src="{{ asset('vendor/evaluation_test/images/check-list.svg')}}" alt="" class="img-responsive wow fadeInLeft" data-wow-duration="1s"
	               data-wow-delay="0.3s">
	             <h1>General Evaluation Quiz</h1>
	           </div>
	           <div class="clearfix"></div>
	           <li class="workshop_page_li" id="workshop_page_li_li_id" style="border:none;margin-top: -30px;">
	             <ul style="border:0px #000000 solid;margin: 0px;padding: 0;">
	               <div id="leveldiv" style="border: 0px red solid; margin-top: 3	0px;">
	                 <div id="beg online">
	                   <div class="on_test programring"><span class="programring">Online Test ::
	                     </span>Instructors Test</div>
	                   <div class="prgm_test">  <div id="clickme">
	                       <div class="test_box">
	                         <div class="no_q number"> Number of questions : {{ $questions_count }} | Time : {{ $time }} minutes </div>
	                       </div>
	                     </div>
	                   </div>
	                 </div>
	                 <div id="rndbox">
	                   <div id="quesbox">
	                     <div class="col-md-12 col-sm-12 col-xs-12 instruc padding_zero wow fadeInDown"
	                       data-wow-duration="1s" data-wow-delay="0.3s">Instruction:</div>
	                     <div class="col-md-12 col-xs-12 col-sm-12 total-ques padding_zero wow fadeInLeft"
	                       data-wow-duration="1s" data-wow-delay="0.3s ">Total Number of Questions:
	                       <span>{{ $questions_count }}</span>
	                     </div>
	                     <div class="col-md-12 col-xs-12 col-sm-12 total-ques2 padding_zero wow fadeInLeft"
	                       data-wow-duration="1s" data-wow-delay="0.3s">Time alloted: <span>{{ $time }} minutes</span></div>
	                     <div class="col-md-12 col-xs-12 col-sm-12 each-div padding_zero wow fadeInLeft"
	                       data-wow-duration="1s" data-wow-delay="0.3s">Each question carry 1 mark each, no negative marking
	                     </div>
	                     <div class="clearfix"></div>
	                   </div>
	                 </div>
	                 <form method="post" action="{{ route('instructor.evaluation_test_post') }}" id="form_submit">
	                 	@csrf
	                   <div id="showquesbox" class="showquesbox_classs" style="display: none;">
	                     <div class="col-md-12 col-sm-12 col-xs-12 padding_zero time-details">
	                       <div class="col-md-6 col-xs-12 text-left padding_zero">
	                         <div class="ques-mark"><img src="{{ asset('vendor/evaluation_test/images/ques.png')}}" alt="" class="img-responsive"></div>
	                         <div class="ques-limite ">
	                           <div id="total_question_views_new" style="float: left; padding-right: 5px;">1</div> of {{ $questions_count }} </div>
	                       </div>
	                       <div class="col-md-6 col-sm-6 col-xs-12 text-right padding_zero watch_time">
	                         <img src="{{ asset('vendor/evaluation_test/images/watch.png')}}" alt="" class="img-responsive "
	                           style="float: left; margin-left: 60%;">
	                         <div id="my_div1" align="right" style="float: left;" class="ques-limite"></div>
	                       </div>
	                       <div class="clearfix"></div>
	                     </div>
	                     <div class="clearfix"></div>
	                     @foreach($questions as $question)
		                     <div class="questions" id="ques{{ $question['id'] }}" style="display:none">
		                       	<div id="questions">
		                        	<div class="questionnumber open-div">{{ $question['content'] }}</div>
			                    </div>
								<div class="answer row">
									@foreach($question['answers'] as $answer_id => $answer_content)
										<div class="col-md-6 col-sm-12 col-xs-12">
											<div class="a_ans">
												<div class="radiobtn">
											   		<input type="radio" id="ans_{{ $answer_id }}_{{ $question['id'] }}" name="ans[{{ $question['id'] }}]" value="{{ $answer_id }}" />
											   		<label for="ans_{{ $answer_id }}_{{ $question['id'] }}">
											     		<div class="pull-left pp">
											     			@switch($answer_id)
											     				@case(0) <span>A</span> @break
											     				@case(1) <span>B</span> @break
											     				@case(2) <span>C</span> @break
											     				@case(3) <span>D</span> @break
											     				@case(4) <span>E</span> @break
											     				@case(5) <span>F</span> @break
											     			@endswitch
											     		</div>{{ $answer_content }}
											 		</label>
												</div>
											</div>
										</div>
									@endforeach
								</div>
		                       <div style="clear:both;"></div>
		                     </div>
	                     @endforeach
	                    <div id="nextprev">
	                       <div class="submit_test">
	                         <input type="submit" name="endtest" title="Submit" value="SUBMIT TEST" class="start"
	                           style=" border-radius:3px;" id="endtest" onclick="return confirmsubmit()">
	                       </div>
	                       <div class="prev_quiz">
	                         <input type="button" name="next" title="Prev" id="prev" onclick="nextquestion(2)"
	                           value="« Prev" class="nextbtn" style="margin-right:10px;margin-top: 19px;">
	                       </div>
	                       <div class="next_quiz">
	                         <input type="button" name="next" title="Next" id="next" onclick="nextquestion(1)"
	                           value="Next »" class="nextbtn" style="margin-top: 19px;">
	                       </div>
	                       <div class="clearfix"></div>
	                     </div>
	                     <input type="hidden" id="current_show_ques" value="0">
	                     <input type="hidden" id="total_question" value="{{ $questions_count }}">
	                   </div>
	                 </form>
	               </div>
	             </ul>
	           </li>
	         </ul>
	         <div>
	           <input type="button" name="start" value="START TEST" class=" test" id="starttest"
	             onclick="starttimer('{{ $time * 60 }}')">
	         </div>
	         <!-- <button class="test "><a href="quiz_html_test.php" title="Start Test">Start Test</button></a>
	               -->
	         <div class="col-sm-12 col-xs-12 col-md-12 note padding_zero wow fadeInLeft" data-wow-duration="1s"
	           data-wow-delay="0.3s">Note:</div>
	         <div class="clearfix"></div>
	         <div class="praaa padding_zero wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.3s">
	           <p>Click the 'Submit Test' button given in the bottom of this page to Submit your answers.<br> Test will be
	             submitted after time is Expired.<br> Do not refresh the Page. </p>
	         </div>
	       </div>
	       <div class="right_panel">  </div>
	       <div style="clear:both;"></div>      </div>
	   </div>

	   </div>
	   </div>
	   </div>
	 </section>


	<footer class="container-fluid ten_section">
	<div class="container">
	<div class="last_div wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s">
	  <div class="footer_logo"><a href="#" title="wscube_logo">
	      <img src="{{ filePath(getSystemSetting('type_logo')->value) }}" class="lazy" height="80px" />
	    </a>
	  </div>
	  <p>WsCube Tech has an expanded client-base in 15+ countries and a proven track record of delivering more than 800+
	    projects around the world, which makes us one of the leading providers of IT services. Our extensive range of
	    services involves Web designing, Web Development, Android and iPhone Development, SEO, and Domain Hosting. </p>
	</div>
	<div class="all_rights">All rights reserved by <span> <a href="#"
	      title=" WsCube Tech"> Languafina.com </a></span></div>
	</div>
	</footer>

	<script src="{{ asset('vendor/evaluation_test/js/jquery-3.2.1.min.js')}}"></script>
	<script src="{{ asset('vendor/evaluation_test/js/bootstrap.min.js')}}"></script>
	<script src="{{ asset('vendor/evaluation_test/js/scripts.js')}}"></script>

	<script type="text/javascript">
		function divhide() {
			document.getElementById('rndbox').style.display = "block";
			$("#beg").slideUp("6000");
		}

		function starttimer(seconds) {
			document.getElementById('showquesbox').style.display = "block";
			$("#rndbox").slideUp("6000");
			countDown('my_div1', '<div>TIME OVER</div>', seconds);
			document.getElementById('starttest').disabled = "disabled";
			document.getElementById('starttest').style.display = "none";
		}

		function countDown(elID, output, seconds) {
			var elem = document.getElementById(elID),
			start = new Date().getTime(),
			end = start + seconds * 1000,
			timer = setInterval(function() {
			var now = new Date().getTime(),
			 timeleft = end - now,
			 timeparts;
			if (timeleft < 0) {
			 elem.innerHTML = output;
			 $('#form_submit').submit();
			 document.getElementById('nextprev').style.display = "none";
			 document.getElementById('endtest').style.display = "block";
			 $('input[type=radio]').attr('disabled', 'disabled');
			 // document.getElementsByTagName('input').type.radio.disabled = "disabled";
			 clearInterval(timer);
			} else {
			 timeparts = [Math.floor(timeleft / 60000), Math.floor(timeleft / 1000) % 60];
			 if (timeparts[1] < 10) timeparts[1] = "0" + timeparts[1];
			 elem.innerHTML = "Time left: " + timeparts[0] + ":" + timeparts[1];
			}
			}, 250); // the lower this number, the more accurate the timer. 250 recommended
		}

		function confirmsubmit() {
		 if (confirm("Are You Sure to Submit The Evaluation Test?")) {
		   return true;
		 }
		 return false;
		}

		function nextquestion(action) {
		 current = document.getElementById("current_show_ques").value;
		 total = document.getElementById('total_question').value;
		 if (current > 0) {
		   document.getElementById("ques" + current).style.display = "none";
		 }
		 if (action == 1) {
		   //1 = next action
		   current = parseInt(current) + 1;
		   //   alert(current);
		   //	$('#total_question_views').html(current);
		 } else {
		   //2 = Previous action
		   current = parseInt(current) - 1;
		   //	$('#total_question_views').html(current);
		 }
		 if (current == 0) {
		   current = 1;
		 }
		 if (current > total) {
		   current = total;
		 }
		 if (current != 1) {
		   $('#total_question_views_new').html(current);
		 }
		 document.getElementById("ques" + current).style.display = "block";
		 document.getElementById("current_show_ques").value = current;
		}

	   	nextquestion(1);
	</script>
	<script type="text/javascript">
		function switchCSS(windowsize) {
		  if (windowsize > 992) {
		    $("#switchable").attr("href", "web.html");
		  } else {
		    $("#mediaquiery_min").attr("href", "{{ asset('vendor/evaluation_test/css/mediaquiery_min.css')}}");
		    $("#responsive3").attr("href", "{{ asset('vendor/evaluation_test/css/responsive3.css')}}");
		    $("#responsive2").attr("href", "{{ asset('vendor/evaluation_test/css/responsive2.css')}}");
		    $("#responsive1").attr("href", "{{ asset('vendor/evaluation_test/css/responsive1.css')}}");
		    $("#responsive0").attr("href", "{{ asset('vendor/evaluation_test/css/responsive0.css')}}");
		    $("#styles").attr("href", "{{ asset('vendor/evaluation_test/css/cmq.styles.min.css')}}");
		  }
		}
		$(document).ready(function() {
		  switchCSS($(this).width());

		  $(window).resize(function() {
		    switchCSS($(this).width());
		  });
		});
	</script>
</body>

</html>
