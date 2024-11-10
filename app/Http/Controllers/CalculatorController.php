<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CalculatorController extends Controller
{
    public function showForm()
    {
        return view('calculator');
    }

    public function calculate(Request $request)
    {
        $result = 0;

        $num1 = $request->input('num1');
        $num2 = $request->input('num2');
        $operation = $request->input('operation');

        if ($operation == 'add') {
            $result = $num1 + $num2;
        } elseif ($operation == 'subtract') {
            $result = $num1 - $num2;
        } elseif ($operation == 'multiply') {
            $result = $num1 * $num2;
        } elseif ($operation == 'divide') {
            if ($num2 != 0) {
                $result = $num1 / $num2;
            } else {
                $result = 'Error: Division by zero';
            }
        }

        return view('calculator', ['result' => $result]);
    }
}
