<?php
    class database{
        var $host = "localhost";
        var $username = "root";
        var $password = "";
        var $database = "wicara";
        var $koneksi;
        function __construct(){
            $this->koneksi = mysqli_connect($this->host, $this->username, $this->password, $this->database);
            if (mysqli_connect_errno()){
                echo "Koneksi database gagal : " . mysqli_connect_error();
            }
        }
        function tampil_data()
        {
            $data = mysqli_query($this->koneksi, "select a.judul,a.id_user,a.id_jenis_pengaduan,a.status_pengaduan,a.status_kehilangan,a.id_instansi from kejadian a
                                                                INNER JOIN jenis_pengaduan b ON b.id_jenis_pengaduan = a.id_jenis_pengaduan
                                                                INNER JOIN user c ON c.id_user = a.id_user
                                                                INNER JOIN instansi d ON d.id_instansi = a.id_instansi
                                                                INNER JOIN status_kehilangan e ON e.id_status_kehilangan = a.status_kehilangan
                                                                INNER JOIN status_pengaduan f ON f.id_status_pengaduan = a.status_pengaduan
                                                                WHERE 1");
            while ($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
            
        }

        function tampil_jenis_pengaduan()
        {
            $data = mysqli_query($this->koneksi, "select * from jenis_pengaduan");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function tampil_instansi()
        {
            $data = mysqli_query($this->koneksi, "select * from instansi");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function tampil_jenis_kejadian()
        {
            $data = mysqli_query($this->koneksi, "select * from jenis_kejadian");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function tampil_audit_log()
        {
            $data = mysqli_query($this->koneksi, "select * from audit_log");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function tampil_role()
        {
            $data = mysqli_query($this->koneksi, "select * from role");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function tampil_status_kehilangan()
        {
            $data = mysqli_query($this->koneksi, "select * from status_kehilangan");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function tampil_user()
        {
            $data = mysqli_query($this->koneksi, "select * from user");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function tampil_status_pengaduan()
        {
            $data = mysqli_query($this->koneksi, "select * from status_pengaduan");
            while($row = mysqli_fetch_array($data)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function iduser($id_user){
            $pengaduan = mysqli_query($this->koneksi,"select a.*, b.* from pengaduan a
                                        INNER JOIN jenis_pengaduan b ON b.nomer_pengaduan = a.id_jenis_pengaduan
                                        where a.id_user ='$id_user'");
            while($row = mysqli_fetch_assoc($pengaduan)){
                $hasil[] = $row;
            }
            return $hasil;
        }

        function edit_pengaduan($id_user,$judul,$deskripsi,$id_jenis_pengaduan,$status,$lokasi)
        {
            mysqli_query($this->koneksi,"UPDATE pengaduan set id_user = '$id_user', judul = '$judul',
                            deskripsi = '$deskripsi',id_jenis_pengaduan = '$id_jenis_pengaduan',status = '$status',lokasi = '$lokasi' where id_user = '$id_user'");
        }

        function tambah_data_pengaduan($id_user,$judul,$deskripsi,$id_jenis_pengaduan,$status,$lokasi){
            mysqli_query($this->koneksi, "insert into pengaduan (id_pengaduan, id_user, judul,
                                        deskripsi, id_jenis_pengaduan,status,lokasi)
                                        values
                                        ('', '$id_user', '$judul','$deskripsi',
                                        '$id_jenis_pengaduan','$status','$lokasi')");
        }
    }
?>