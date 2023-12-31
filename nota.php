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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <title>Nota</title>
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

    <section class="konten mt-4 mb-4">
        <div class="container">
            <!-- nota disini copas dari nota yang ada di admin -->
            <h2>Nota Pembelian</h2>
            <hr>
            <p>nb:</p>
            <ol>
                <li>Untuk pembayaran di tempat wajib screenshoot nota sebagai bukti pembayaran</li>
            </ol>
            <hr>
            <?php
            if (isset($_GET['id'])) {
                $id_pembelian = $_GET['id'];
                $query = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan
                    ON pembelian.id_pelanggan=pelanggan.id_pelanggan
                    WHERE pembelian.id_pembelian='$id_pembelian'");
                if ($query->num_rows > 0) {
                    $detail = $query->fetch_assoc();
            ?>
            <div class="row">
    <div class="col-md-4">
        <h3>Pembelian</h3>
        <strong>No. Pembelian: <?php echo $detail['id_pembelian']; ?></strong><br>
        Tanggal: <?php echo $detail['tanggal_pembelian']; ?><br>
        Total: <?php echo $detail['total_pembelian']; ?>
    </div>
    <div class="col-md-4">
        <h3>Pelanggan</h3>
        <strong><?php echo $detail['nama_pelanggan']; ?></strong> <br>
        <p>
            Meja: <?php echo $detail['meja_pelanggan']; ?>
        </p>
    </div>
    <div class="col-md-4">
        <h3>Pembayaran</h3>
        <strong><?php echo $detail['metode']; ?></strong>
    </div>
</div><br>

<table class="table table-bordered" style="width: 100%;">

    <thead>
        <tr>
            <th>No</th>
            <th>Nama Produk</th>
            <th>Harga Produk</th>
            <th>Jumlah</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $nomor = 1;
        $id_pembelian = $_GET['id'];
        $query_produk = $koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian='$id_pembelian'");
        while ($data_produk = $query_produk->fetch_assoc()) {
        ?>
        <tr>
            <td><?php echo $nomor++; ?></td>
            <td><?php echo $data_produk['nama']; ?></td>
            <td>Rp. <?php echo number_format($data_produk['harga']); ?></td>
            <td><?php echo $data_produk['jumlah']; ?></td>
            <td>Rp. <?php echo number_format($data_produk['subharga']); ?></td>
        </tr>
        <?php } ?>
    </tbody>
</table>
            <a href="pembayaran.php?id=<?php echo $detail["id_pembelian"]; ?>" class="btn btn-success">Pembayaran</a>

<?php
    } else {
        echo "Data pembelian tidak ditemukan.";
    }
} else {
    echo "ID pembelian tidak valid.";
}
?>

</div>

</section>
</body>
</html>