<?php

namespace App\Http\Controllers;

use App\Models\ortu;
use Illuminate\Http\Request;

class ortucontroller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $ortu = ortu::orderBy('nama', 'DESC')->get();
  
        return view('ortu.index', compact('ortu'));
        //return view('ortu.index');
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
        ortu::create($request->all());
 
        return redirect()->route('ortu')->with('success', 'Ortu added successfully');
        // $request->validate(
        //     [
        //         'nama-ortu' => 'required',
        //         'penghasilan' => 'required',
        //     ]
        //     );
        //  $data  = [
        //      'id-ortu' => $request-> id,
        //     'nama-ortu' => $request-> nama,
        //      'penghasilan' => $request-> penghasilan,
        //     'jumlah-tanggungan' => $request-> tanggungan,
        //  ];
        // //ortu::create($request->all());
        // ortu::create($data);
        // return redirect()->route('ortu.index')->with('success','Post created successfully.');
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
    public function edit(string $id)
    {
        $ortu = ortu::findOrFail($id);
  
        return view('ortu.edit', compact('ortu'));

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $ortu = ortu::findOrFail($id);
  
        $ortu->update($request->all());
  
        return redirect()->route('ortu')->with('success', 'product updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $ortu = ortu::findOrFail($id);
  
        $ortu->delete();
  
        return redirect()->route('ortu')->with('success', 'product deleted successfully');

    }
}
