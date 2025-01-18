@extends('layouts.app')

@section('content')
    <div class="container mx-auto py-8">
        <h1 class="text-3xl font-bold text-center mb-4 text-white">Random Song Challenge</h1>


        <x-timer :action="route('challenge.complete')" :song="$song" />
    </div>
@endsection
