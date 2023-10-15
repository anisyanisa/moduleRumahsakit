<?php
error_reporting(E_ALL);
    include "../config/koneksi.php";

    $kd=$_POST['kodespesialis'];
    $spesialis=$_POST['spesialis'];

    $b=mysqli_query($conn,"INSERT INTO spesialisdokter VALUES('$kd','$spesialis')")or die(mysqli_error($conn));

    if($b)
    {
        echo "<script>alert('Data Spesialis Berhasil ditambahkan..!!')</script>";
        echo "<script>window.location.href='spesialisdokter.php';</script>";
      
    }
    else
    {
        echo "Gagal Menyimpan Data Spesialis ";
        
    }

?>