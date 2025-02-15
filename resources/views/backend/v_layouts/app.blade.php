<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<link rel="icon" type="image/png" sizes="16x16" href="{{ asset('assets/images/favicon.png') }}">

	<link href="{{ asset('dist/css/style.min.css') }}" rel="stylesheet">
	<link href="{{ asset('assets/libs/flot/css/float-chart.css') }}" rel="stylesheet">

	<link href="{{ asset('assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css') }}" rel="stylesheet">

	<title>Dashboard - inventaris</title>
</head>

<body>

	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper">
		<header class="topbar" data-navbarbg="skin5">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin5">
					<a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
							class="ti-menu ti-close"></i></a>
					<a class="navbar-brand" href="index.html">
						<b class="logo-icon p-l-10">
							<img src="{{ asset('assets/images/logo-icon.png') }}" alt="homepage" class="light-logo" />
						</b>
						<span class="logo-text">
							<text>Inventaris</text>
							{{-- <img src="{{ asset('assets/images/toko-kue.png') }}" alt="homepage"
								class="light-logo" /> --}}
						</span>
					</a>
					<a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
						data-toggle="collapse" data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
							class="ti-more"></i></a>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
					<ul class="navbar-nav float-left mr-auto">
						<li class="nav-item d-none d-md-block"><a
								class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)"
								data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
						{{-- <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="d-none d-md-block">Create New
									<i class="fa fa-angle-down"></i></span>
								<span class="d-block d-md-none"><i class="fa fa-plus"></i></span>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a>
								<a class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</li> --}}
						{{-- <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark"
								href="javascript:void(0)"><i class="ti-search"></i></a>
							<form class="app-search position-absolute">
								<input type="text" class="form-control" placeholder="Search &amp; enter"> <a
									class="srh-btn"><i class="ti-close"></i></a>
							</form>
						</li> --}}
					</ul>
					<ul class="navbar-nav float-right">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a>
								<a class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle waves-effect waves-dark" href="" id="2"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
									class="font-24 mdi mdi-comment-processing"></i>
							</a>
							{{-- <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown"
								aria-labelledby="2">
								<ul class="list-style-none">
									<li>
										<div class="">
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-success btn-circle"><i
															class="ti-calendar"></i></span>
													<div class="m-l-10">
														<h5 class="m-b-0">Event today</h5>
														<span class="mail-desc">Just a reminder that event</span>
													</div>
												</div>
											</a>
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-info btn-circle"><i
															class="ti-settings"></i></span>
													<div class="m-l-10">
														<h5 class="m-b-0">Settings</h5>
														<span class="mail-desc">You can customize this template</span>
													</div>
												</div>
											</a>
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-primary btn-circle"><i
															class="ti-user"></i></span>
													<div class="m-l-10">
														<h5 class="m-b-0">Pavan kumar</h5>
														<span class="mail-desc">Just see the my admin!</span>
													</div>
												</div>
											</a>
											<a href="javascript:void(0)" class="link border-top">
												<div class="d-flex no-block align-items-center p-10">
													<span class="btn btn-danger btn-circle"><i
															class="fa fa-link"></i></span>
													<div class="m-l-10">
														<h5 class="m-b-0">Luanch Admin</h5>
														<span class="mail-desc">Just see the my new admin!</span>
													</div>
												</div>
											</a>
										</div>
									</li>
								</ul>
							</div> --}}
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href=""
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
									src="{{ asset('assets/images/users/1.jpg') }}" alt="user" class="rounded-circle"
									width="31"></a>
							<div class="dropdown-menu dropdown-menu-right user-dd animated">
								<a class="dropdown-item" href="javascript:void(0)"><i class="ti-user m-r-5 m-l-5"></i>
									My Profile</a>
								<a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i>
									My Balance</a>
								<a class="dropdown-item" href="javascript:void(0)"><i class="ti-email m-r-5 m-l-5"></i>
									Inbox</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="javascript:void(0)"><i
										class="ti-settings m-r-5 m-l-5"></i> Account
									Setting</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href=""
									onclick="event.preventDefault(); document.getElementById('keluar-app').submit()"><i
										class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
								<div class="dropdown-divider"></div>
								{{-- <div class="p-l-30 p-10"><a href="javascript:void(0)"
										class="btn btn-sm btn-success btn-rounded">View
										Profile</a></div> --}}
							</div>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		@include('backend.v_layouts.sidebar')
		@yield('content')
	</div>

	<form id="keluar-app" action="{{ route('backend.logout') }}" method="POST" class="d-none">
		@csrf
	</form>


	<script src="{{ asset('assets/libs/jquery/dist/jquery.min.js') }}"></script>
	<script src="{{ asset('assets/libs/popper.js/dist/umd/popper.min.js') }}"></script>
	<script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.min.js') }}"></script>
	<script src="{{ asset('assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js') }}"></script>
	<script src="{{ asset('assets/extra-libs/sparkline/sparkline.js') }}"></script>
	<script src="{{ asset('dist/js/waves.js') }}"></script>
	<script src="{{ asset('dist/js/sidebarmenu.js') }}"></script>
	<script src="{{ asset('dist/js/custom.min.js') }}"></script>
	<script src="{{ asset('assets/libs/flot/excanvas.js') }}"></script>
	<script src="{{ asset('assets/libs/flot/jquery.flot.js') }}"></script>
	<script src="{{ asset('assets/libs/flot/jquery.flot.pie.js') }}"></script>
	<script src="{{ asset('assets/libs/flot/jquery.flot.time.js') }}"></script>
	<script src="{{ asset('assets/libs/flot/jquery.flot.stack.js') }}"></script>
	<script src="{{ asset('assets/libs/flot/jquery.flot.crosshair.js') }}"></script>
	<script src="{{ asset('assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js') }}"></script>
	<script src="{{ asset('dist/js/pages/chart/chart-page-init.js') }}"></script>

	{{-- <script src="{{ asset('assets/extra-libs/multicheck/datatable-checkbox-init.js') }}"></script>
	<script src="{{ asset('assets/extra-libs/multicheck/jquery.multicheck.js') }}"></script> --}}

	<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
	<script>
		const editorElement = document.querySelector('#ckeditor');
    if (editorElement) {
        ClassicEditor.create(editorElement)
            .catch(error => {
                console.error(error);
            });
    } else {
        console.warn('Editor element not found. Skipping CKEditor initialization.');
    }
	</script>

	</script>
	<script src="{{ asset('assets/extra-libs/DataTables/datatables.min.js') }}"></script>
	<script>
		$('#zero_config').DataTable();
	</script>

	<script src="{{ asset('sweetalert/sweetalert2.all.min.js') }}"></script>


	@if (session('succes'))
	<script>
		Swal.fire({
				icon: 'succes',
				title: 'Berhasil',
				text: "{{ session('suces') }}"
			})
	</script>
	@endif
	<script type="text/javascript">
		$('.show_confirm').click(function(event) {
			var form = $(this).closest("form");
			var konfdelete = $(this).data("konf-delete");
			event.preventDefault();
			Swal.fire({
				title: 'Konfirmasi Hapus Data?',
				html: "Data yang dihapus <strong>" + konfdelete + "</strong> tidak dapat dikembalikan!",

				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Ya, dihapus',
				cancelButtonText: 'Batal'
			}).then((result) => {
				if (result.isConfirmed) {
					Swal.fire('Terhapus!', 'Data berhasil dihapus.', 'success')
						.then(() => {
							form.submit();
						});
				}
			});
		});

		function previewFoto(inputSelector, previewSelector, defaultImage) {
    const foto = document.querySelector(inputSelector || 'input[name="foto"]');
    const fotoPreview = document.getElementById(previewSelector || 'fotoPreview');

    if (foto.files && foto.files[0]) {
        const fotoReader = new FileReader();
        fotoReader.readAsDataURL(foto.files[0]);
        fotoReader.onload = function(fotoEvent) {
            fotoPreview.src = fotoEvent.target.result;
        }
    } else {
								fotoPreview.src = defaultImage || "{{ asset('img-user/img-default.jpg') }}";
    }
	}

function confirmSubmit(event, title, text, icon, confirmText, cancelText, successText) {
    event.preventDefault(); 

    Swal.fire({
        title: title || 'Apakah Anda yakin?',
        text: text || 'Data akan disimpan!',
        icon: icon || 'warning',
        showCancelButton: true,
        confirmButtonText: confirmText || 'Ya',
        cancelButtonText: cancelText || 'Batal',
    }).then((result) => {
        if (result.isConfirmed) {
												Swal.fire('Tersimpan!', successText, 'success')
            document.getElementById('submitForm').submit(); 
        }
    });
}

document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.toggle-details');

    buttons.forEach(button => {
        button.addEventListener('click', function () {
            const productId = this.getAttribute('data-id');
            const details = document.getElementById('details-' + productId);
            const fullDetails = document.getElementById('full-details-' + productId);
            
            if (fullDetails.style.display === 'none') {
                fullDetails.style.display = 'inline';
                details.style.display = 'none';
                this.textContent = 'Less'; 
            } else {
                fullDetails.style.display = 'none';
                details.style.display = 'inline';
                this.textContent = 'More'; 
            }
        });
    });
});
	</script>
</body>

</html>