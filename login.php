<?php
session_start();
include 'koneksi.php';

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="admin/assets/css/menu.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <title>Login Pelanggan</title>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand"><img class="navbar-brand" src="admin/assets/img/logo.png" alt=""></a>
            <form class="d-flex">
            <a class="nav-link" style="color: #F2F1EF;" href="https://api.whatsapp.com/send?phone=6285161060878"
                    tabindex="-1" target="_blank">Help +62 851-6106-0878</a>
            </form>
        </div>
    </nav>

    <div class="container mb-4 mt-4">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-tittle">Informasi Pelanggan</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" action="">
                            <div class="form-group">
                                <label >Nama</label>
                                <input type="text" class="form-control" name="nama" required>
                            </div>
                           
                                <div class="form-group">
    <label>Meja</label>
    <select class="form-control" name="meja" required>
        <option value="" selected disabled>Pilih Meja</option>
        <?php
        $query = $koneksi->query("SELECT meja_pelanggan FROM pelanggan");
        $meja_terisi = array();
        while ($data = $query->fetch_assoc()) {
            $meja_terisi[] = $data['meja_pelanggan'];
        }

        for ($i = 1; $i <= 14; $i++) {
            if (!in_array($i, $meja_terisi)) {
                echo "<option value='$i'>$i</option>";
            }
        }
        ?>
    </select>
</div>
                            </div>
                            <br>
                            <a href="keranjang.php" class="btn btn-outline-dark">Kembali ke Keranjang</a>
                            <button class="btn btn-primary" name="simpan">Simpan</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <?php
    //jika ada tombol simpan ditekan
    if (isset($_POST["simpan"])) {
        $nama = $_POST["nama"];
        $meja = $_POST["meja"];
    
        // Check if the table is available
        $query = $koneksi->query("SELECT * FROM pelanggan WHERE meja_pelanggan='$meja'");
        $jumlah_meja_terisi = $query->num_rows;
    
        if ($jumlah_meja_terisi > 0) {
            // The table is occupied
            echo "<script>alert('Maaf, meja telah terisi. Silakan pilih meja lain.');</script>";
            echo "<script>location='login.php'</script>";
        } else {
            // The table is available, proceed with saving customer data
            $koneksi->query("INSERT INTO pelanggan (nama_pelanggan, meja_pelanggan) VALUES ('$nama', '$meja')");
            $id_pelanggan = $koneksi->insert_id;
    
            // Save the customer information in the session
            $_SESSION["pelanggan"]["id_pelanggan"] = $id_pelanggan;
            $_SESSION["pelanggan"]["nama_pelanggan"] = $nama;
            $_SESSION["pelanggan"]["meja_pelanggan"] = $meja;
    
            echo "<script>alert('Data nomor meja telah disimpan');</script>";
            echo "<script>location='checkout.php'</script>";
        }
    }

    ?>
</body>
</html>