<aside class="left-sidebar" data-sidebarbg="skin5">
	<div class="scroll-sidebar">
		<nav class="sidebar-nav">
			<ul id="sidebarnav" class="p-t-30">
				<li class="sidebar-item">
					<a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('backend.beranda') }}"
						aria-expanded="false">
						<i class="mdi mdi-view-dashboard"></i>
						<span class="hide-menu">Beranda</span></a>
				</li>
				<li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
						href="{{ route('backend.user.index') }}" aria-expanded="false"><i
							class="mdi mdi-account"></i><span class="hide-menu">User</span>
					</a>
				</li>
				<li class="sidebar-item">
					<a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('backend.supplier.index') }}" aria-expanded="false">
									<i class="mdi mdi-package-variant-closed"></i>
									<span class="hide-menu">Supplier</span>
					</a>
	</li>
	
				<li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-briefcase"></i><span
							class="hide-menu">Data Produk </span></a>
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item"><a href="{{ route('backend.kategori.index') }}" class="sidebar-link"><i
									class="mdi mdi-all-inclusive"></i><span class="hide-menu"> Kategori </span></a></li>
						<li class="sidebar-item"><a href="{{ route('backend.product.index') }}" class="sidebar-link"><i
									class="mdi mdi-all-inclusive"></i><span class="hide-menu"> Produk </span></a></li>
					</ul>
				</li>
				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
						aria-expanded="false">
						<i class="mdi mdi-receipt"></i>
						<span class="hide-menu">Laporan</span>
					</a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item">
							<a href="{{ route('backend.report.form-user') }}" class="sidebar-link">
								<i class="mdi mdi-chevron-right"></i>
								<span class="hide-menu">User</span>
							</a>
						</li>
						<li class="sidebar-item">
							<a href="{{ route('backend.report.form-product') }}" class="sidebar-link">
								<i class="mdi mdi-chevron-right"></i>
								<span class="hide-menu">Produk</span>
							</a>
						</li>
						<li class="sidebar-item">
							<a href="{{ route('backend.report.form-supplier') }}" class="sidebar-link">
								<i class="mdi mdi-chevron-right"></i>
								<span class="hide-menu">Supplier</span>
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</aside>