<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['cors', 'json.response']], function () {
    Route::post('/login', 'Auth\ApiAuthController@login')->name('login.api');
    Route::post('/register','Auth\ApiAuthController@register')->name('register.api');
});

Route::middleware('auth:api')->group(function () {
    Route::get('/loans', 'LoanController@index')->name('loan-index');
    Route::post('/loan/create', 'LoanController@create')->name('loan-create');
    Route::get('/loan/detail', 'LoanController@detail')->name('loan-detail');
    Route::post('/loan/repay', 'LoanController@repayment')->name('loan-repayment');


    Route::prefix('admin')->group(function () {
        Route::post('/loan/approve', 'Admin\AdminController@AproveLoanRequest')->name('aproveLoanRequest');
    });
});