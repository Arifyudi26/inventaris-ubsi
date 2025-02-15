<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImageProduct extends Model
{
    use HasFactory;
    
    public $timestamps = true;
    protected $table = 'image_products';
    protected $guarded = ['id'];
}
