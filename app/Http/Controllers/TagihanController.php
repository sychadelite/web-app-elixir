<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Tagihan;
use Illuminate\Support\Facades\Auth;
use Validator;

class TagihanController extends Controller
{
    public function indexAllTagihan()
    {
        $tu = DB::table('users')
            ->join('sambungan', 'users.nomor_pelanggan', '=', 'sambungan.nomor_pelanggan')
            ->join('tagihan_user', 'sambungan.nomor_sambungan', '=', 'tagihan_user.nomor_sambungan')
            ->select('tagihan_user.*', 'users.nomor_pelanggan', 'users.name', 'users.alamat', 'users.email', 'users.status')
            ->latest('tagihan_user.created_at')
            ->get();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $tu
        ]);
    }

    public function indexCountAllTagihan()
    {
        $row = DB::table('users')
            ->join('sambungan', 'users.nomor_pelanggan', '=', 'sambungan.nomor_pelanggan')
            ->join('tagihan_user', 'sambungan.nomor_sambungan', '=', 'tagihan_user.nomor_sambungan')
            ->select('tagihan_user.*', 'users.nomor_pelanggan', 'users.name', 'users.alamat', 'users.email', 'users.status')
            ->latest('tagihan_user.created_at')
            ->get();

        $wordCount = $row->count();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $wordCount
        ]);
    }

    public function indexAuthUserTagihan()
    {
        $authTagihan = DB::table('users')
            ->join('sambungan', 'users.nomor_pelanggan', '=', 'sambungan.nomor_pelanggan')
            ->join('tagihan_user', 'sambungan.nomor_sambungan', '=', 'tagihan_user.nomor_sambungan')
            ->select('tagihan_user.*', 'users.nomor_pelanggan', 'users.name', 'users.alamat', 'users.email', 'users.status')
            ->where('sambungan.nomor_pelanggan', '=', auth()->user()->nomor_pelanggan)
            ->latest('tagihan_user.created_at')
            ->get();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $authTagihan
        ]);
    }

    public function indexAuthUserTagihanSum()
    {
        $purchases = DB::table('users')
            ->join('sambungan', 'users.nomor_pelanggan', '=', 'sambungan.nomor_pelanggan')
            ->join('tagihan_user', 'sambungan.nomor_sambungan', '=', 'tagihan_user.nomor_sambungan')
            ->where('sambungan.nomor_pelanggan', '=', auth()->user()->nomor_pelanggan)
            ->where('tagihan_user.status_tagihan', '=', 'belum lunas')
            ->sum(DB::raw('jumlah * biaya'));

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $purchases
        ]);
    }

    public function storeTagihan(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'keluhan' => 'required|min:4|max:200',
            'keterangan' => 'required',
            'jumlah' => 'required',
            'biaya' => 'required',
            'foto' => 'required',
        ]);

        if ($validation->fails()) :
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);
        endif;

        $tagihan = Report::create([
            'nomor_sambungan' => auth()->user()->nomor_sambungan,
            'keterangan' => $request['keterangan'],
            'jumlah' => $request['jumlah'],
            'biaya' => $request['biaya'],
            'foto' => $request['foto'],
        ]);

        if ($tagihan) {
            return response()->json([
                "status" => true,
                "message" => 'Tagihan Berhasil Dibayar',
                "data" => $tagihan
            ]);
        }
    }

    public function destroyTagihan($id_tagihan)
    {           
        $tagihan_delete = DB::table('tagihan_user')
        ->where('id_tagihan', $id_tagihan)
        ->where('nomor_pelanggan', '=', auth()->user()->nomor_pelanggan)
        ->delete();
        
        if ($tagihan_delete) {
            return response()->json([
                'status' => true,
                'message' => 'Laporan berhasil dihapus'
            ]);
        }

        return response()->json([
            'status' => false,
            'message' => 'Not Accepted'
        ], 401);
        
    }
}
