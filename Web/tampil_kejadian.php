<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="pengaduan.css">
    <title>Document</title>
</head>
<body>
    <h1>Data Master</h1>
    <?php
        include 'config.php';
        $db = new Database();
    ?>
    <table border="1">
    <tr>
        <th>No</th>               
        <th>Judul</th>        
        <th>Deskripsi</th>               
        <th>Lokasi</th>   
        <th>Tanggal</th>
        <th>Lampiran</th>
        <th>Jenis Barang</th>               
        <th>Isi Komentar</th>        
        <th>Skala Bintang</th>               
        <th>Id Jenis Pengaduan</th>   
        <th>Id User</th>
        <th>Id Instansi</th>
        <th>Status Pengaduan</th>
        <th>Status Kehilangan</th>
        <th>Tanggal Kadaluarsa</th>
    
    </tr>
    <?php
    $no = 1;
    foreach($db->tampil_data() as $x){
    ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo $x['judul'];?> </td>
        <td><?php echo $x['deskripsi']; ?></td>
        <td><?php echo $x['lokasi']; ?></td>
        <td><?php echo $x['tanggal']; ?></td>
        <td><?php echo $x['lampiran']; ?></td>
        <td><?php echo $x['jenis_barang']; ?></td>
        <td><?php echo $x['isi_komentar']; ?></td>
        <td><?php echo $x['skala_bintang']; ?></td>
        <td><?php echo $x['nama_jenis_pengaduan']; ?></td>
        <td><?php echo $x['nama']; ?></td>
        <td><?php echo $x['nama_instansi']; ?></td>
        <td><?php echo $x['status_pengaduan']; ?></td>
        <td><?php echo $x['status_kehilangan']; ?></td>
        <td><?php echo $x['tanggal_kadaluarsa']; ?></td>
        <td><a href="edit_pengaduan.php?id=<?php echo $x['id_user']; ?>">Edit</a></td>
    </tr>
    <?php
    }
    ?>
    </table>
    <h1></h1>
    <button>Tambah</button>
</body>
</html>
