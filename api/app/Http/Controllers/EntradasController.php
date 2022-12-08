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
        $entrada->idEvento = $request->idEvento;
        $entrada->numero_entrada = $request->numero_entrada;
        $entrada->cliente_id = $request->cliente_id;
        $entrada->save();
        return $entrada;
    }

    public function show(Entrada $entrada, Evento $evento) {
        return Entrada::where('numero_entrada',$entrada->numero_entrada)->where('idEvento',$evento->idEvento)->first()->load('evento');
    }

    public function entradasCompradas(Request $request) {
        return Entrada::where('cliente_id',$request->cliente_id)->get()->load('evento');
    }

    /*
    public function update(Request $request, Entrada $entrada) {
        $entrada->idEvento = $request->idEvento;
        $entrada->numero_entrada = $request->numero_entrada;
        $entrada->cliente_id = $request->cliente_id;
        $entrada->save();
        return $entrada;
    }

    public function destroy(Entrada $entrada) {
        $entrada->delete();
    }
    */
}
