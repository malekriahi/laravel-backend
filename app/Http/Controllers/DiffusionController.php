<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Diffusion;

class DiffusionController extends Controller
{
    public function index()
    {
        return response()->json(Diffusion::get(), 200);
    }


    public function store(Request $request)
    {
        $diffusion=Diffusion::create($request->all());
        return response()->json($diffusion, 200);
    }

    public function show($id)
    {
        return response()->json(Diffusion::find($id), 201);
    }

    public function update(Request $request, $id)
    {
        $diffusion=Diffusion::find($id);
        $diffusion->update($request->all());
        return response()->json($diffusion, 200);

    }


    public function destroy($id)
    {
        $diffusion=Diffusion::find($id);
        $diffusion->delete();
        return response()->json(null,204);
    }
}
