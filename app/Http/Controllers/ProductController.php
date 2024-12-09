<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Kategori;
use App\Models\Supplier;
use App\Models\ImageProduct;
use Illuminate\Http\Request;
use App\Helpers\ImageHelper;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function index()
    {
        $product = Product::orderBy('updated_at', 'desc')->get(); 
        return view('backend.v_product.index', [ 'judul' => 'Data Produk', 'data' => $product ]);
    }

    public function create()
    { 
        $category = Kategori::orderBy('nama_kategori', 'asc')->get(); 
        $supplier = Supplier::orderBy('name', 'asc')->get(); 
        return view('backend.v_product.create', [ 'title' => 'Tambah Produk', 'categories' => $category, 'suppliers' => $supplier ]); 
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'category_id' => 'required',
            'supplier_id' => 'required',
            'name' => 'required|max:255|unique:products',
            'details' => 'required',
            'price' => 'required',
            'weight' => 'required',
            'stock' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png,gif|file|max:1024',
        ], $messages = [
            'image.image' => 'Format gambar gunakan file dengan ekstensi jpeg, jpg, png.',
            'image.max' => 'Ukuran file gambar Maksimal adalah 1024 KB.'
        ]);
        $validatedData['user_id'] = Auth::id(); 
        $validatedData['status'] = 0;

        if ($request->file('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $originalFileName = date('YmdHis') . '_' . uniqid() . '.' . $extension;
            $directory = 'storage/img-products/';
            $fileName = ImageHelper::uploadAndResize($file, $directory, $originalFileName);

            $validatedData['image'] = $fileName;

            $thumbnailLg = 'thumb_lg_' . $originalFileName;
            ImageHelper::uploadAndResize($file, $directory, $thumbnailLg, 800, null);

            $thumbnailMd = 'thumb_md_' . $originalFileName;
            ImageHelper::uploadAndResize($file, $directory, $thumbnailMd, 500, 519);

            $thumbnailSm = 'thumb_sm_' . $originalFileName;
            ImageHelper::uploadAndResize($file, $directory, $thumbnailSm, 100, 110);

            $validatedData['image'] = $originalFileName;
        }

        Product::create($validatedData, $messages);

        return redirect()->route('backend.product.index')->with('success', 'Data berhasil tersimpan');
    }


    public function show(string $id)
    {
        $product = Product::with('imageProduct')->findOrFail($id);
        $category = Kategori::orderBy('nama_kategori', 'asc')->get();
        return view('backend.v_product.show', [
        'title' => 'Detail Produk',
        'product' => $product,
        'categories' => $category
        ]);
    }

    public function edit(string $id)
    {
        $category = Kategori::orderBy('nama_kategori', 'asc')->get(); 
        $supplier = Supplier::orderBy('name', 'asc')->get(); 
        $product = Product::findOrFail($id);
        return view('backend.v_product.edit', [
        'title' => 'Ubah Produk',
        'data' => $product,
        'categories' => $category,
        'suppliers' => $supplier
        ]);
    }

    public function update(Request $request, string $id)
    {
        $produk = Product::findOrFail($id);

        $rules = [
            'name' => 'required|max:255|unique:products,name,' . $id,
            'category_id' => 'required|exists:kategori,id',
            'supplier_id' => 'required|exists:suppliers,id',
            // 'status' => 'required',
            'details' => 'required|string',
            'price' => 'required|numeric|min:0',
            'weight' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,gif|max:1024',
        ];
        $messages = [
            'image.image' => 'Format gambar harus berupa file dengan ekstensi jpeg, jpg, png, atau gif.',
            'image.max' => 'Ukuran file gambar maksimal adalah 1024 KB.',
        ];

        $validatedData = $request->validate($rules, $messages);

        $validatedData['user_id'] = auth()->id();

        if ($request->hasFile('image')) {
            if ($produk->foto) {
                $pathsToDelete = [
                    public_path('storage/img-products/' . $produk->foto),
                    public_path('storage/img-products/thumb_lg_' . $produk->foto),
                    public_path('storage/img-products/thumb_md_' . $produk->foto),
                    public_path('storage/img-products/thumb_sm_' . $produk->foto),
                ];

                foreach ($pathsToDelete as $path) {
                    if (file_exists($path)) {
                        unlink($path);
                    }
                }
            }

            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $originalFileName = date('YmdHis') . '_' . uniqid() . '.' . $extension;
            $directory = 'storage/img-products/';

            $validatedData['image'] = ImageHelper::uploadAndResize($file, $directory, $originalFileName);

            $thumbnailLg = 'thumb_lg_' . $originalFileName;
            ImageHelper::uploadAndResize($file, $directory, $thumbnailLg, 800, null);

            $thumbnailMd = 'thumb_md_' . $originalFileName;
            ImageHelper::uploadAndResize($file, $directory, $thumbnailMd, 500, 519);

            $thumbnailSm = 'thumb_sm_' . $originalFileName;
            ImageHelper::uploadAndResize($file, $directory, $thumbnailSm, 100, 110);

            $validatedData['image'] = $originalFileName;
        }

        $produk->update($validatedData);

        return redirect()->route('backend.product.index')->with('success', 'Data berhasil diperbaharui');
    }


    public function destroy(string $id)
    {
        $product = Product::findOrFail($id);
        $directory = public_path('storage/img-product/');

        if ($product->image) {
            $oldImagePath = $directory . $product->image;
            if (file_exists($oldImagePath)) {
                unlink($oldImagePath);
            }

            $thumbnailLg = $directory . 'thumb_lg_' . $product->image;
            if (file_exists($thumbnailLg)) {
                unlink($thumbnailLg);
            }

            $thumbnailMd = $directory . 'thumb_md_' . $product->image;
            if (file_exists($thumbnailMd)) {
                unlink($thumbnailMd);
            }

            $thumbnailSm = $directory . 'thumb_sm_' . $product->image;
            if (file_exists($thumbnailSm)) {
            unlink($thumbnailSm);
            }
        }

        $fotoProduks = ImageProduct::where('product_id', $id)->get();
        foreach ($fotoProduks as $fotoProduk) {
            $fotoPath = $directory . $fotoProduk->foto;
            if (file_exists($fotoPath)) {
                unlink($fotoPath);
            }
            $fotoProduk->delete();
        }

        $product->delete();
        return redirect()->route('backend.product.index')->with('success', 'Data berhasil dihapus');

    }

    public function storeImages(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'image_products.*' => 'image|mimes:jpeg,jpg,png,gif|file|max:1024',
        ]);


        if ($request->hasFile('image_products')) {
            foreach ($request->file('image_products') as $file) {
                $extension = $file->getClientOriginalExtension();
                $filename = date('YmdHis') . '_' . uniqid() . '.' . $extension;
                $directory = 'storage/img-products/';

                ImageHelper::uploadAndResize($file, $directory, $filename, 800, null);
                ImageProduct::create([
                    'product_id' => $request->product_id,
                    'image' => $filename,
                ]);
            }
        }

        return redirect()->route('backend.product.show', $request->product_id)->with('success', 'Foto berhasil ditambahkan.');
    }

    public function destroyImages($id)
    {
        $img = ImageProduct::findOrFail($id);
        $productId = $img->product_id;

        $imagePath = public_path('storage/img-products/') . $img->image;
        if (file_exists($imagePath)) {
            unlink($imagePath);  
        }

        $img->delete();

        return redirect()->route('backend.product.show', $productId)->with('success', 'Foto berhasil dihapus.');
    }

    public function formProduct()
    {
        return view('backend.v_product.form', [
            'title' => 'Laporan Data Produk',
        ]);
    }

    public function printProduct(Request $request)
    {
        $request->validate(
            [
                'start_date' => 'required|date',
                'end_date' => 'required|date|after_or_equal:start_date',
            ],
            [
                'start_date.required' => 'Tanggal Awal harus diisi.',
                'end_date.required' => 'Tanggal Akhir harus diisi.',
                'end_date.after_or_equal' => 'Tanggal Akhir harus lebih besar atau sama dengan Tanggal Awal.',
            ]
        );

        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');

        $products = Product::whereBetween('updated_at', [$startDate, $endDate])
            ->orderBy('id', 'desc')
            ->get();

        $products->each(function ($product) {
            $category = Kategori::find($product->category_id);
            $product->category_name = $category ? $category->nama_kategori : 'Kategori Tidak Ditemukan';
        });

        return view('backend.v_product.print', [
            'title' => 'Laporan Produk',
            'startDate' => $startDate,
            'endDate' => $endDate,
            'data' => $products,
        ]);
    }

}
