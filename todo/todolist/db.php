<?php
include_once ('db.php');
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'mydb';

$conn = new mysqli($host, $username, $password, $database);
if ($conn -> connect_error) {
    die ('Failed' . $conn->connect_error);
} 
?>


