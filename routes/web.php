<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SupplierController;

Route::get('/', function () {
    return redirect()->route('backend.login');
});

Route::get('backend/beranda', [BerandaController::class, 'berandaBackend'])->name('backend.beranda')->middleware('auth');
Route::get('backend/login', [LoginController::class, 'loginBackend'])->name('backend.login');
Route::post('backend/login', [LoginController::class, 'authenticateBackend'])->name('backend.login');
Route::post('backend/logout', [LoginController::class, 'logoutBackend'])->name('backend.logout');
Route::resource('backend/user', UserController::class, ['as' => 'backend'])->middleware('auth');
Route::resource('backend/kategori', KategoriController::class, ['as' => 'backend'])->middleware('auth');
Route::resource('backend/product', ProductController::class, ['as' => 'backend'])->middleware('auth');
Route::resource('backend/supplier', SupplierController::class, ['as' => 'backend'])->middleware('auth');

// image_product
Route::post('image_product/store', [ProductController::class, 'storeImages'])->name('backend.image_product.store')->middleware('auth');
Route::delete('image_product/{id}', [ProductController::class, 'destroyImages'])->name('backend.image_product.destroy')->middleware('auth');
// report 
Route::get('backend/report/form-user', [UserController::class, 'formUser'])->name('backend.report.form-user')->middleware('auth');
Route::post('backend/report/print-user', [UserController::class, 'printkUser'])->name('backend.report.print-user')->middleware('auth');
Route::get('backend/report/form-product', [ProductController::class, 'formProduct'])->name('backend.report.form-product')->middleware('auth');
Route::post('backend/report/print-product', [ProductController::class, 'printProduct'])->name('backend.report.print-product')->middleware('auth');
Route::get('backend/report/form-supplier', [SupplierController::class, 'formSupplier'])->name('backend.report.form-supplier')->middleware('auth');
Route::post('backend/report/print-supplier', [SupplierController::class, 'printSupplier'])->name('backend.report.print-supplier')->middleware('auth');