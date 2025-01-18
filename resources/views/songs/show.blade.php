@extends('layouts.app')

@section('content')
    <div class="container mx-auto py-6 px-4">
        <!-- Song Details -->
        <div class="bg-white dark:bg-gray-800 shadow-md rounded-lg p-6">
            <h1 class="text-4xl font-bold text-gray-900 dark:text-gray-100">{{ $song->title }}</h1>
            <p class="text-gray-600 dark:text-gray-400 mt-2">By <span class="font-semibold">{{ $song->artist }}</span></p>
            <p class="text-gray-800 dark:text-gray-300 mt-4">{{ $song->description }}</p>

            <!-- PDF Link -->
            @if ($song->pdf_path)
                <div class="mt-4">
                    <a
                        href="{{ asset('storage/' . $song->pdf_path) }}"
                        target="_blank"
                        class="inline-block px-4 py-2 bg-blue-500 text-white font-medium rounded-lg hover:bg-blue-600 transition"
                    >
                        View PDF
                    </a>
                </div>
            @endif
        </div>
        <br>

        <!-- Comments Section -->
        <div class="mt-8">
            <div class="bg-white dark:bg-gray-800 shadow-md rounded-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 dark:text-gray-100">Comments</h2>

                <!-- Comment Form -->
                <form method="POST" action="{{ url("/songs/{$song->id}/comment") }}" class="mt-4">
                    @csrf
                    <textarea
                        name="content"
                        rows="3"
                        class="w-full p-3 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                        placeholder="Write a comment..."
                    ></textarea>
                    <button
                        type="submit"
                        class="mt-3 px-4 py-2 bg-blue-500 text-white font-medium rounded-lg hover:bg-blue-600 transition"
                    >
                        Submit
                    </button>
                </form>
                <!-- Comment List -->
                <ul class="mt-6 space-y-4">
                    @foreach ($comments as $comment)
                        <li class="bg-gray-50 dark:bg-gray-700 p-4 mt-4 rounded-lg shadow">
                            <div class="flex items-center justify-between">
                                <span class="font-semibold text-gray-900 dark:text-gray-100">{{ $comment->user->name }}</span>
                                <span class="text-sm text-gray-500 dark:text-gray-400">{{ $comment->created_at->diffForHumans() }}</span>
                            </div>
                            <p class="text-gray-700 dark:text-gray-300 mt-2">{{ $comment->content }}</p>
                        </li>
                    @endforeach
                </ul>

                @if ($comments->isEmpty())
                    <p class="text-gray-500 dark:text-gray-400 mt-4">No comments yet. Be the first to comment!</p>
                @endif
            </div>
        </div>
    </div>
@endsection
