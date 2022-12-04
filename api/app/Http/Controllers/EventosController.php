<?php

namespace App\Http\Controllers;

use App\Models\Evento;
use Illuminate\Http\Request;
use App\Http\Requests\EventosRequest;
use App\Http\Requests\EventoRequest;

class EventosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Evento::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EventosRequest $request)
    {
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

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function show(Evento $evento)
    {
        return $evento;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function update(EventoRequest $request, Evento $evento)
    {

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

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function destroy(Evento $evento)
    {
        //
    }
}
