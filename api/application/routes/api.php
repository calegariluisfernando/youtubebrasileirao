<?php

use App\Http\Controllers\TimeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::prefix('times')->group(function () {
    Route::get('', [TimeController::class, 'index']);
    Route::get('/proxy-image', [TimeController::class, 'proxyImage']);
    Route::get('/{time}', [TimeController::class, 'show']);
    Route::put('/{time}', [TimeController::class, 'update']);
});
