<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sambungan extends Model
{
    use HasFactory;

    protected $fillable = [
        'nomor_pelanggan',
        'id_cabang',
        'jenis_member',
        'nama_alat',
        'kondisi_alat',
    ];

    protected $table = 'sambungan';

    protected $primaryKey = 'nomor_sambungan';
}
