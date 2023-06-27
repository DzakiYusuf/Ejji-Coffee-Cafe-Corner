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
                    <h1 class="h3 mb-2 text-gray-800">Produk</h1>
                    <p class="mb-4">Halaman ini dapat mengubah data isi menu</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-dark">Data pembelian</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<?php
$query = $koneksi->query("SELECT *FROM produk WHERE id_produk='$_GET[id]'");
$data = $query->fetch_assoc();

?>
<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label>Nama Produk</label>
        <input type="text" name="nama" class="form-control" value="<?php echo $data['nama_produk']; ?>">
    </div>
    <div class="form-group">
        <label>Harga Rp</label>
        <input type="text" name="harga" class="form-control" value="<?php echo $data['harga_produk']; ?>">
    </div>
    <div class="form-group">
        <img src="fotoproduk/<?php echo $data['foto_produk']; ?>" width="200">
    </div>
    <div class="form-group">
        <label>Ganti Foto</label>
        <div class="custom-file">
            <input type="file" class="custom-file-input" id="customFile" name="foto">
            <label class="custom-file-label" for="customFile">Choose file</label>
        </div>
    </div>
    <div class="form-group">
        <label>Deskripsi</label>
        <textarea name="deskripsi" cols="30" rows="10" class="form-control"><?php echo $data['deskripsi_produk']; ?></textarea>
    </div>
    <div class="form-group">
        <label>Stok</label>
        <input type="text" name="stok" class="form-control" value="<?php echo $data['stok_produk']; ?>">
    </div>
    <button class="btn btn-dark btn-browse-file" name="ubah">Ubah</button>
</form>
<?php
if (isset($_POST['ubah'])) {
    // Get the current data for the product
    $query = $koneksi->query("SELECT * FROM produk WHERE id_produk='$_GET[id]'");
    $data = $query->fetch_assoc();

    // Get the values from the form
    $nama = $_POST['nama'];
    $harga = $_POST['harga'];
    $deskripsi = $_POST['deskripsi'];
    $stok = $_POST['stok'];

    // Check if a new image is selected
    if (!empty($_FILES['foto']['tmp_name'])) {
        $namafoto = $_FILES['foto']['name'];
        $lokasifoto = $_FILES['foto']['tmp_name'];
        move_uploaded_file($lokasifoto, "fotoproduk/$namafoto");
    } else {
        // If no new image is selected, use the existing image
        $namafoto = $data['foto_produk'];
    }

    // Update the product with the new values
    $koneksi->query("UPDATE produk SET nama_produk='$nama', harga_produk='$harga',
        foto_produk='$namafoto', deskripsi_produk='$deskripsi', stok_produk='$stok'
        WHERE id_produk='$_GET[id]'");

    echo "<script>alert('data produk telah diubah');</script>";
    echo "<script>location='index.php?halaman=produk';</script>";
}
