<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EventosController;
use App\Http\Controllers\EntradasController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::apiResource('/eventos',EventosController::Class);
Route::get('/eventos',[EventosController::class,'index']);
Route::post('/eventos',[EventosController::class,'store']);
Route::get('/eventos/{evento}',[EventosController::class,'show']);
Route::put('/eventos/{evento}',[EventosController::class,'update']);
Route::delete('/eventos/{evento}',[EventosController::class,'destroy']);

Route::get('/entradas',[EntradasController::class,'index']);
Route::post('/entradas',[EntradasController::class,'store']);
Route::get('/entradas/{entrada}/{evento}',[EntradasController::class,'show']);
Route::post('/entradasCompradas',[EntradasController::class,'entradasCompradas']);