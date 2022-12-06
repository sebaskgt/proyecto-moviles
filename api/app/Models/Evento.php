<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Evento extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'eventos';
    protected $primaryKey = 'idEvento';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;
    protected $appends = ['entradas_vendidas'];

    public function entradas() {
        return $this->hasMany(Entrada::class,'numero_entrada');
    }

    public function getEntradasVendidasAttribute() {
        return count($this->entradas);
    }
}
