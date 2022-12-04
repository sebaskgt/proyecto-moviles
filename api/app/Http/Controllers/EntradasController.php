<?php

namespace App\Http\Controllers;

use App\Models\{Entrada,Evento};
use Illuminate\Http\Request;
use App\Http\Requests\{EntradasRequest};

class EntradasController extends Controller {

    public function index() {
        return Entrada::all()->load('evento');
    }

    public function store(EntradasRequest $request) {
        $entrada = new Entrada();
        $entrada->cod_evento = $request->cod_evento;
        $entrada->numero_entrada = $request->numero_entrada;
        $entrada->cliente_id = $request->cliente_id;
        $entrada->precio = $request->precio;
        $entrada->save();
        return $entrada;
    }

    public function show(Entrada $entrada, Evento $evento) {
        return $evento->entradas->where('numero_entrada',$entrada->numero_entrada)->first();
    }

    /*
    public function update(Request $request, Entrada $entrada) {
        $entrada->cod_evento = $request->cod_evento;
        $entrada->numero_entrada = $request->numero_entrada;
        $entrada->cliente_id = $request->cliente_id;
        $entrada->precio = $request->precio;
        $entrada->save();
        return $entrada;
    }

    public function destroy(Entrada $entrada) {
        $entrada->delete();
    }
    */
}
