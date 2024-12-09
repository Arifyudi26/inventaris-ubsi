@extends('backend.v_layouts.app')
@section('content')
{{-- <script>
    const data = @json($product->imageProduct);
    console.log(data); 
</script> --}}
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"> {{$title}} </h4>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Kategori</label>
                                    <select disabled class="form-control @error('category_id') is-invalid @enderror"
                                        name="category_id">
                                        <option value="" selected>--Select Category--</option>
                                        @foreach ($categories as $category)
                                        <option value="{{ $category->id }}" {{ old('category_id', $product->
                                            category_id) == $category->id ? 'selected' : '' }}>
                                            {{ $category->nama_kategori }}
                                        </option>
                                        @endforeach
                                    </select>
                                    @error('category_id')
                                    <span class="invalid-feedback alert-danger" role="alert">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label>Name Produk</label>
                                    <input disabled type="text" name="name" value="{{ old('name', $product->name) }}"
                                        class="form-control @error('name') is-invalid @enderror"
                                        placeholder="Enter Product Name">
                                    @error('name')
                                    <span class="invalid-feedback alert-danger" role="alert">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label>Details</label><br>
                                    <textarea disabled name="details"
                                        class="form-control @error('details') is-invalid @enderror" style="min-height: 10em">{{ old('details', $product->details) }}</textarea>
                                    @error('details')
                                    <span class="invalid-feedback alert-danger" role="alert">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    @if ($product->image)
                                    <img src="{{ asset('storage/img-products/' . $product->image) }}" id="fotoPreview"
                                        class="foto-preview" style="width: 200px; height:200px; border-radius: 8px">
                                    <p></p>
                                    @else
                                    <img src=" {{ asset('img-user/picture.png') }}" id="fotoPreview"
                                        class="foto-preview" style="width: 200px; height:200px; border-radius: 8px " >
                                    <p></p>
                                    @endif
                                    <div id="foto-container">
                                        <div class="row">
                                            @foreach($product->imageProduct as $row)
                                            <div class="col-md-4 mt-4">
                                                <div class="position-relative">
                                                    <img src="{{ asset('storage/img-products/' . $row->image) }}" 
                                                         alt="Product Image" 
                                                         style="width: 100%; height: 200px; object-fit: cover; border-radius: 8px;">
                                                    <form action="{{ route('backend.image_product.destroy', $row->id) }}" 
                                                          method="post" 
                                                          class="position-absolute" 
                                                          style="top: 8px; right: 8px;">
                                                        @csrf
                                                        @method('delete')
                                                        <button type="submit" class="btn btn-danger btn-sm p-0" style="border-radius: 50%; width: 32px; height: 32px;">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                    
                                    <button type="button" class="btn btn-primary add-foto mt-3">Tambah Foto</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="border-top">
                        <div class="card-body">
                            <a href="{{ route('backend.product.index') }}">
                                <button type="button" class="btn btn-danger">Kembali</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
   document.addEventListener('DOMContentLoaded', function () {
    const fotoContainer = document.getElementById('foto-container');
    const addFotoButton = document.querySelector('.add-foto');

    addFotoButton.addEventListener('click', function () {
        const fotoRow = document.createElement('div');
        fotoRow.classList.add('form-group', 'row');
        fotoRow.innerHTML = `
            <form action="{{ route('backend.image_product.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="col-md-10">
                    <div class="position-relative">
                        <img src="{{ asset('img-user/picture.png') }}" 
                             id="additionalImages" 
                             class="foto-preview mt-4" 
                             style="width: 160px; height: 200px; object-fit: cover; border-radius: 8px; display: block;">
                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                        <input type="file" name="image_products[]" 
                               class="mt-4 form-control @error('image_products') is-invalid @enderror" 
                               onchange="previewFoto('input[name=&quot;image_products[]&quot;]', 'additionalImages', '{{ asset('img-user/picture.png') }}')">
                        <button type="submit" class="btn btn-success mt-4">Simpan</button>
                    </div>
                </div>
            </form>
        `;

        fotoContainer.appendChild(fotoRow);
    });
});

</script>
@endsection