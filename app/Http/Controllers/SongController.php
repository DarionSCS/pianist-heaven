<?php

namespace App\Http\Controllers;

use App\Models\Song;
use Illuminate\Http\Request;

class SongController extends Controller
{

    public function show(Song $song)
    {
        // Fetch comments and likes for the song
        return view('songs.show', [
            'song' => $song,
            'comments' => $song->interactions()->comments()->with('user')->latest()->get(),
            'likesCount' => $song->interactions()->likes()->count(),
            'userLiked' => auth()->check() ? $song->interactions()->where('user_id', auth()->id())->where('liked', true)->exists() : false,
        ]);
    }
    public function index(Request $request)
    {
        $search = $request->input('search');
        $sort = $request->input('sort');

        $songs = Song::query()
            ->when($search, function ($query) use ($search) {
                $query->where('title', 'like', "%$search%")
                    ->orWhere('artist', 'like', "%$search%");
            })
            ->when($sort, function ($query) use ($sort) {
                $query->orderBy('title', $sort);
            })
            ->with('user')
            ->paginate(10);

        return view('songs.index', compact('songs', 'search', 'sort'));
    }



    public function create()
    {
        return view('songs.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'artist' => 'required|string|max:255',
            'description' => 'nullable|string',
            'pdf_path' => 'required|file|mimes:pdf|max:2048',
        ]);

        // Store the PDF file
        $pdfPath = $request->file('pdf_path')->store('songs/pdfs', 'public');

        // Create a new song
        Song::create([
            'title' => $request->input('title'),
            'artist' => $request->input('artist'),
            'description' => $request->input('description'),
            'pdf_path' => $pdfPath,
            'user_id' => auth()->id(),
        ]);

        return redirect()->route('home')->with('success', 'Song added successfully!');
    }

}
