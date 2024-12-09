<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    public function berandaBackend()
    {
        return view('backend.v_beranda.index', [
        'judul' => 'Halaman Beranda',
        ]);
    }
}