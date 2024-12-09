<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('supplier_id');
            $table->unsignedBigInteger('category_id'); 
            $table->unsignedBigInteger('user_id');     
            $table->boolean('status');                 
            $table->string('name');           
            $table->text('details');                  
            $table->double('price');                  
            $table->integer('stock');                 
            $table->float('weight');                   
            $table->string('image');                   
            $table->timestamps();
            $table->foreign('category_id')->references('id')->on('kategori'); 
            $table->foreign('user_id')->references('id')->on('user');         
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropForeign(['supplier_id']);
            $table->dropColumn('supplier_id');
        });
    }
};
