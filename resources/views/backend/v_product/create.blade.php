@extends('backend.v_layouts.app')

@section('content')
<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<form id="submitForm" class="form-horizontal" action="{{ route('backend.product.store') }}"
						method="post" enctype="multipart/form-data">
						@csrf
						<div class="card-body">
							<h4 class="card-title"> {{$title}} </h4>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<img class="foto-preview" id="fotoPreview"
											src="{{ asset('img-user/picture.png') }}"
											style="width: 200px; height: 200px;">
										<input type="file" name="image" class="form-control"
											onchange="previewFoto('input[name=image]', 'fotoPreview', '{{ asset('img-user/picture.png') }}')">
										@error('image')
										<div class="invalid-feedback alert-danger">{{ $message }}</div>
										@enderror
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										<label>Kategori</label>
										<select class="form-control @error('category_id') is-invalid @enderror"
											name="category_id">
											<option value="" selected>--Select Category--</option>
											@foreach ($categories as $category)
											<option value="{{ $category->id }}"> {{ $category->nama_kategori }}
											</option>
											@endforeach
										</select>
										@error('category_id')
										<span class="invalid-feedback alert-danger" role="alert"> {{ $message }} </span>
										@enderror
									</div>
									<div class="form-group">
										<label>Name supplier</label>
										<select class="form-control @error('supplier_id') is-invalid @enderror"
											name="supplier_id">
											<option value="" selected>--Select supplier--</option>
											@foreach ($suppliers as $row)
											<option value="{{ $row->id }}"> {{ $row->name }}
											</option>
											@endforeach
										</select>
										@error('name')
										<span class="invalid-feedback alert-danger" role="alert"> {{ $message }} </span>
										@enderror
									</div>
									<div class="form-group">
										<label>Name Produk</label>
										<input type="text" name="name" value="{{ old('name') }}"
											class="form-control @error('name') is-invalid @enderror"
											placeholder="Enter Product Name">
										@error('name')
										<span class="invalid-feedback alert-danger" role="alert"> {{ $message }} </span>
										@enderror
									</div>
									<div class="form-group">
										<label>Details</label><br>
										<textarea name="details" id="ckeditor"
											class="form-control @error('details') is-invalid @enderror">{{ old('details') }}</textarea>
										@error('details')
										<span class="invalid-feedback alert-danger" role="alert"> {{ $message }} </span>
										@enderror
									</div>
									<div class="form-group">
										<label>Harga</label>
										<input type="number" name="price" value="{{ old('price') }}"
											class="form-control @error('price') is-invalid @enderror"
											placeholder="Enter Product Price">
										@error('price')
										<span class="invalid-feedback alert-danger" role="alert"> {{ $message }} </span>
										@enderror
									</div>
									<div class="form-group">
										<label>Berat</label>
										<input type="number" name="weight" value="{{ old('weight') }}"
											class="form-control @error('weight') is-invalid @enderror"
											placeholder="Enter Product Weight">
										@error('weight')
										<span class="invalid-feedback alert-danger" role="alert"> {{ $message }} </span>
										@enderror
									</div>
									<div class="form-group">
										<label>Stok</label>
										<input type="number" name="stock" value="{{ old('stock') }}"
											class="form-control @error('stock') is-invalid @enderror"
											placeholder="Enter Product Stock">
										@error('stock')
										<span class="invalid-feedback alert-danger" role="alert"> {{ $message }} </span>
										@enderror
									</div>
								</div>
							</div>
						</div>
						<div class="border-top">
							<div class="card-body">
								<button
									onclick="confirmSubmit(event, 'Apakah Anda yakin ?', 'Data akan disimpan!', 'warning', 'Ya', 'Batal', 'Data berhasil diubah!')"
									type="submit" class="btn btn-primary">Simpan</button>
								<a href="{{ route('backend.product.index') }}">
									<button type="button" class="btn btn-danger">Kembali</button>
								</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

@endsection