<!DOCTYPE html>
<html>
<head>
    <title>PDF</title>
    <style>
        .table, th, td{
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h1>Data Orang Tua</h1>
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
            <tr class="text-center">
                <th>No</th>
                <th>Nama</th>
                <th>Telepon</th>
                <th>Penghasilan</th>
            </tr>
        </thead>
        <tbody>
            <?php $no = 1; ?>
            @foreach ($data as $row)
            <tr class="text-center">
                <td>{{$no++}}</td>
                <td>{{$row->nama}}</td>
                <td>{{$row->telepon}}</</td>
                <td>{{$row->penghasilan}}</</td>
            </tr>
            @endforeach
            
        </tbody>
    </table>
</body>
</html>