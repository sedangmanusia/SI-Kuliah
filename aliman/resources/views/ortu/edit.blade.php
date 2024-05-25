{{-- resources/views/products/edit.blade.php --}}
@extends('layout.app')
  
@section('title', 'ortu')
  
@section('content')
<div class="card">
    <div class="card-header">
        <h1 class="mb-0">Edit Data Orang Tua</h1>
        <hr />

    </div>
    <div class="card-body">
        <form action="{{ route('ortu.update', $ortu->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="row">
                <div class="col mb-3">
                    <label class="form-label">Nama</label>
                    <input type="text" name="nama" class="form-control" placeholder="Title" value="{{ $ortu->nama }}" >
                </div>
                <div class="col mb-3">
                    <label class="form-label">Telepon</label>
                    <input type="text" name="telepon" class="form-control" placeholder="Price" value="{{ $ortu->telepon }}" >
                </div>
            </div>
            <div class="row">
                <div class="col mb-3">
                    <label class="form-label">Penghasilan</label>
                    <input type="text" name="penghasilan" class="form-control" placeholder="Product Code" value="{{ $ortu->penghasilan }}" >
                </div>
            </div>
            <div class="row">
                <div class="d-grid">
                    {{-- <a href="{{ route('ortu.index') }}" class="btn btn-secondary">Kembali</a> --}}
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection