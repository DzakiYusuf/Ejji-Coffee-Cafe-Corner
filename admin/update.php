<?php
// Assuming you have established a database connection using $koneksi variable

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the form data is provided
    if (isset($_POST['id']) && isset($_POST['nama_pelanggan']) && isset($_POST['meja_pelanggan'])) {
        $id = $_POST['id'];
        $nama_pelanggan = $_POST['nama_pelanggan'];
        $meja_pelanggan = $_POST['meja_pelanggan'];

        // Prepare and execute the update query
        $stmt = $koneksi->prepare("UPDATE pelanggan SET nama_pelanggan = ?, meja_pelanggan = ? WHERE id_pelanggan = ?");
        $stmt->bind_param("sii", $nama_pelanggan, $meja_pelanggan, $id);

        if ($stmt->execute()) {
            // Update successful
            echo "success";
        } else {
            // Update failed
            echo "error";
        }

        // Close the statement
        $stmt->close();
    }
}
?>
