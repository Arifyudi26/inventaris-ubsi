<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    /**
     * Display a listing of the suppliers.
     */
    public function index()
    {
        $data = Supplier::orderBy('updated_at', 'desc')->get(); 
        return view('backend.v_supplier.index', [ 'title' => 'Data Supplier', 'data' => $data ]);
    }

    /**
     * Show the form for creating a new supplier.
     */
    public function create()
    {
        return view('backend.v_supplier.create', [ 'title' => 'Tambah Supplier']);
    }

    /**
     * Store a newly created supplier in the database.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'contact_person' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:15',
            'email' => 'nullable|email|max:255|unique:suppliers,email',
            'address' => 'nullable|string',
        ]);

        Supplier::create($validated);

        return redirect()->route('backend.supplier.index')->with('success', 'Supplier berhasil ditambahkan!');
    }

    /**
     * Show the form for editing the specified supplier.
     */
    public function edit(string $id)
    {
        $supplier = Supplier::with('products')->findOrFail($id);
        return view('backend.v_supplier.edit', [
            'title' => 'Edit Supplier',
            'data' => $supplier,
            'products' => $supplier->products
        ]);
    }


    /**
     * Update the specified supplier in the database.
     */
    public function update(Request $request, Supplier $supplier)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'contact_person' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:15',
            'email' => 'nullable|email|max:255|unique:suppliers,email,' . $supplier->id,
            'address' => 'nullable|string',
        ]);

        $supplier->update($validated);

        return redirect()->route('backend.supplier.index')->with('success', 'Supplier berhasil diperbarui!');
    }

    /**
     * Remove the specified supplier from the database.
     */
    public function destroy(Supplier $supplier)
    {
        $supplier->delete();

        return redirect()->route('backend.supplier.index')->with('success', 'Supplier berhasil dihapus!');
    }

    public function formSupplier()
    {
        return view('backend.v_supplier.form', [
            'title' => 'Laporan Data Supplier',
        ]);
    }

    public function printSupplier(Request $request)
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

        $data = Supplier::whereBetween('created_at', [$startDate, $endDate])
            ->orderBy('id', 'desc')
            ->get();

        return view('backend.v_supplier.print', [
            'title' => 'Laporan Supplier',
            'startDate' => $startDate,
            'endDate' => $endDate,
            'data' => $data,
        ]);
    }
}
