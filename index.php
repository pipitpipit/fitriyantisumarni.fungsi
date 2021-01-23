<?php
require 'connect.php';

$produk = mysqli_query($conn,"SELECT * FROM products");
$pipip = mysqli_query($conn,"SELECT * FROM product_variants");
$popo = mysqli_query($conn,"SELECT * FROM product_variant_option_id");
$bibi = mysqli_query($conn,"SELECT * FROM product_variant_options");
$bobo = mysqli_query($conn,"SELECT * FROM skus");

?>

<!DOCTYPE html>5
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>magang</title>
</head>

<body>
    <h1>hallo ini tugas saya</h1>

        <b>Tabel Products </b> <bt></br>
        <b>======================</b>
            <br></br>
<table border="1" cellpading="10" cellspacing="0">
<tr>

    <th>no</th>
    <th>id</th>
    <th>name</th>

    </tr>

<?php $no = 1; ?>
<?php foreach ($produk as $data) : ?>


    <tr>

        <td><?= $no; ?> </td>
        <td><?= $data['id']; ?></td>
        <td><?= $data['name'] ?></td>

    </tr>

    <?php $no++; ?>
    <?php endforeach; ?>


</table>
<bt></br>

        <b>product_variants</b> <bt></br>
    <b>=====================</b>
<br></br>

    <table border="1" cellpading="10" cellspacing="0">
<tr>

    <th>no</th>
    <th>variant_id</th>
    <th>product_id</th>
    <th>name</th>

    </tr>

<?php $no = 1; ?>
<?php foreach ($pipip as $data1) : ?>


    <tr>

        <td><?= $no; ?> </td>
        <td><?= $data1['variant_id']; ?></td>
        <td><?= $data1['product_id'] ?></td>
        <td><?= $data1['name'] ?></td>

    </tr>

    <?php $no++; ?>
    <?php endforeach; ?>


 </table>
 <bt></br>

        <b>Tabel product_variant_option_id </b> <bt></br>
    <b>========================</b>
<br></br>


    <table border="1" cellpading="10" cellspacing="0">
<tr>

    <th>no</th>
    <th>product_variant_option_id</th>
    <th>sku_id</th>

    </tr>

<?php $no = 1; ?>
<?php foreach ($popo as $data2) : ?>


    <tr>

        <td><?= $no; ?> </td>
        <td><?= $data2['product_variant_option_id']; ?></td>
        <td><?= $data2['sku_id']; ?></td>

    </tr>

    <?php $no++; ?>
    <?php endforeach; ?>


</table>
<bt></br>

    <b>Tabel Product_variant_options</b> <bt></br>
<b>====================</b>
<br></br>

<table border="1" cellpading="10" cellspacing="0">
<tr>

    <th>no</th>
    <th>id</th>
    <th>product_variant_id</th>
    <th>name</th>

    </tr>

<?php $no = 1; ?>
<?php foreach ($bibi as $data3) : ?>


    <tr>

        <td><?= $no; ?> </td>
        <td><?= $data3['id']; ?></td>
        <td><?= $data3['product_variant_id'] ?></td>
        <td><?= $data3['name'] ?></td>

    </tr>

    <?php $no++; ?>
    <?php endforeach; ?>


</table>

<bt></br>

<b>SKUS</b> <bt></br>
<b>=====</b>
<br></br>

<table border="1" cellpading="10" cellspacing="0">
<tr>

    <th>no</th>
    <th>sku_id</th>
    <th>product_id</th>
    <th>sku</th>
    <th>price</th>

    </tr>

<?php $no = 1; ?>
<?php foreach ($bobo as $data4) : ?>


    <tr>

        <td><?= $no; ?> </td>
        <td><?= $data4['sku_id']; ?></td>
        <td><?= $data4['product_id'] ?></td>
        <td><?= $data4['sku'] ?></td>
        <td><?= $data4['price'] ?></td>

    </tr>

    <?php $no++; ?>
    <?php endforeach; ?>


</table>






    </body>

</html>
        
        