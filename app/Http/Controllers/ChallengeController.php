<?php

namespace App\Http\Controllers;

use App\Models\Song;
use Illuminate\Http\Request;
use App\Mail\ChallengeCompleted;
use Illuminate\Support\Facades\Mail;

class ChallengeController extends Controller
{
    public function index()
    {
        $song = Song::query()->inRandomOrder()->first();

        // Pass the song to the view
        return view('challenge.index', compact('song'));
    }

    public function complete(Request $request)
    {
        $validated = $request->validate([
            'song_id' => 'required|exists:songs,id',
            'time_spent' => 'required|integer',
            'success' => 'required|boolean',
        ]);

        return redirect()->route('home')->with('status', 'Challenge logged! Great job!');
    }



    public function mailUserChallengeCompletion(Request $request)
    {
        $song = Song::findOrFail($request->song_id);
        $user = $request->user();

        // Send the email
        Mail::to($user->email)->send(new ChallengeCompleted($song));

        return redirect()->route('home')->with('success', 'Challenge completed! Check your email for details.');
    }

}
