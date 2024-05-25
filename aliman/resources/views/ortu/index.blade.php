@extends('layout.app')
@section('title','ortu')
@section('content')
    <!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Orang Tua</h1>

@if (session('message'))
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    {{session('message')}}
  </div>
@endif

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <a href="{{route('ortu.create')}}" class="btn btn-primary btn-sm"><i class="fas fa-plus"></i> Tambah</a>
        <a href="{{ URL('generate-pdf') }}" class="btn btn-primary btn-sm"><i class="fas fa-plus"></i> Report</a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr class="text-center">
                        <th>No</th>
                        <th>Nama</th>
                        <th>Telepon</th>
                        <th>Penghasilan</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; ?>
                    @foreach ($ortu as $row)
                    <tr class="text-center">
                        <td>{{$no++}}</td>
                        <td>{{$row->nama}}</td>
                        <td>{{$row->telepon}}</</td>
                        <td>{{$row->penghasilan}}</</td>
                        <td>
                            <a href="{{ route('ortu.edit', $row->id) }}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i>Edit</a>
                            <form action="{{ route('ortu.destroy', $row->id) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i>Delete</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
