@extends('backend.v_layouts.app')

@section('content')
<div class="page-wrapper">
 <div class="container-fluid">
  <div class="row">
   <div class="col-12">
    <div class="card">
     <form class="form-horizontal" action="{{ route('backend.report.print-supplier') }}" method="post" target="_blank">
      @csrf
      <div class="card-body">
       <h4 class="card-title">{{ $title }}</h4>
       <div class="form-group">
        <label for="start_date">Tanggal Awal</label>
        <input type="date" id="start_date" name="start_date" 
         value="{{ old('start_date') }}" class="form-control @error('start_date') is-invalid @enderror"
         placeholder="Masukkan Tanggal Awal">
        @error('start_date')
        <span class="invalid-feedback alert-danger" role="alert">
         {{ $message }}
        </span>
        @enderror
       </div>

       <div class="form-group">
        <label for="end_date">Tanggal Akhir</label>
        <input type="date" id="end_date" name="end_date" 
         value="{{ old('end_date') }}" class="form-control @error('end_date') is-invalid @enderror"
         placeholder="Masukkan Tanggal Akhir">
        @error('end_date')
        <span class="invalid-feedback alert-danger" role="alert">
         {{ $message }}
        </span>
        @enderror
       </div>
       <br>
       <button type="submit" class="btn btn-primary">Cetak</button>
      </div>
     </form>
    </div>
   </div>
  </div>
 </div>
 @include('backend.v_layouts.footer')
</div>
@endsection