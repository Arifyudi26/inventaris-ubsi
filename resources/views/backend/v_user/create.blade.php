@extends('backend.v_layouts.app')

@section('content')
<div class="page-wrapper">
	<div class="container-fluid">
		<form id="submitForm" action="{{ route('backend.user.store') }}" method="POST" enctype="multipart/form-data">
			@csrf
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Tambah User</h4>
					<div class="row">
						<div class="col-6">
							<div class="form-group">
								<img class="foto-preview rounded-circle" id="fotoPreview"
									src="{{ asset('img-user/img-default.jpg') }}" style="width: 200px; height: 200px;">
								<input type="file" name="foto" id="foto"
									class="form-control @error('foto') is-invalid @enderror mt-5"
									onchange="previewFoto()">
								@error('foto')
								<div class="invalid-feedback">{{ $message }}</div>
								@enderror
							</div>
						</div>
						<div class="col-6">
							<div class="form-group">
								<label for="role">Hak Akses</label>
								<select name="role" id="role" class="form-control @error('role') is-invalid @enderror">
									<option value="">Pilih Role</option>
									<option value="1" {{ old('role')==1 ? 'selected' : '' }}>Super Admin</option>
									<option value="0" {{ old('role')==0 ? 'selected' : '' }}>Admin</option>
								</select>
								@error('role')
								<div class="invalid-feedback">{{ $message }}</div>
								@enderror
							</div>
							<div class="form-group">
								<label for="name">Nama</label>
								<input type="text" name="name" id="name"
									class="form-control @error('name') is-invalid @enderror" placeholder="Masukkan Nama"
									value="{{ old('name') }}">
								@error('name')
								<div class="invalid-feedback">{{ $message }}</div>
								@enderror
							</div>

							<div class="form-group">
								<label for="email">Email</label>
								<input type="email" name="email" id="email"
									class="form-control @error('email') is-invalid @enderror"
									placeholder="Masukkan Email" value="{{ old('email') }}">
								@error('email')
								<div class="invalid-feedback">{{ $message }}</div>
								@enderror
							</div>

							<div class="form-group">
								<label for="HP">HP</label>
								<input type="text" name="hp" id="hp"
									class="form-control @error('hp') is-invalid @enderror"
									placeholder="Masukkan Nomor Handphone" value="{{ old('hp') }}">
								@error('hp')
								<div class="invalid-feedback">{{ $message }}</div>
								@enderror
							</div>

							<label>Password</label>
							<div class="input-group">
								<input type="password" name="password" id="password"
									class="form-control @error('password') is-invalid @enderror"
									placeholder="Masukkan password" value="{{ old('password') }}">
								@error('password')
								<div class="invalid-feedback">{{ $message }}</div>
								@enderror
							</div>

							<label>Konfirm Password</label>
							<div class="input-group">
								<input type="password" name="password_confirmation" id="KonfirmasiPassword"
									class="form-control @error('password') is-invalid @enderror"
									placeholder="Masukkan Password" value="{{ old('KonfimasiPassword') }}">
								@error('password')
								<div class="invalid-feedback">{{ $message }}</div>
								@enderror
							</div>
						</div>
					</div>
				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="submit" class="btn btn-success"
							onclick="confirmSubmit(event, 'Apakah Anda yakin ?', 'Data akan disimpan!', 'warning', 'Ya', 'Batal', 'Data berhasil disimpan!')">Save</button>
						<a href="{{ route('backend.user.index') }}" class="btn btn-danger">Cancel</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	@endsection