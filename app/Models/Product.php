<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    
    public $timestamps = true; 
    protected $table = "products"; 
    protected $guarded = ['id'];

    public function kategori() { 
        return $this->belongsTo(Kategori::class);
    } 
    public function user() { 
        return $this->belongsTo(User::class); 
    }
    public function imageProduct()
    {
        return $this->hasMany(imageProduct::class);
    } 
    public function supplier()
    {
        return $this->belongsTo(Supplier::class); 
    }
}
