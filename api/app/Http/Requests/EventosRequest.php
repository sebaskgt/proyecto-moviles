<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EventosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'idEvento' => 'required|min:8|max:8|unique:eventos,idEvento',
            'nombre' => 'required',
            'descripcion' => 'required',
            'estado' => 'required',
            'fechaEvento' => 'required',
            'entradas' => 'required|numeric|gte:1',
            'precio' => 'required|numeric|gte:1',
        ];
    }

    public function messages(){
        return[
            'idEvento.required' => 'Campo obligatorio.',
            'idEvento.min' => 'Largo Minimo 8.',
            'idEvento.max' => 'Largo Maximo 8.',
            'idEvento.unique' => ':input ya esta registrado.',
            'nombre.required' => 'Campo obligatorio.',
            'descripcion.required' => 'Campo obligatorio.',
            'estado.required' => 'Campo obligatorio.',
            'fechaEvento.required' => 'Campo obligatorio.',
            'entradas.required' => 'Campo obligatorio.',
            'entradas.numeric' => 'Debe ser un valor numerico.',
            'entradas.gte' => 'Valor mayor o igual a 1.',
            'precio.required' => 'Campo obligatorio.',
            'precio.numeric' => 'Debe ser un valor numerico.',
            'precio.gte' => 'Valor mayor o igual a 1.'

        ];
    }
}
