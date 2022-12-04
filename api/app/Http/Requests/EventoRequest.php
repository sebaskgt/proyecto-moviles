<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class EventoRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'idEvento' => ['bail','required','max:8','min:8',Rule::unique('eventos')->ignoreModel($this->evento)],
            'nombre' => ['required'],
            'descripcion' => 'required',
            'fechaEvento' => ['bail','required'],
            'estado' => ['required'],
            'entradas' => 'required|numeric|gte:1',
            'precio' => 'required|numeric|gte:1',
        ];
    }

    public function messages() {
        return [
            'idEvento.required' => 'Campo obligatorio.',
            'idEvento.min' => 'Largo Minimo 8.',
            'idEvento.max' => 'Largo Maximo 8.',
            'idEvento.unique' => ':input ya esta registrado.',
            'nombre.required' => 'Debe ingresar un nombre para el evento',
            'fechaEvento.required' => 'Debe ingresar la fecha del evento',
            'estado.required' => 'Debe ingresar el estado del evento',
            'descripcion.required' => 'Campo obligatorio.',
            'entradas.required' => 'Campo obligatorio.',
            'entradas.numeric' => 'Debe ser un valor numerico.',
            'entradas.gte' => 'Valor mayor o igual a 1.',
            'precio.required' => 'Campo obligatorio.',
            'precio.numeric' => 'Debe ser un valor numerico.',
            'precio.gte' => 'Valor mayor o igual a 1.'
        ];
    }
}
