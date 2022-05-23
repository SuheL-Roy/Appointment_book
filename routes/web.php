<?php

use App\Http\Controllers\AppointmentController;
use App\Http\Controllers\TeacherController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});
Route::get('/dashboard', function () {
    return view('dashboard');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['middleware'=>['auth','admin']],function(){
    Route::resource('teacher', TeacherController::class);
});


Route::group(['middleware'=>['auth','teacher']],function(){

Route::resource('appointment', AppointmentController::class);

Route::post('appointment/check', [AppointmentController::class, 'check'])->name('appointment.check');
Route::post('appointment/update', [AppointmentController::class, 'updateTime'])->name('update');

});
