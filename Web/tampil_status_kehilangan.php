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
            <th>Nama</th>
        </tr>
        <?php
        $no = 1;
        foreach ($db->tampil_status_kehilangan() as $x) {
        ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $x['nama_status_kehilangan']; ?></td>

            </tr>
        <?php
        }
        ?>
    </table>
</body>
</html>