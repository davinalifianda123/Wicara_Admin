<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        include 'config.php';
        $db = new Database();
    ?>
    <table border="1">
        <tr>
            <th>No</th>
            <th>Id User</th>
            <th>Role</th>
            <th>Aksi</th>
            <th>Entitas Terkait</th>
            <th>Id entitas</th>
            <th>Nilai Lama</th>
            <th>Nilai Baru</th>
            <th>Tanggal Waktu</th>
        </tr>
        <?php
        $no = 1;
        foreach($db->tampil_audit_log() as $x){
        ?>
        <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $x['id_user']; ?></td>
            <td><?php echo $x['role']; ?></td>
            <td><?php echo $x['aksi']; ?></td>
            <td><?php echo $x['entitas_terkait']; ?></td>
            <td><?php echo $x['id_entitas']; ?></td>
            <td><?php echo $x['nilai_lama']; ?></td>
            <td><?php echo $x['nilai_baru']; ?></td>
            <td><?php echo $x['tanggal_waktu']; ?></td>
        </tr>
        <?php
        }
        ?>
    </table>
</body>
</html>