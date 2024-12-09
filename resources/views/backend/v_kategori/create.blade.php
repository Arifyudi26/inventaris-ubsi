@extends('backend.v_layouts.app')
@section('content')
<div class="page-wrapper">
    <div class="container-fluid">
        <form id="submitForm" action="{{ route('backend.kategori.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">{{$judul}}</h4>
                    <div class="form-group">
                        <label>Nama Kategori</label>
                        <input type="text" name="nama_kategori" value="{{old('nama_kategori') }}"
                            class="form-control @error('nama_kategori') is-invalid @enderror"
                            placeholder="Masukkan Nama Kategori">
                        @error('nama_kategori')
                        <span class="invalid-feedback alert-danger" role="alert">
                            {{ $message }}
                        </span>
                        @enderror
                    </div>
                    <div class="border-top">
                        <div class="card-body">
                            <button
                                onclick="confirmSubmit(event, 'Apakah Anda yakin ?', 'Data akan disimpan!', 'warning', 'Ya', 'Batal', 'Data berhasil disimpan!')"
                                type="submit" class="btn btn-success">Simpan</button>
                            <a href="{{ route('backend.user.index') }}" class="btn btn-danger">Kembali</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    @endsection