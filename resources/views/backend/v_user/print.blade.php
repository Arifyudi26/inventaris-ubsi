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
         <th>Email</th>
         <th>Nama</th>
         <th>Role</th>
         <th>Status</th>
     </tr>
 </thead>
 <tbody>
     @foreach ($data as $row)
         <tr>
             <td>{{ $loop->iteration }}</td>
             <td>{{ $row->email }}</td>
             <td>{{ $row->name }}</td>
             <td>
                 @if ($row->role == 1)
                     Super Admin
                 @elseif ($row->role == 0)
                     Admin
                 @endif
             </td>
             <td>
                 @if ($row->status == 1)
                     Aktif
                 @elseif ($row->status == 0)
                     NonAktif
                 @endif
             </td>
         </tr>
     @endforeach
 </tbody>
</table>

<script>
 window.onload = function() {
    window.print();
 }
</script>
