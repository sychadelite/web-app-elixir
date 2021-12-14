<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tagihan extends Model
{
    use HasFactory;

    protected $fillable = [
        'nomor_sambungan',
        'keterangan',
        'jumlah',
        'biaya',
        'foto',
    ];

    protected $table = 'tagihan_user';

    protected $primaryKey = 'id_tagihan';
}
