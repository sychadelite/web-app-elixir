<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Report;
use Illuminate\Support\Facades\Auth;
use Validator;

class BeritaController extends Controller
{
    public function indexAllBerita()
    {
        $news = DB::table('pusat_pdam')
            ->join('berita', 'pusat_pdam.id_pusat', '=', 'berita.id_pusat')
            ->select('berita.*', 'pusat_pdam.*')
            ->latest('berita.created_at')
            ->get();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $news
        ]);
    }
}
