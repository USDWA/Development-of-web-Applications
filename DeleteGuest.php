<?php

    require "init.php";

    $guest_no = $_POST['guestNo'];
    $sql = "DELETE FROM guests WHERE guest_no = '$guest_no'";
    if ($connection->query($sql) === TRUE) {
        echo "Record deleted successfully";
    } else {
        echo "Error deleting record: " . $connection->error;
    }

    $sql = "DELETE FROM booking WHERE guest_no = '$guest_no'";
    if ($connection->query($sql) === TRUE) {
        echo "Record deleted successfully";
    } else {
        echo "Error deleting record: " . $connection->error;
    }

    header("Location: http://localhost/Development-of-web-Applications/HomePage.html");

?>