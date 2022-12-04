<?php

namespace App\Http\Controllers;

use App\Models\Evento;
use Illuminate\Http\Request;
use App\Http\Requests\EventosRequest;
use App\Http\Requests\EventoRequest;

class EventosController extends Controller {

    public function index() {
        return Evento::all();
    }

    public function store(EventosRequest $request) {
        $evento = new Evento();
        $evento->idEvento = $request->idEvento;
        $evento->nombre = $request->nombre;
        $evento->descripcion = $request->descripcion;
        $evento->estado = $request->estado;
        $evento->fechaEvento = $request->fechaEvento;
        $evento->entradas = $request->entradas;
        $evento->precio = $request->precio;
        $evento->save();
        return $evento;
    }

    public function show(Evento $evento) {
        return $evento;
    }

    public function update(EventoRequest $request, Evento $evento) {

        $evento->idEvento = $request->idEvento;
        $evento->nombre = $request->nombre;
        $evento->descripcion = $request->descripcion;
        $evento->estado = $request->estado;
        $evento->fechaEvento = $request->fechaEvento;
        $evento->entradas = $request->entradas;
        $evento->precio = $request->precio;
        $evento->save();
        return $evento;
    }

    public function destroy(Evento $evento) {
        $evento->delete();
    }
}
