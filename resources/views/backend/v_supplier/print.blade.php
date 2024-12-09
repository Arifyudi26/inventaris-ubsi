<style>
    table {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid #ccc;
    }

    table tr td {
        padding: 6px;
        font-weight: normal;
        border: 1px solid #ccc;
    }

    table th {
        border: 1px solid #ccc;
    }
</style>
{{-- <script>
    const data = @json($data);
    console.log(data); 
</script> --}}
<table>
    <tr>
        <td align="left">
            Perihal: {{ $title }} <br>
            Tanggal Awal: {{ $startDate }} s/d Tanggal Akhir: {{ $endDate }}
        </td>
    </tr>
</table>
<p></p>
<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Nama Produk</th>
            <th>kontak person</th>
            <th>Handphone</th>
            <th>Alamat</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($data as $row)
        <tr>
            <td> {{ $loop->iteration }}</td>
            <td> {{ $row->name }} </td>
            <td> {{ $row->contact_person }} </td>
            <td> {{ $row->phone }} </td>
            <td> {{ $row->address }} </td>
        </tr>
        @endforeach
    </tbody>
</table>
<script>
    window.onload = function() {
    window.print();
 }
</script>