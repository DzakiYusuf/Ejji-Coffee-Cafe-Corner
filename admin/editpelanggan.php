
   
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
   
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
 
                <!-- Begin Page Content -->
                <div class="container-fluid">

            
                    <!-- Page Heading -->

                    <h1 class="h3 mb-2 text-gray-800">Laporan Pembelian</h1>
                    <p class="mb-4">Tabel ini menampilkan laporan pembelian dengan jangka waktu yang dapat dicustomisas</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-dark">Data laporan pembelian</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<?php
include 'koneksi.php';

// Verify the database connection
if ($koneksi->connect_error) {
    die("Connection failed: " . $koneksi->connect_error);
}

// Check if the 'id' parameter is provided
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Prepare and execute the select query
    $query = $koneksi->query("SELECT * FROM pelanggan WHERE id_pelanggan='$id'");
    if (!$query) {
        die("Query failed: " . $koneksi->error);
    }
    $data = $query->fetch_assoc();
}
?>
<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label>Nama Pelanggan</label>
        <input type="text" name="nama_pelanggan" class="form-control" value="<?php echo $data['nama_pelanggan']; ?>">
    </div>
    <div class="form-group">
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
    <button class="btn btn-dark" name="ubah">Ubah</button>
</form>


<?php
if (isset($_POST['ubah'])) {
    // Get the values from the form
    $nama = $_POST['nama_pelanggan'];
    $meja = $_POST['meja'];

    // Update the product with the new values
    $query = $koneksi->query("UPDATE pelanggan SET nama_pelanggan='$nama', meja_pelanggan='$meja' WHERE id_pelanggan='$id'");

    if (!$query) {
        die("Query failed: " . $koneksi->error);
    }

    echo "<script>alert('Data pelanggan telah diubah');</script>";
    echo "<script>location='index.php?halaman=pelanggan';</script>";
}
?>
