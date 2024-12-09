@extends('backend.v_layouts.app')

@section('content')
<div class="page-wrapper">
	<div class="container-fluid">
		<a href="{{ route('backend.product.create') }}">
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
								<th>Nama Produk</th>
								<th>Harga</th>
								<th>Deskripsi</th>
								<th>Stok</th>
								<th>Status</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							@forelse($data as $key => $product)
							<tr>
								<td>{{ $key + 1 }}</td>
								<td>{{ $product->name }}</td>
								<td>Rp {{ number_format($product->price, 0, ',', '.') }}</td>
								<td>
									<span id="details-{{ $product->id }}" class="details-text">
										{{ Str::limit(strip_tags($product->details), 50) }}
									</span>
									<span id="full-details-{{ $product->id }}" class="full-details" style="display:none;">
										{{ strip_tags($product->details) }}
									</span>
									@if(strlen(strip_tags($product->details)) > 20)
									<span class="toggle-details" data-id="{{ $product->id }}"
										style="color: blue; text-decoration: underline; cursor: pointer;">
										More
									</span>
									@endif
								</td>
								<td>{{ $product->stock }}</td>
								<td>{{ $product->status == 1 ? 'Aktif' : 'Tidak Aktif' }}</td>
								<td>
									<a href="{{ route('backend.product.edit', $product['id']) }}" title="Ubah Data">
										<button type="button" class="btn btn-cyan btn-sm">
											<i class="far fa-edit"></i>
											Ubah
										</button>
									</a>
									<form method="POST" action="{{ route('backend.product.destroy', $product['id']) }}"
										style="display: inline-block;">
										@method('delete')
										@csrf
										<button type="submit" class="btn btn-danger btn-sm show_confirm"
											data-konf-delete="{{ $product['name'] }}" title='Hapus Data'>
											<i class="fas fa-trash"></i> Hapus</button>
									</form>
									<a href="{{ route('backend.product.show', $product->id) }}" title="Ubah Data">
										<button type="button" class="btn btn-warning btn-sm"><i class="fas fa-plus"></i>
											Gambar</button>
									</a>
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