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

    $sql_query = "INSERT INTO guests (fName, lName, ssid, email, phone_no, guest_no)
                  VALUES ('$fName', '$lName', '$SID', '$email', '$phoneNumber', '$guest_id')";


    if(mysqli_query($connection, $sql_query))
        echo "Success...";

    else
        echo "Failed...";

?>