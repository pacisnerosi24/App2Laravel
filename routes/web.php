<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CalculatorController;

Route::get('/', [CalculatorController::class, 'showForm']);
Route::post('/calculate', [CalculatorController::class, 'calculate']);
