<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Interaction extends Model
{
    use HasFactory;

    protected $fillable = ['content', 'liked', 'user_id', 'song_id'];

    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function song()
    {
        return $this->belongsTo(Song::class);
    }

    // Scopes for filtering likes and comments
    public function scopeLikes($query)
    {
        return $query->where('liked', true);
    }

    public function scopeComments($query)
    {
        return $query->whereNotNull('content');
    }
}
