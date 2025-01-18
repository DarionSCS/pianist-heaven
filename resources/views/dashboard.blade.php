@extends('layouts.app')

@section('content')
    <x-slot name="header">
        <h2 class="font-semibold text-2xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Welcome, ' . Auth::user()->name . '!') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <!-- Welcome Card -->
            <div class="bg-gradient-to-r from-blue-500 to-purple-600 text-white shadow-lg rounded-lg overflow-hidden">
                <div class="p-6">
                    <h3 class="text-2xl font-bold mb-2">Welcome to Pianist Heaven!</h3>
                    <p class="text-lg mb-4">You are now logged in. Explore and start sharing your music sheets with fellow pianists!</p>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <div class="bg-white dark:bg-gray-700 shadow-md rounded-lg p-6">
                    <h4 class="text-xl font-bold text-gray-800 dark:text-gray-100 mb-2">Create a Song</h4>
                    <p class="text-gray-600 dark:text-gray-300 mb-4">Share your favorite music with the community by adding a new music sheet to our library.</p>
                    <a href="{{ route('songs.create') }}" class="text-white bg-black p-2 rounded font-semibold hover:underline">
                        Add Song
                    </a>
                </div>
                <div class="bg-white dark:bg-gray-700 shadow-md rounded-lg p-6">
                    <h4 class="text-xl font-bold text-gray-800 dark:text-gray-100 mb-2">Manage Profile</h4>
                    <p class="text-gray-600 dark:text-gray-300 mb-4">Keep your profile updated with the latest information and preferences.</p>
                    <a href="{{ route('profile.edit') }}" class="text-white bg-black p-2 rounded font-semibold hover:underline">
                        Edit Profile
                    </a>
                </div>
                <div class="bg-white dark:bg-gray-700 shadow-md rounded-lg p-6">
                    <h4 class="text-xl font-bold text-gray-800 dark:text-gray-100 mb-2">Community Features</h4>
                    <p class="text-gray-600 dark:text-gray-300 mb-4">Explore comments, likes, and interact with other community members.</p>
                    <a href="{{ route('home') }}" class="text-white bg-black p-2 rounded font-semibold hover:underline">
                        Explore Community
                    </a>
                </div>
                <div class="bg-white dark:bg-gray-700 shadow-md rounded-lg p-6">
                    <h4 class="text-xl font-bold text-gray-800 dark:text-gray-100 mb-2">Challenge yourself!</h4>
                    <p class="text-gray-600 dark:text-gray-300 mb-4">Set a timer and try to learn a random song within that time.</p>
                    <a href="{{ route('challenge.index') }}" class="text-white bg-black p-2 rounded font-semibold hover:underline">
                        Challenge
                    </a>
                </div>
            </div>
        </div>
    </div>
@endsection
