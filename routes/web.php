<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function() {
    return view('welcome');
});

//Route::get('/users', [AuthController::class, 'indexAllUsers']);             // get(your-path, [your-controller::class, 'your-function']);
//Route::get('/pdam', [AuthController::class, 'indexPdamPusat']);

Route::get('/{any}', function() {
    return view('lesson1');
})->where('any', '.*');