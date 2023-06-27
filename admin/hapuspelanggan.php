<?php 
require_once 'koneksi.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Get the current data for the pelanggan
    $query = $koneksi->query("SELECT * FROM pelanggan WHERE id_pelanggan='$id'");
    $data = $query->fetch_assoc();

    // Check if the pelanggan exists
    if (!$data) {
        echo "<script>alert('ID pelanggan tidak valid');</script>";
        echo "<meta http-equiv='refresh' content='1;url=index.php?halaman=pelanggan'>";
        exit;
    }

    // Empty the seat (meja) for the pelanggan
    $update = $koneksi->query("UPDATE pelanggan SET meja_pelanggan = '' WHERE id_pelanggan='$id'");

    if ($update) {
        echo "<script>alert('Meja telah dikosongkan');</script>";
        
        // Additional actions you may want to perform
        
    } else {
        echo "<script>alert('Gagal mengosongkan meja');</script>";
    }
} else {
    echo "<script>alert('ID pelanggan tidak valid');</script>";
}

echo "<meta http-equiv='refresh' content='1;url=index.php?halaman=pelanggan'>";
?>