<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        include 'config.php';
        $db = new Database();
        if(isset($_GET['id'])){
            $id_user = $_GET['id'];
            $pengaduan = $db->iduser($id_user);
        }
        else
        {
            echo "aaaa";
            header('Location: tampil_pengaduan.php');
        }
    ?>
    <h3>Edit Data Peminjam</h3>
    <form action="simpan_edit_pengaduan.php" method="POST">
        <input type="hidden"  name="kode_user" value="<?php echo $pengaduan[0]['id_user'];?>"/>
        <table>
            <tr>
                    <td>Id User</td>
                    <td><input type="text" name="id_user" value="<?php echo $pengaduan[0]['id_user'];?>" disabled></td>
                </tr>
                <tr>   
                    <td>Judul</td>
                    <td><input type="text" name="judul" value="<?php echo $pengaduan[0]['judul'];?>"></td>
                </tr>
                <tr>
                    <td>Deskripsi</td>
                    <td><input type="text" name="deskripsi" value="<?php echo $pengaduan[0]['deskripsi'];?>"></td>
                </tr>
                <tr>
                    <td>Jenis Pengaduan</td>
                    <td><input type="text" name="id_jenis_pengaduan" value="<?php echo $pengaduan[0]['nama_jenis_pengaduan'];?>"></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><textarea name="status" cols="30" rows="10"><?php echo $pengaduan[0]['status'];?></textarea></td>
                </tr>
                <tr>
                    <td>Lokasi</td>
                    <td><input type="text" name="lokasi" value="<?php echo $pengaduan[0]['lokasi'];?>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Simpan"></td>
                </tr>
        </table>
    </form>
</body>
</html>