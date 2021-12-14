<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Berita extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_pusat',
        'headline',
        'content',
    ];

    protected $table = 'berita';

    protected $primaryKey = 'id_news';
}
