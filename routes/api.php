<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PdamController;
use App\Http\Controllers\SambunganController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\BeritaController;
use App\Http\Controllers\TagihanController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
| NOTE: Route position can effect the accessibility of routing
*/


// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    // Route::get('/userAuth', function(Request $request) { return auth()->user(); });
    Route::get('/userAuth', [AuthController::class, 'getUser']);
    Route::get('/sambunganAuth', [AuthController::class, 'getSambungan']);
    Route::get('/dataSambunganAuth', [AuthController::class, 'getDataSambungan']);
    Route::post('/membership/storeRequest', [SambunganController::class, 'storeRequestMembership']);
    Route::get('/membership/memberRequest', [SambunganController::class, 'indexAllRequestSambungan']);
    Route::get('/report/user', [ReportController::class, 'indexAuthUserReport']);
    Route::post('/report/create', [ReportController::class, 'storeReport']);
    Route::delete('/report/delete/{id_report}', [ReportController::class, 'destroyReport']); 
    Route::get('/tagihan/user', [TagihanController::class, 'indexAuthUserTagihan']);   
    Route::get('/tagihan/user/sum', [TagihanController::class, 'indexAuthUserTagihanSum']);   
    Route::post('/logout', [AuthController::class, 'logoutUser']);
});

// Public routes
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [UserController::class, 'storeUser']);                                         // use method post to post a form FUCKKKS...
Route::post('/login', [AuthController::class, 'loginUser']);
Route::post('/forget', [AuthController::class, 'forgetPass']);

Route::get('/users', [UserController::class, 'indexAllUsers']); 
Route::get('/users/{id}', [UserController::class, 'showUser']); 

Route::delete('/users/{id}', [UserController::class, 'destroyUser']); 
Route::put('/users/{id}', [UserController::class, 'updateUser']);
Route::put('/users/status0/{id_s0}', [UserController::class, 'updateStatusUser0']);
Route::put('/users/status1/{id_s1}', [UserController::class, 'updateStatusUser1']);

Route::post('/users/photo/{id}', [UserController::class, 'uploadUserPhoto']);                           // route post method for photo; using different controller which is UserController;
Route::get('/users/search/{nama}', [UserController::class, 'searchUser']);
Route::get('/username/{nama}', [UserController::class, 'usernameCheck']);

Route::get('/pdam', [PdamController::class, 'indexPdamPusat']);
Route::get('/pdam/cabangpdam', [PdamController::class, 'indexCabangPdam']);
Route::get('/pdam/cabangpdamandpusat', [PdamController::class, 'indexCabangPdamAndPusatPdam']);

Route::get('/sambungan', [SambunganController::class, 'indexSambungan']);
Route::get('/sambungan/datasambungan', [SambunganController::class, 'indexDataSambungan']);

Route::get('/report', [ReportController::class, 'indexAllReport']);

Route::get('/news', [BeritaController::class, 'indexAllBerita']);

Route::get('/tagihan', [TagihanController::class, 'indexAllTagihan']);
Route::get('/tagihan/count', [TagihanController::class, 'indexCountAllTagihan']);







