<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/png" sizes="16x16" href="{{ asset('assets/images/favicon.png') }}">
	<link href="{{ asset('dist/css/style.min.css') }}" rel="stylesheet">
	<title>Login - inventaris</title>
</head>

<body>
	<div class="main-wrapper">
		<div class="preloader">
			<div class="lds-ripple">
				<div class="lds-pos"></div>
				<div class="lds-pos"></div>
			</div>
		</div>
		<div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
			<div class="auth-box bg-dark border-top border-secondary">
				<div id="loginform">
					<div class="text-center p-t-20 p-b-20 mb-3">
						<span class="db">
							<img src="{{ asset('assets/images/inventory.png') }}" alt="logo" style="width: 80%;" />
						</span>
					</div>
					<!-- error -->
					@if (session()->has('error'))
						<div class="alert alert-danger alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong>{{ session('error') }} </strong>
						</div>
					@endif
					<!-- errorEnd -->

					<!-- Form -->
					<form class="form-horizontal m-t-20" action="{{ route('backend.login') }}" method="post">
						@csrf
						<div class="row p-b-30">
							<div class="col-12">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
									</div>
									<input type="text" name="email" class="form-control form-control-lg @error('email') is-invalid @enderror"
										placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" required value="{{ old('email') }}">
								</div>
								@error('email')
									<span class="invalid-feedback alert-danger" role="alert">
										{{ $message }}
									</span>
								@enderror

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
									</div>
									<input type="password" name="password" class="form-control @error('password') is-invalid @enderror"
										placeholder="Password" aria-label="Password" aria-describedby="basic-addon2" required>
								</div>
								@error('password')
									<span class="invalid-feedback alert-danger" role="alert">
										{{ $message }}
									</span>
								@enderror
							</div>
						</div>
						<div class="row border-top border-secondary">
							<div class="col-12">
								<div class="form-group">
									<div class="p-t-20">
										<button class="btn btn-info" id="to-recover" type="button"><i class="fa fa-lock m-r-5"></i> Lost
											password?</button>
										<button class="btn btn-success float-right" type="submit">Login</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="recoverform" style="display: none;"> <!-- Menyembunyikan recoverform awalnya -->
					<div class="text-center">
						<span class="text-white">Enter your e-mail address below and we will send you instructions how to recover a
							password.</span>
					</div>
					<div class="row m-t-20">
						<!-- Form -->
						<form class="col-12" action="index.html">
							<!-- email -->
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-danger text-white" id="basic-addon1"><i class="ti-email"></i></span>
								</div>
								<input type="text" class="form-control form-control-lg" placeholder="Email Address" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>
							<!-- pwd -->
							<div class="row m-t-20 p-t-20 border-top border-secondary">
								<div class="col-12">
									<a class="btn btn-success" href="#" id="to-login" name="action">Back To Login</a>
									<button type="submit" class="btn btn-info float-right" name="action">Recover</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="{{ asset('assets/libs/jquery/dist/jquery.min.js') }}"></script>
	<script src="{{ asset('assets/libs/popper.js/dist/umd/popper.min.js') }}"></script>
	<script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.min.js') }}"></script>

	<script>
		// Inisialisasi tooltip dan efek lainnya
		$('[data-toggle="tooltip"]').tooltip();
		$(".preloader").fadeOut();
		$('#to-recover').on("click", function() {
			$("#loginform").slideUp();
			$("#recoverform").fadeIn();
		});
		$('#to-login').click(function() {
			$("#recoverform").hide();
			$("#loginform").fadeIn();
		});
	</script>

</body>

</html>
