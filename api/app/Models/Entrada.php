<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entrada extends Model
{
    use HasFactory;
    protected $table = 'entradas';
    protected $primaryKey = 'numero_entrada';
    public $incrementing = false;
    public $timestamps = false;

    public function evento() {
        return $this->belongsTo(Evento::class,'idEvento');
    }
}
