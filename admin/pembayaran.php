
<?php
// Mendapatkan id pembelian dari URL
$id_pembelian = $_GET['id'];

// Mengambil data pembayaran dari id pembelian
$query = $koneksi->query("SELECT * FROM pembayaran WHERE id_pembelian='$id_pembelian'");
$detail = $query->fetch_assoc();

if ($detail) {
    // echo "<pre>";
    // print_r($detail);
    // echo "</pre>";
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
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-dark">Data Pembayaran</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<div class="row">
    <div class="col-md-6">
        <table class="table">
            <tr>
                <td>Nama</td>
                <td>:</td>
                <td><?php echo isset($detail['nama']) ? $detail['nama'] : ''; ?></td>
            </tr>
            <tr>
                <td>Metode</td>
                <td>:</td>
                <td><?php echo isset($detail['metode']) ? $detail['metode'] : ''; ?></td>
            </tr>
            <tr>
                <td>Jumlah</td>
                <td>:</td>
                <td><?php echo isset($detail['jumlah']) ? $detail['jumlah'] : ''; ?></td>
            </tr>
            <tr>
                <td>Tanggal</td>
                <td>:</td>
                <td><?php echo isset($detail['tanggal']) ? $detail['tanggal'] : ''; ?></td>
            </tr>
        </table>
    </div>
    <div class="col-md-6">
        <?php
        $bukti = isset($detail['bukti']) ? $detail['bukti'] : '';
        if (!empty($bukti)) {
            echo 'Bukti Pembayaran:     ';
            echo '<img src="../bukti_pembayaran/' . $bukti . '" width="200" alt="" class="img-responsive">';
        }
        ?>
    </div>
</div>

<?php
} else {
    echo 'Data pembayaran tidak ditemukan.';
}
?>
