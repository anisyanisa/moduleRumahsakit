<?php
error_reporting(E_ALL);
    include "../config/koneksi.php";

    $kd=$_POST['kodespesialis'];
    $spesialis=$_POST['spesialis'];

    $b=mysqli_query($conn,"UPDATE spesialisdokter SET spesialis='$spesialis' where kodespesialis='$kd'")or die(mysqli_error($conn));//text warna merah diluar kutip = nama tabel dan field di database kita.
    //text $spesialis dan $kd yang berada di dalam kutip berasal dari baris 5 dan 6.

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