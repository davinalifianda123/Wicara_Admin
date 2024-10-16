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
            <th>Nomer Induk</th>
            <th>Nomer Telepon</th>
            <th>Email</th>
            <th>Password</th>
            <th>Role</th>
        </tr>
        <?php
        $no = 1;
        foreach ($db->tampil_user() as $x) {
        ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $x['nama']; ?></td>
                <td><?php echo $x['nomer_induk']; ?></td>
                <td><?php echo $x['nomer_telepon']; ?></td>
                <td><?php echo $x['email']; ?></td>
                <td><?php echo $x['password']; ?></td>
                <td><?php echo $x['role']; ?></td>
            </tr>
        <?php
        }
        ?>
    </table>
</body>
</html>