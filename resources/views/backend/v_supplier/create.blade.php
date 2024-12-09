@extends('backend.v_layouts.app')

@section('content')
<div class="page-wrapper">
 <div class="container-fluid">
  <form id="submitForm" action="{{ route('backend.supplier.store') }}" method="POST" enctype="multipart/form-data">
   @csrf
   <div class="card">
    <div class="card-body">
     <h4 class="card-title">{{$title}}</h4>
     <div class="row">
      <div class="col-6">
       <div class="form-group">
        <label for="name">Nama</label>
        <input type="text" class="form-control" id="name" name="name" required>
        @error('name')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
       </div>
        <div class="form-group">
        <label for="name">Handphone</label>
        <input type="text" class="form-control" id="phone" name="phone">
        @error('phone')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
       </div>
      </div>
      <div class="col-6">
       <div class="form-group">
        <label for="name">Contact Person</label>
        <input type="text" class="form-control" id="contact_person" name="contact_person">
        @error('contact_person')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
       </div>
       <div class="form-group">
        <label for="name">Email</label>
        <input type="email" class="form-control" id="email" name="email">
        @error('contact_person')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
       </div>
      </div>
     </div>
     <div class="row">
      <div class="col-12">
       <div class="form-group">
        <label for="name">Alamat</label>
        <textarea class="form-control" id="address" name="address"></textarea>
        @error('address')
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
      <a href="{{ route('backend.supplier.index') }}" class="btn btn-danger">Kembali</a>
     </div>
    </div>
   </div>
  </form>
 </div>
 @endsection