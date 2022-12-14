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

    public function entradasR() {
       return $this->hasMany(Entrada::class,'idEvento');
    }

    public function getEntradasVendidasAttribute() {
       return $this->entradasR()->count();
    }
}
