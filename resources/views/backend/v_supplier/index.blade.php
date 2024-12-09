@extends('backend.v_layouts.app')

@section('content')
<div class="page-wrapper">
	<div class="container-fluid">
		<a href="{{ route('backend.supplier.create') }}">
			<button type="button" class="btn btn-primary mb-3"><i class="fas fa-plus"></i>
				Tambah</button>
		</a>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">{{ $title }}</h5>
				<div class="table-responsive">
					<table id="zero_config" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Namea</th>
								<th>Contact Person</th>
								<th>Handphone</th>
								<th>Email</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							@forelse($data as $key => $row)
							<tr>
								<td>{{ $key + 1 }}</td>
								<td>{{ $row->name }}</td>
								<td>{{ $row->phone }}</td>
								<td>{{ $row->email }}</td>
								<td>
									<a href="{{ route('backend.supplier.edit', $row['id']) }}" title="Ubah Data">
										<button type="button" class="btn btn-cyan btn-sm">
											<i class="far fa-edit"></i>
											Ubah
										</button>
									</a>
									<form method="POST" action="{{ route('backend.product.destroy', $row['id']) }}"
										style="display: inline-block;">
										@method('delete')
										@csrf
										<button type="submit" class="btn btn-danger btn-sm show_confirm"
											data-konf-delete="{{ $row['name'] }}" title='Hapus Data'>
											<i class="fas fa-trash"></i> Hapus</button>
									</form>
								</td>
							</tr>
							@empty
							<tr>
								<td colspan="7">Tidak ada data produk</td>
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