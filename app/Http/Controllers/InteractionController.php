<?php

namespace App\Http\Controllers;

use App\Models\Interaction;
use App\Models\Song;
use Illuminate\Http\Request;

class InteractionController extends Controller
{
    // Store a like
    public function like(Song $song, Request $request)
    {
        $interaction = Interaction::updateOrCreate(
            ['user_id' => $request->user()->id, 'song_id' => $song->id],
            ['liked' => true, 'content' => null] // Ensure it's a like
        );

        return response()->json(['message' => 'Liked successfully', 'interaction' => $interaction]);
    }

    // Remove a like
    public function unlike(Song $song, Request $request)
    {
        Interaction::where('user_id', $request->user()->id)
            ->where('song_id', $song->id)
            ->where('liked', true)
            ->delete();

        return response()->json(['message' => 'Unliked successfully']);
    }

    // Store a comment
    public function comment(Song $song, Request $request)
    {
        $request->validate([
            'content' => 'required|string|max:255',
        ]);

        $comment = Interaction::create([
            'user_id' => $request->user()->id,
            'song_id' => $song->id,
            'content' => $request->input('content'),
            'liked' => false,
        ]);

        return response()->json(['message' => 'Comment added successfully', 'comment' => $comment]);
    }

    // Get all comments for a song
    public function getComments(Song $song)
    {
        $comments = Interaction::comments()
            ->where('song_id', $song->id)
            ->with('user') // Include user info
            ->get();

        return response()->json($comments);
    }
}
