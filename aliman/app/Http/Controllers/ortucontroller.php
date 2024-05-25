<?php

namespace App\Http\Controllers;

use App\Models\ortu;
use Illuminate\Http\Request;
use PDF;
class ortucontroller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('ortu.index',[
            'ortu'=> ortu::latest()->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('ortu.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required',
            'telepon' => 'required',
            'penghasilan' => 'required',
        ]);

        ortu::create([
            'nama'=>$request->nama,
            'telepon'=>$request->telepon,
            'penghasilan'=>$request->penghasilan,
        ]);

        return redirect()->route('ortu')->with('message', 'Data  berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $ortu = ortu::findOrFail($id);
  
        return view('ortu.show', compact('ortu'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit( $id)
    {
        $ortu = ortu::findOrFail($id);
  
        return view('ortu.edit', compact('ortu'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $ortu = ortu::findOrFail($id);
  
        $ortu->update($request->all());
  
        return redirect()->route('ortu')->with('success', 'Data berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy( $id)
    {
        $ortu = ortu::findOrFail($id);
  
        $ortu->delete();
  
        return redirect()->route('ortu')->with('success', 'Data berhasil dihapus');
    }

    public function generatePDF()
    {
        $data = [
            'title' => 'Welcome to Laravel PDF',
            'data' =>ortu::all()
        ];

        $pdf = PDF::loadView('myPDF', $data)->setPaper('A4', 'Landscape');

        return $pdf->download('document.pdf');
    }
}
