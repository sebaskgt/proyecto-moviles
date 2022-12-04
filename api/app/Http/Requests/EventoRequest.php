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
            'cod_evento' => ['bail','required','max:20',Rule::unique('eventos')->ignoreModel($this->evento)],
            'nombre' => ['bail','required','max:25'],
            'fecha_evento' => ['bail','required'],
            'estado' => ['bail','required','numeric'],
        ];
    }

    public function messages() {
        return [
            'cod_evento.required' => 'Debe ingresar un código para el evento',
            'cod_evento.max' => 'El código debe tener un máximo de 20 caracteres',
            'cod_evento.unique' => 'Este código ya existe',
            'nombre.required' => 'Debe ingresar un nombre para el evento',
            'nombre.max' => 'El nombre debe tener un máximo de 25 caracteres',
            'fecha_evento.required' => 'Debe ingresar la fecha del evento',
            'estado.required' => 'Debe ingresar el estado del evento',
            'estado.required' => 'Estado inválido',
        ];
    }
}
