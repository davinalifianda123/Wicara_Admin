<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3>Tambah Data Pengaduan</h3>
    <form action="simpan_pengaduan.php" method="post">
    <table>
        <tr>
            <td>Id User</td>
            <td><input type="text" name="id_user"></td>
        </tr>
        <tr>
            <td>Judul</td>
            <td><input type="text" name="judul"></td>
        </tr>
        <tr>
            <td>Deskripsi</td>
            <td><input type="text" name="deskripsi"></td>
        </tr>
        <tr>
            <td>Id Jnis Pengaduan</td>
            <td><input type="text" name="id_jenis_pengaduan"></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><textarea name="status"></textarea></td>
        </tr>
        <tr>
            <td>Lokasi</td>
            <td><input type="text" name="lokasi"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Simpan"></td>
        </tr>
    </table>
    </form>
</body>
</html>