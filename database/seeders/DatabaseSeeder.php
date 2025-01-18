<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            UsersTableSeeder::class,
            SongsTableSeeder::class,
            InteractionsTableSeeder::class,
        ]);
        dd(config('database.connections.mariadb'));
    }
}
