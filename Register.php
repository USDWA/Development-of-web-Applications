<?php

     require "init.php";  // calling init.php (initializing DB)

    $fName = $_POST["fName"];
    $lName = $_POST["lName"];
    $SID = $_POST["sid"];
    $email = $_POST["email"];
    $phoneNumber = $_POST["phone"];

    //to get the next available guest_id
    $query = "SELECT max(guest_no) From guests";
    $result = $connection->query($query);
    $row = mysqli_fetch_array($result);
    $guest_id = $row[0] + 1;

    $sql_query = "INSERT INTO guests SET
                               fNAme = {$fName},
                               lName = '{$lName}',
                               ssid = '{$SID}',
                               email = '{$email}',
                               phone_no = {$phoneNumber}
                               guest_no = '{$guest_id}',";

    $result = mysqli_query($connection, $sql_query);

    if(mysqli_num_rows($result))
        echo "Success...";

    else
        echo "Failed...";

?>