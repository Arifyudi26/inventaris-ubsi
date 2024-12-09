@extends('backend.v_layouts.app')
@section('content')
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <form id="submitForm" action="{{ route('backend.kategori.update', $edit->id) }}" method="post">
                        @method('put')
                        @csrf
                        <div class="card-body">
                            <h4 class="card-title"> {{$judul}} </h4>
                            <div class="form-group">
                                <label>Nama Kategori</label>
                                <input type="text" name="nama_kategori"
                                    value="{{ old('nama_kategori', $edit->nama_kategori) }}"
                                    class="form-control @error('nama_kategori') is-invalid @enderror"
                                    placeholder="Masukkan Nama Kategori">
                                @error('nama_kategori')
                                <span class="invalid-feedback alert-danger" role="alert">
                                    {{ $message }}
                                </span>
                                @enderror
                            </div>
                        </div>
                        <div class="border-top">
                            <div class="card-body">
                                <button
                                    onclick="confirmSubmit(event, 'Apakah Anda yakin untuk mengubah Kategori?', 'Data akan disimpan!', 'warning', 'Ya', 'Batal', 'Data berhasil diubah!')"
                                    type="submit" class="btn btn-success">Perbaharui</button>
                                <a href="{{ route('backend.kategori.index') }}">
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