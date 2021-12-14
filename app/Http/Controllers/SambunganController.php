<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Sambungan;
use Illuminate\Support\Facades\Auth;
use Validator;

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

    public function storeRequestMembership(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'id_cabang' => 'required',
            'jenis_member' => 'required',
            'nama_alat' => 'required'
        ]);

        if ($validation->fails()) :
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);
        endif;

        $membership = Sambungan::create([
            "nomor_pelanggan" => auth()->user()->nomor_pelanggan,
            "id_cabang" => $request['id_cabang'],
            "jenis_member" => $request['jenis_member'],
            "nama_alat" => $request['nama_alat']
        ]);

        if ($membership) {
            return response()->json([
                "status" => true,
                "message" => 'Request Membership Berhasil Diajukan',
                "data" => $membership
            ]);
        }
    }

    public function indexAllRequestSambungan()
    {
        $rs = DB::table('users')
            ->join('sambungan', 'users.nomor_pelanggan', '=', 'sambungan.nomor_pelanggan')
            ->join('cabang_pdam', 'sambungan.id_cabang', '=', 'cabang_pdam.id_cabang')
            ->select('sambungan.*', 'users.*', 'cabang_pdam.*')
            ->latest('sambungan.created_at')
            ->get();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $rs
        ]);
    }
}
