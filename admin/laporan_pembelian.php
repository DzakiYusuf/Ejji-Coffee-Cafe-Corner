<?php

$semuadata = array();
$tgl_mulai = "-";
$tgl_selesai = "-";

if (isset($_POST["kirim"])) {
    $tgl_mulai = $_POST["tglm"];
    $tgl_selesai = $_POST["tgls"];

    $query = $koneksi->query("SELECT * FROM pembelian LEFT JOIN pelanggan ON pembelian.id_pelanggan = pelanggan.id_pelanggan WHERE tanggal_pembelian BETWEEN '$tgl_mulai' AND '$tgl_selesai' AND pelanggan.nama_pelanggan IS NOT NULL");

    while ($data = $query->fetch_assoc()) {
        $semuadata[] = $data;
    }
}
?>

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
<h2>Laporan Pembelian dari <?php echo $tgl_mulai; ?> hingga <?php echo $tgl_selesai; ?></h2>
<hr>

<form method="post">
    <div class="row">
        <div class="col-md-5">
            <div class="form-group">
                <label>Tanggal Mulai</label>
                <input type="date" class="form-control" name="tglm">
            </div>
        </div>
        <div class="col-md-5">
            <div class="form-group">
                <label>Tanggal Selesai</label>
                <input type="date" class="form-control" name="tgls">
            </div>
        </div>
        <div class="col-md-2">
            <br>
            <button class="btn btn-dark" name="kirim">Lihat</button>
        </div>
    </div>
</form>

<br><br>

<?php if (!empty($semuadata)) : ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No</th>
                <th>Pelanggan</th>
                <th>Tanggal</th>
                <th>Jumlah</th>
                <th>Metode</th>
            </tr>
        </thead>
        <tbody>
            <?php $total = 0; ?>
            <?php foreach ($semuadata as $key => $value) : ?>
                <?php $total += $value['total_pembelian']; ?>
                <tr>
                    <td><?php echo $key + 1; ?></td>
                    <td><?php echo $value["nama_pelanggan"]; ?></td>
                    <td><?php echo $value["tanggal_pembelian"]; ?></td>
                    <td>Rp. <?php echo number_format($value["total_pembelian"]); ?></td>
                    <td><?php echo $value["metode"]; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="4">Total</th>
                <th>Rp. <?php echo number_format($total); ?></th>
            </tr>
        </tfoot>
    </table>
<?php else : ?>
    <p>Tidak ada data pembelian dalam periode yang dipilih.</p>
<?php endif; ?>
