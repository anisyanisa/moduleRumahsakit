<?php
include "../config/koneksi.php";
error_reporting(0);
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <?php
  //Script php
  switch ($_GET['act']) {
    default: //kondisi default. kondisi default ini untuk menampilkan tabel yang berisikan semua data
      //kita akan membuat script HTML disini untuk menampilkan tabel, sehingga harus kita tutup script php sebelumnya.


  ?>
      <table id="example" class="table table-striped" style="width:100%">
        <thead>
          <tr align="center">
            <th>No.</th>
            <th>Kode Spesialis</th>
            <th>Nama Spesialis</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>


          <?php
          
          $no = 1;

          $res = mysqli_query($conn, "SELECT * FROM spesialisdokter ORDER BY kodespesialis ASC") or die(mysqli_error($conn));
          while ($row = mysqli_fetch_array($res)) { //$res berasal dari baris 35


          ?>
            <tr class="odd gradeX">
              <td align="center"><?php echo $no; ?></td>
              <td align="center"><?php echo $row['kodespesialis']; //$row berasal dari baris 36 ?></td>
              <td align="center"><?php echo $row['spesialis']; ?></td>
              <td align="center"><a href="?act=edit&id=<?php echo $row['kodespesialis']; ?>"> <i title="rubah" class="fa fa-edit">EDIT</i></a> |
                <a href=""> <i title="hapus" class="fa fa-trash">HAPUS</i></a>
              </td>


            </tr>
          <?php $no++;
          } ?> <!-- Akhir While-->
        </tbody>

        <?php ?> <!-- Akhir ELSE IF-->

      </table>


    <?php
    break;
    case "add": //menampilkan form untuk menambah data baru
      

      //kita akan memindahkan script form simpan sebelumnya setelah case "add". script tersebut merupakan script HTML, sehingga harus kita tutup script php sebelumnya.
    ?>
      <!-- FORM TAMBAH DATA BARU -->
      <form name="form1" method="post" action="simpan.php">
        <p>
        <h1>Form Spesialis Dokter</h1>
        </p>
        <p>Kode :
          <input type="text" name="kodespesialis" id="textfield">
        </p>
        <p>Spesialis :
          <input type="text" name="spesialis" id="textfield">
        </p>
        <p>
          <input type="submit" name="btnsimpan" id="submit" value="SIMPAN">
        </p>
      </form>



  <?php
  break;
    case "edit": //menampilkan form yang berisikan data yang telah ada

      $id=$_GET['id']; //id didalam kutip merupakan variabel yang kita kirim dari link di baris 44. Namun $id ssebelum "=" boleh berbeda.

    $q=mysqli_query($conn,"SELECT * FROM spesialisdokter WHERE kodespesialis='$id'") or die(mysqli_error($conn));
    $row=mysqli_fetch_array($q);

      ?>
    <form name="form1" method="post" action="ubah.php">
        <p>
        <h1>Form Update Spesialis Dokter</h1>
        </p>
        <p>Kode :
          <input type="text" name="kodespesialis" id="textfield" disabled value="<?php echo $row['kodespesialis']; ?>">
          <input type="hidden" name="kodespesialis" value="<?php echo $row['kodespesialis']; ?>">
        </p>
        <p>Spesialis :
          <input type="text" size="30" name="spesialis" id="textfield" value="<?php echo $row['spesialis']; ?>">
        </p>
        <p>
          <input type="submit" name="btnsimpan" id="submit" value="UPDATE">
        </p>
      </form>



<?php
      break;
  }


  ?>


</body>

</html>