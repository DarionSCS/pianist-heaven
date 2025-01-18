@extends('layouts.app')

@section('content')
    <div class="container mx-auto py-8">
        <h1 class="text-9xl font-bold text-center mb-8 text-white">Songs Library</h1>

        <!-- Search and Filter Form -->
        <form method="GET" action="{{ route('home') }}" class="mb-8 flex flex-wrap justify-center gap-4">
            <!-- Search Input -->
            <input
                type="text"
                name="search"
                value="{{ request('search') }}"
                placeholder="Search for songs..."
                class="w-1/3 p-3 border rounded-lg focus:outline-none focus:ring focus:ring-blue-300"
            />

            <!-- Sorting Dropdown -->
            <select
                name="sort"
                class="p-3 border rounded-lg focus:outline-none focus:ring focus:ring-blue-300"
            >
                <option value="" {{ request('sort') == '' ? 'selected' : '' }}>Sort by</option>
                <option value="asc" {{ request('sort') == 'asc' ? 'selected' : '' }}>A-Z</option>
                <option value="desc" {{ request('sort') == 'desc' ? 'selected' : '' }}>Z-A</option>
            </select>

            <!-- Submit Button -->
            <button
                type="submit"
                class="px-4 bg-gray-400 text-white font-semibold rounded-lg hover:bg-blue-600 transition"
            >
                Apply
            </button>
        </form>

        <!-- Song list -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
            @forelse ($songs as $song)
                <div class="bg-gray-300 shadow-md rounded-lg overflow-hidden hover:shadow-lg transition">
                    <div class="p-6">
                        <h2 class="text-2xl font-semibold text-gray-700 mb-2">{{ $song->title }}</h2>
                        <p class="text-gray-500 mb-4">Artist: {{ $song->artist }}</p>
                        <p class="text-gray-500 mb-4">Uploaded by: {{ $song->user->name ?? 'Unknown' }}</p>
                        <a
                            href="{{ route('songs.show', $song) }}"
                            class="inline-block px-4 py-2 bg-gray-400 text-black font-medium rounded-lg hover:bg-gray-600 transition"
                        >
                            View Song
                        </a>
                    </div>
                </div>
            @empty
                <p class="col-span-full text-center text-gray-500">No songs found. Try adjusting your search or filter criteria.</p>
            @endforelse
        </div>

        <!-- Pagination -->
        <div class="mt-10 flex justify-center">
            {{ $songs->links() }}
        </div>
    </div>
@endsection
