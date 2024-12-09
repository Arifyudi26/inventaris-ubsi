@extends('backend.v_layouts.app')

@section('content')
{{-- <script>
    const data = @json($products);
	console.log(data); 
</script> --}}
<div class="page-wrapper">
    <div class="container-fluid">
        <form id="submitForm" action="{{ route('backend.supplier.update',  $data->id) }}" method="POST"
            enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">{{$title}}</h4>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="name">Nama</label>
                                <input type="text" class="form-control" id="name" name="name"
                                    value="{{ old('name', $data->name) }}" required>
                                @error('name')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="phone">Handphone</label>
                                <input type="text" class="form-control" id="phone" name="phone"
                                    value="{{ old('phone', $data->phone) }}">
                                @error('phone')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="contact_person">Contact Person</label>
                                <input type="text" class="form-control" id="contact_person" name="contact_person"
                                    value="{{ old('contact_person', $data->contact_person) }}">
                                @error('contact_person')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    value="{{ old('email', $data->email) }}">
                                @error('email')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="address">Alamat</label>
                                <textarea class="form-control" id="address"
                                    name="address">{{ old('address', $data->address) }}</textarea>
                                @error('address')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                    </div>
                </div>

                <div class=" mt-4">
                    <div class="border-top">
                        <div class="card-body"> <button id="toggleTableBtn" class="btn btn-primary" type="button">
                                Tampilkan Produk
                            </button>
                        </div>
                    </div>

                    <div id="productsTable" class="mt-3" style="display: none;">
                        <table class="table table-striped m-4">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nama Produk</th>
                                    <th>Harga</th>
                                    <th>Stok</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($products as $product)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $product->name }}</td>
                                    <td>{{ number_format($product->price, 2) }}</td>
                                    <td>{{ $product->stock }}</td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="4" class="text-center">Tidak ada produk.</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>


                <div class="border-top">
                    <div class="card-body">
                        <button type="submit" class="btn btn-success"
                            onclick="confirmSubmit(event, 'Apakah Anda yakin ?', 'Data akan disimpan!', 'warning', 'Ya', 'Batal', 'Data berhasil disimpan!')">Perbaharui</button>
                        <a href="{{ route('backend.supplier.index') }}" class="btn btn-danger">Kembali</a>
                    </div>
                </div>


            </div>
        </form>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleButton = document.getElementById('toggleTableBtn');
        const productsTable = document.getElementById('productsTable');

        toggleButton.addEventListener('click', function () {
            // Toggle visibility
            if (productsTable.style.display === 'none') {
                productsTable.style.display = 'block';
                toggleButton.textContent = 'Sembunyikan Produk';
            } else {
                productsTable.style.display = 'none';
                toggleButton.textContent = 'Tampilkan Produk';
            }
        });
    });
</script>

@endsection