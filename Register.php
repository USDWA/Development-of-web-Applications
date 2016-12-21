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

    $personalDetail_query = "INSERT INTO guests(fName, lName, ssid, email, phone_no, guest_no)
                  VALUES ('$fName', '$lName', '$SID', '$email', '$phoneNumber', '$guest_id')";

    $OK;
    if(mysqli_query($connection, $personalDetail_query)){
        echo "OK";
        $OK = 1;
    }
    else{
        echo "Fail";
        $OK = 0;
    }

    $bookIn = $_POST["dateIn"];
    $bookOut = $_POST["dateOut"];
    $rooms = $_POST["rooms"];
    $adults = $_POST["adults"];
    $children = $_POST["children"];
    $meals = $_POST["meals"];
    
    echo "Meals: $meals <br>";
    if(!empty($_POST["balcony"])){
         $balcony = $_POST["balcony"];
            // echo "Balcony: $balcony <br>";
    }
    else
        $balcony = 0;
        
    $bookingDetail_query = "INSERT INTO booking(book_in, book_out, rooms, adults, children, meals, balcony, guest_no)
                            VALUES ('$bookIn', '$bookOut', '$rooms', '$adults', '$children', '$meals', '$balcony', '$guest_id')";

    print_r($bookingDetail_query);
    if(mysqli_query($connection, $bookingDetail_query) && $OK == 1){
        header("Location: http://localhost/Development-of-web-Applications/destination.html");
    }
    else{
        echo "Failed to register...";
        header("Location: http://localhost/Development-of-web-Applications/FormPage.html");
    }


?>