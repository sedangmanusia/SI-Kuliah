@extends('layout.app')
@section('title','tambah ortu')
@section('content')
<h1 class="h3 mb-2 text-gray-800">Orang Tua</h1>
<div class="row">
    <div class="col-6">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Tambah Data Orang Tua</h6>
            </div>
            <div class="card-body">
            <form action="{{route('ortu.store')}}" method="POST">
                @csrf
                    <div class="form-group">
                        <label>Nama</label>
                        <input type="text" name="nama" class="form-control">
                        @error('nama')
                            {{$message}}
                        @enderror
                    </div>
                    <div class="form-group">
                        <label>Nomor Telepon</label>
                        <input type="text" name="telepon" class="form-control">
                        @error('telepon')
                            {{$message}}
                        @enderror
                    </div>
                    <div class="form-group">
                        <label>Penghasilan</label>
                        <input type="text" name="penghasilan" class="form-control">
                        @error('penghasilan')
                            {{$message}}
                        @enderror
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-save"></i> Simpan</button>
            </form>
            </div>
        </div>
    </div>
</div> 
@endsection