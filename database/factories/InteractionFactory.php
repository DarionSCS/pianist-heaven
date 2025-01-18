<?php

namespace Database\Factories;

use App\Models\Interaction;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use App\Models\Song;

/**
 * @extends Factory<Interaction>
 */
class InteractionFactory extends Factory
{
    protected $model = Interaction::class;

    public function definition()
    {
        return [
            'content' => $this->faker->optional()->sentence, // Random comment or null
            'liked' => $this->faker->boolean, // Random like or not
            'user_id' => User::query()->inRandomOrder()->first()->id, // Ensure users exist
            'song_id' => Song::query()->inRandomOrder()->first()->id, // Ensure songs exist
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
