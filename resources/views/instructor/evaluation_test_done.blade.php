<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Evaluation test is done</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="{{ asset('vendor/evaluation_test/css/fontawesome-all.min.css')}}">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i">
  	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
</head>
<body style="background: #FAFAFA;">
	<nav class="navbar navbar-dark bg-dark" style="margin-bottom: 60px; padding: 15px; background: #EC7063 !important;">
		<div class="container">
			<span class="navbar-brand mb-0 h1" style="font-size: 24px">Languafina</span>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-3 text-center">
				<img class="mb-2" src="{{ asset('vendor/evaluation_test/images/checked.svg') }}" width="130px">
			</div>
			<div class="col-auto text-left">
				<h1 class="display-5 text-primary">
					You have done the evaluation test successfully<br>
				</h1>
				<h3 class="display-6 mt-3"><small>Thank you for your time</small></h3>
			</div>
		</div>
		<div class="row" style="margin-top: 100px; margin-bottom: 80px">
			<div class="col-3 text-center">
				<img class="mb-2" src="{{ asset('vendor/evaluation_test/images/message.svg') }}" width="200px" style="margin-top: -40px; margin-left: -30px">
			</div>
			<div class="col-auto text-left">
				<h1 class="display-5 text-primary">
					We'll send you a notification email.<br>
				</h1>
				<h3 class="display-6 mt-3"><small>Once the admin reviews your test and processed your result.</small></h3>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-12"><a href="{{ route('homepage') }}">Back to home page</a></div>
			<div class="col-12"><a href="{{ route('dashboard') }}">Dashboard</a></div>
		</div>
	</div>
</body>
</html>