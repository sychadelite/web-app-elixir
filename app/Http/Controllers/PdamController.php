<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PdamController extends Controller
{
    public function indexPdamPusat()
    {
        $pusat_pdam = DB::table('pusat_pdam')->get();
        return response()->json($pusat_pdam);
    }

    public function indexCabangPdam()
    {
        $cabang_pdam = DB::table('cabang_pdam')->get();
        return response()->json($cabang_pdam);
    }

}
