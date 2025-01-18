<?php

namespace Database\Seeders;

use App\Models\Interaction;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class InteractionsTableSeeder extends Seeder
{
    public function run()
    {
        Interaction::factory()->count(50)->create();

    }
}
