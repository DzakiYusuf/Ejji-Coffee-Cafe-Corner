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
                    <h1 class="h3 mb-2 text-gray-800">Pembelian</h1>
                    <p class="mb-4">Tabel ini memiliki fitur detail untuk menampilkan pesanan dan mengecek bukti pembayaran</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-dark">Data pembelian</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama Pembeli</th>
            <th>Tanggal Pembelian</th>
            <th>Total Pembelian</th>
            <th>Metode Pembayaran</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php $nomor=1; ?>
        <?php $query=$koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan=pelanggan.id_pelanggan" ); ?>
        <?php while($data = $query->fetch_assoc()){ ?>
        <tr>
            <td><?php echo $nomor++; ?></td>
            <td><?php echo $data['nama_pelanggan']; ?></td>
            <td><?php echo $data['tanggal_pembelian']; ?></td>
            <td><?php echo $data['total_pembelian']; ?></td>
            <td><?php echo $data['metode']; ?></td>
            <td><a href="index.php?halaman=detail&id=<?php echo $data['id_pembelian'] ?>" class="btn btn-info">Detail</a>
                <a href="index.php?halaman=pembayaran&id=<?php echo $data['id_pembelian'] ?>" class="btn btn-success">Pembayaran</a>
            </td>
        </tr>
        <?php } ?>
    </tbody>
</table>