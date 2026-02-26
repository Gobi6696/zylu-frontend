<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    /**
     * Display a listing of all employees.
     */
    public function index()
    {
        // Fetch all employees from the database
        $employees = Employee::all();
        
        // Return as JSON for the Flutter app
        return response()->json($employees);
    }
}
