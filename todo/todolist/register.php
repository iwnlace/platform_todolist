<?php
$db = mysqli_connect ('localhost','root','','mydb');
if(!$db) {
    echo ("Database connection failed");
}

$username = $_POST['username'];
$password = $_POST['password'];


$sql = "SELECT * FROM users WHERE username = '' AND password = ''";

$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);

if($count == 1) {
    echo json_encode ("Error");
}
else {
    $insert = "INSERT INTO users(username,password) VALUES ('".$username."', '".$password."')";
    $query = mysqli_query ($db,$insert);
    if ($query) {
        echo json_encode ("Success");
    }
}
?>