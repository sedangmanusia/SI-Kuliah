<?php

use App\Http\Controllers\ortucontroller;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('dashboard', function () {
    return view('dashboard');
});

Route::resource('ortu',ortucontroller::class);

Route::controller(ortucontroller::class)->prefix('ortu')->group(function () {
    Route::get('', 'index')->name('ortu');
    Route::get('create', 'create')->name('ortu.create');
    Route::post('store', 'store')->name('ortu.store');
    Route::get('show/{id}', 'show')->name('ortu.show');
    Route::get('edit/{id}', 'edit')->name('ortu.edit');
    Route::put('edit/{id}', 'update')->name('ortu.update');
    Route::delete('destroy/{id}', 'destroy')->name('ortu.destroy');
});