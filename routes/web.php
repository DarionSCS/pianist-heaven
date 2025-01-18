<?php

use App\Http\Controllers\ChallengeController;
use App\Http\Controllers\InteractionController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SongController;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;
use Spatie\Sitemap\Sitemap;
use Spatie\Sitemap\Tags\Url;
use App\Mail\ChallengeCompleted;

// Home page route (displays all songs)
Route::get('/', [SongController::class, 'index'])->name('home');

// Route to create a new song
Route::get('/songs/create', [SongController::class, 'create'])->name('songs.create');
Route::post('/songs', [SongController::class, 'store'])->name('songs.store');

// Route to view a specific song
Route::get('/songs/{song}', [SongController::class, 'show'])->name('songs.show');

// Interaction routes (likes/comments)
Route::middleware('auth')->group(function () {
    Route::post('/songs/{song}/like', [InteractionController::class, 'like']);
    Route::delete('/songs/{song}/like', [InteractionController::class, 'unlike']);
    Route::post('/songs/{song}/comment', [InteractionController::class, 'comment']);
    Route::get('/songs/{song}/comments', [InteractionController::class, 'getComments']);
});

// dashboard
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// challenge routes
Route::get('/challenge', [ChallengeController::class, 'index'])->name('challenge.index');
// Route::post('/challenge/complete', [ChallengeController::class, 'complete'])->name('challenge.complete');
Route::post('/challenge/complete-mail', [ChallengeController::class, 'mailUserChallengeCompletion'])->name('challenge.complete.mail');




// auth for profile routes
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// sitemap
// after running this route, you can access the sitemap at /sitemap.xml
Route::get('/generate-sitemap', function () {
    $sitemap = Sitemap::create()
        ->add(Url::create('/')->setPriority(1.0))
        ->add(Url::create('/songs')->setPriority(0.8))
        ->add(Url::create('/dashboard')->setPriority(0.7));

    $sitemap->writeToFile(public_path('sitemap.xml'));

    return 'Sitemap generated successfully!';
});


require __DIR__.'/auth.php';
