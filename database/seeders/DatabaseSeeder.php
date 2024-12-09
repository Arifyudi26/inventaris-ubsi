<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Faker\Factory as Faker;
use App\Models\Kategori;
use App\Models\Supplier;
use App\Models\Product;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::truncate();

        Supplier::factory()->count(10)->create();
        Kategori::factory()->count(10)->create();
        Product::factory()->count(50)->create();

        $faker = Faker::create();

        User::create([
            'name' => 'Administrator',
            'email' => 'admin@gmail.com',
            'role' => '1',
            'status' => 1,
            'hp' => '0812345678901',
            'password' => bcrypt('password'),
        ]);

        User::create([
            'name' => 'Sopian Aji',
            'email' => 'sopian4ji@gmail.com',
            'role' => '0',
            'status' => 1,
            'hp' => '081234567892',
            'password' => bcrypt('P@55word'),
        ]);

        for ($i = 0; $i < 100; $i++) {
            User::create([
                'name' => $faker->name,
                'email' => 'user' . ($i + 1) . '@example.com', 
                'role' => $faker->randomElement(['0', '1']),
                'status' => $faker->boolean(80),
                'hp' => substr($faker->phoneNumber, 0, 13),
                'password' => bcrypt('password'),
            ]);
        }
    }
}