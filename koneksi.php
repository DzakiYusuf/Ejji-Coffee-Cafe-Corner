<?php
$host = 'localhost:3333';
$user = 'root';
$password = 'root';
$database = 'remenkopi3';

$koneksi = new mysqli($host, $user, $password, $database);

if ($koneksi->connect_error) {
    die("Connection failed: " . $koneksi->connect_error);
}
?>
