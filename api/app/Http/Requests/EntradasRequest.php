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
            'idEvento' => ['bail','required','max:20','exists:eventos,idEvento'],
            'numero_entrada' => ['bail','required','numeric','gte:1'],
            'cliente_id' => ['bail','required'],
        ];
    }

    public function messages() {
        return [
            'idEvento.required' => 'Debe ingresar el evento correspondiente',
            'idEvento.max' => 'El código de evento es inválido',
            'idEvento.exists' => 'El código de evento no existe',
            'numero_entrada.required' => 'Debe agregar el número de la entrada',
            'numero_entrada.numeric' => 'La entrada debe tener un valor numérico',
            'numero_entrada.gte' => 'La entrada debe ser mayor a 0',
            'cliente_id.required' => 'Debe agregar al comprador de la entrada',
        ];
    }
}
