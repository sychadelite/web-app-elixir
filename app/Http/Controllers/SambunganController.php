<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SambunganController extends Controller
{
    public function indexSambungan()
    {
        $sambungan = DB::table('sambungan')->get();
        return response()->json($sambungan);
    }
    
    public function indexDataSambungan()
    {
        $dataSambungan = DB::table('data_sambungan')->get();
        return response()->json($dataSambungan);
    }
}
