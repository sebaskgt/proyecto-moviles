<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EntradasRequest extends FormRequest {
    public function authorize() {
        return true;
    }

    public function rules()
    {
        return [
            'cod_evento' => ['bail','required','max:20','exists:eventos,cod_evento'],
            'numero_entrada' => ['bail','required','numeric','gte:1'],
            'cliente_id' => ['bail','required'],
            'precio' => ['bail','required','numeric','gte:1'],
        ];
    }

    public function messages() {
        return [
            'cod_evento.required' => 'Debe ingresar el evento correspondiente',
            'cod_evento.max' => 'El código de evento es inválido',
            'cod_evento.exists' => 'El código de evento no existe',
            'numero_entrada.required' => 'Debe agregar el número de la entrada',
            'numero_entrada.numeric' => 'La entrada debe tener un valor numérico',
            'numero_entrada.gte' => 'La entrada debe ser mayor a 0',
            'cliente_id.required' => 'Debe agregar al comprador de la entrada',
            'precio.required' => 'Debe agregar el precio de la entrada',
            'precio.numeric' => 'El precio debe ser un valor numérico',
            'precio.gte' => 'El precio debe ser mayor a 1',
        ];
    }
}
