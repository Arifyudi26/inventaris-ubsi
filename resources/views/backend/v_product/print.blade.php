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
            <th>Kategori</th>
            <th>Status</th>
            <th>Nama Produk</th>
            <th>Harga</th>
            <th>Stok</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($data as $row)
        <tr>
            <td> {{ $loop->iteration }}</td>
            <td> {{ $row->category_name }} </td>
            <td>
                @if ($row->status == 1)
                Publis
                @elseif($row->status == 0)
                Blok
                @endif
            </td>
            <td> {{ $row->name }} </td>
            <td>Rp {{ number_format($row->price, 0, ',', '.') }}</td>
            <td> {{ $row->stock }} </td>
        </tr>
        @endforeach
    </tbody>
</table>
<script>
    window.onload = function() {
    window.print();
 }
</script>