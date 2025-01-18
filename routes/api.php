

<?php

use App\Http\Controllers\InteractionController;
use Illuminate\Support\Facades\Route;


Route::middleware('auth:sanctum')->group(function () {
    Route::post('/songs/{song}/like', [InteractionController::class, 'like']);
    Route::delete('/songs/{song}/like', [InteractionController::class, 'unlike']);
    Route::post('/songs/{song}/comment', [InteractionController::class, 'comment']);
    Route::delete('/comments/{comment}', [InteractionController::class, 'deleteComment']);
});
