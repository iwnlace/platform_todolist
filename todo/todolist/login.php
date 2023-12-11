<?php
include 'db.php';
$username =$_POST['username'];
$password = $_POST['password'];
$sql = "SELECT username FROM users WHERE username = ('".$username."') AND _password = md5('".$password."')";
$result = mysqli_query ($db, $sql);
$count = mysqli_num_rows($result);
    if ($count == 1) {
        echo json_encode("Success");
    }
else {
    echo json_encode("Error");
}
    
