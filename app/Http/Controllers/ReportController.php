<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Report;
use Illuminate\Support\Facades\Auth;
use Validator;

class ReportController extends Controller
{
    public function indexAllReport()
    {
        $rp = DB::table('users')
            ->join('report', 'users.nomor_pelanggan', '=', 'report.nomor_pelanggan')
            ->select('report.*', 'users.*')
            ->latest('report.created_at')
            ->get();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $rp
        ]);
    }

    public function indexAuthUserReport()
    {
        $authReport = DB::table('users')
            ->join('report', 'users.nomor_pelanggan', '=', 'report.nomor_pelanggan')
            ->select('report.*', 'users.*')
            ->where('report.nomor_pelanggan', '=', auth()->user()->nomor_pelanggan)
            ->latest('report.created_at')
            ->get();

        return response()->json([
            "status" => true,
            "message" => 'Data Collected',
            "data" => $authReport
        ]);
    }

    public function storeReport(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'keluhan' => 'required|min:4|max:200',
        ]);

        if ($validation->fails()) :
            return response()->json([
                "status" => false,
                "message" => $validation->errors(),
            ], 403);
        endif;

        $user = Report::create([
            "nomor_pelanggan" => auth()->user()->nomor_pelanggan,
            "keluhan" => $request['keluhan']
        ]);

        if ($user) {
            return response()->json([
                "status" => true,
                "message" => 'Pengaduan Berhasil Diajukan',
                "data" => $user
            ]);
        }
    }

    public function destroyReport($id_report)
    {           
        $report_delete = DB::table('report')
        ->where('id_report', $id_report)
        ->where('nomor_pelanggan', '=', auth()->user()->nomor_pelanggan)
        ->delete();
        
        if ($report_delete) {
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
