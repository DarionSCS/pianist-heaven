<?php

namespace Database\Factories;

use App\Models\Song;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;

/**
 * @extends Factory<Song>
 */
class SongFactory extends Factory
{
    protected $model = Song::class;

    public function definition()
    {
        return [
            'title' => $this->faker->sentence(3),
            'description' => $this->faker->paragraph,
            'artist' => $this->faker->name,
            'pdf_path' => 'songs/' . $this->faker->word . '.pdf',
            'user_id' => User::inRandomOrder()->first()->id, // Ensure users exist
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
