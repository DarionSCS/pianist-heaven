@extends('layouts.app')

@section('content')
    <div class="container mx-auto max-w-3xl py-8">
        <h1 class="text-3xl font-bold text-white mb-6">Add a New Song</h1>

        <form action="{{ route('songs.store') }}" method="POST" enctype="multipart/form-data" class="bg-gray-400 shadow-md rounded-lg p-6 space-y-6">
            @csrf
            <div>
                <label for="title" class="block text-sm font-medium text-gray-700 mb-2">Title</label>
                <input
                    type="text"
                    name="title"
                    id="title"
                    class="w-full p-3 border rounded-md focus:ring focus:ring-blue-200 focus:outline-none"
                    placeholder="Enter the song title"
                    required
                >
            </div>
            <div>
                <label for="artist" class="block text-sm font-medium text-gray-700 mb-2">Artist</label>
                <input
                    type="text"
                    name="artist"
                    id="artist"
                    class="w-full p-3 border rounded-md focus:ring focus:ring-blue-200 focus:outline-none"
                    placeholder="Enter the artist name"
                    required
                >
            </div>
            <div>
                <label for="description" class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                <textarea
                    name="description"
                    id="description"
                    rows="4"
                    class="w-full p-3 border rounded-md focus:ring focus:ring-blue-200 focus:outline-none"
                    placeholder="Enter a brief description"
                ></textarea>
            </div>
            <div>
                <label for="pdf_path" class="block text-sm font-medium text-gray-700 mb-2">PDF File</label>
                <input
                    type="file"
                    name="pdf_path"
                    id="pdf_path"
                    class="w-full p-3 border rounded-md focus:ring focus:ring-blue-200 focus:outline-none"
                    required
                >
            </div>
            <div>
                <button
                    type="submit"
                    class="w-full py-3 px-4 bg-gray-800 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring focus:ring-blue-200"
                >
                    Submit
                </button>
            </div>
        </form>
    </div>
@endsection
