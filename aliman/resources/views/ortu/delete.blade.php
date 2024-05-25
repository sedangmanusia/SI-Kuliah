{{-- resources/views/products/delete.blade.php --}}
@extends('layout.app')

@section('title', 'Hapus Data Orang Tua')

@section('content')
<div class="card">
    <div class="card-header">
        <h1 class="mb-0">Hapus Data Orang Tua</h1>
        <hr />
    </div>
    <div class="card-body">
        <form action="{{ route('ortu.destroy', $ortu->id) }}" method="POST">
            @csrf
            @method('DELETE')
            <div class="row mb-3">
                <div class="col">
                    <label for="nama" class="form-label">Nama</label>
                    <input type="text" id="nama" name="nama" class="form-control" value="{{ $ortu->nama }}" disabled>
                </div>
                <div class="col">
                    <label for="telepon" class="form-label">Telepon</label>
                    <input type="text" id="telepon" name="telepon" class="form-control" value="{{ $ortu->telepon }}" disabled>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="penghasilan" class="form-label">Penghasilan</label>
                    <input type="text" id="penghasilan" name="penghasilan" class="form-control" value="{{ $ortu->penghasilan }}" disabled>
                </div>
            </div>
            <div class="row">
                <div class="d-grid">
                    <button type="submit" class="btn btn-danger">Hapus</button>
                </div>
            </div>
        </form>
        <div class="row mt-3">
            <div class="d-grid">
                <a href="{{ route('ortu.index') }}" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>
</div>
@endsection
