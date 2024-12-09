@extends('backend.v_layouts.app')

@section('content')
	<div class="page-wrapper">
		<div class="container-fluid">
			<a href="{{ route('backend.user.create') }}">
				<button type="button" class="btn btn-primary mb-3"><i class="fas fa-plus"></i>
					Tambah</button>
			</a>
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">{{ $judul }}</h5>
					<div class="table-responsive">
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>No</th>
									<th>Name</th>
									<th>Email</th>
									<th>Handphone</th>
									<th>Role</th>
									<th>Created At</th>
									<th>Updated At</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								@forelse ($data as $row)
									<tr>
										<td>{{ $loop->iteration }}</td>
										<td>{{ $row['name'] }}</td>
										<td>{{ $row['email'] }}</td>
										<td>{{ $row['handphone'] }}</td>
										<td>
											<span
												class="badge badge-pill {{ $row['role'] === 'Super Admin' ? 'badge-success' : 'badge-primary' }} float-right">
												{{ $row['role'] }}
											</span>
										</td>
										<td>{{ $row['created_at'] }}</td>
										<td>{{ $row['updated_at'] }}</td>
										<td>
											<span
												class="badge badge-pill {{ $row['status'] == 'Aktif' ? 'badge-success' : 'badge-secondary' }} float-right">
												{{ $row['status'] }}
											</span>
										</td>
										<td>
											<a href="{{ route('backend.user.edit', $row['id']) }}" title="Ubah Data">
												<button type="button" class="btn btn-cyan btn-sm">
													<i class="far fa-edit"></i>
													Ubah
												</button>
											</a>
											<form method="POST" action="{{ route('backend.user.destroy', $row['id']) }}" style="display: inline-block;">
												@method('delete')
												@csrf
												<button type="submit" class="btn btn-danger btn-sm show_confirm" data-konf-delete="{{ $row['name'] }}"
													title='Hapus Data'>
													<i class="fas fa-trash"></i> Hapus</button>
											</form>
										</td>
									</tr>
								@empty
									<tr>
										<td colspan="5">Data tidak tersedia.</td>
									</tr>
								@endforelse
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		@include('backend.v_layouts.footer')
	</div>
@endsection
