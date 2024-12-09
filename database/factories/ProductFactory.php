<?php

namespace Database\Factories;

use App\Models\Product;
use App\Models\Kategori;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    protected $model = Product::class;

    public function definition()
    {
        return [
            'category_id' => Kategori::inRandomOrder()->first()->id,
            'supplier_id' => Kategori::inRandomOrder()->first()->id,
            'user_id' => User::inRandomOrder()->first()->id,
            'status' => $this->faker->boolean,
            'name' => $this->faker->words(3, true),
            'details' => $this->faker->paragraph,
            'price' => $this->faker->randomFloat(2, 10, 1000),
            'stock' => $this->faker->numberBetween(0, 100),
            'weight' => $this->faker->randomFloat(2, 0.5, 10),
            'image' => $this->faker->imageUrl(640, 480, 'products', true, 'Faker'),
        ];
    }
}
