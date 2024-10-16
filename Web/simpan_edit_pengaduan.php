<?php
    include('config.php');
    $koneksi = new database();
    $koneksi->edit_pengaduan($_POST['id_user'],$_POST['judul'],
                            $_POST['deskripsi'],$_POST['id_jenis_pengaduan'],$_POST['status'],$_POST['lokasi']);
    header('location:tampil_pengaduan.php');
?>