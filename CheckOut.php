<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Payment Form</title>
  
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
  <link rel="stylesheet" href="css/style.css">
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <script src="js/index.js"></script>
  
</head>

<?php

    require "init.php"; 

    $fName = $_GET["fName"];
    $lName = $_GET["lName"];

    $query = "SELECT guest_no From guests WHERE fName = '$fName' AND lName = '$lName'";
    $result = $connection->query($query); 
    $guest_no = 0;
    
    while($row = mysqli_fetch_row($result))
    {
        for ($i=0; $i<mysqli_num_fields($result); $i++){

            if($row[$i] != 0)
                $guest_no = $row[$i];
        }      
    }

    if($guest_no == 0){
        echo "Failed to register...";
        header("Location: http://localhost/Development-of-web-Applications/PreCheckOut.html");
    }
	   

    $getGuestInfo = "SELECT rooms, adults, children FROM booking WHERE guest_no = '$guest_no'";
    $result = $connection->query($getGuestInfo);
    $total = 0;
    $j = 200;
    				  
	   while($row = mysqli_fetch_row($result))
	   {
			for ($i=0; $i<mysqli_num_fields($result); $i++)
			{
                if($i == 0)
                    $j = 200;
                  else if($i == 1)
                    $j = 80;
                  else if($i == 2)
                    $j = 50;

                $total += $row[$i] * $j;

            }	         
	   }

?>

<body background="wallpaper.jpg">

<div class="container">
  <div id="Checkout" class="inline">
      <h1>Check Out</h1>
      <div class="card-row">
          <span class="visa"></span>
          <span class="mastercard"></span>
          <span class="amex"></span>
          <span class="discover"></span>
      </div>
      <form action="DeleteGuest.php" method="POST">
          <div class="form-group">
              <label>Payment amount</label>
              <div class="amount-placeholder">
                  <span>$</span>
                  <span><?php echo $total; ?></span>
              </div>
          </div>

          <div class="form-group">
              <label or="NameOnCard">Name on card</label>
              <input id="NameOnCard" name="NameOnCard" class="form-control" type="text" maxlength="255" required placeholder=""></input>
          </div> 

          
          <div class="form-group">
              <label>Card number</label>
              <input id="CreditCardNumber" name="cardNum" class="null card-image form-control" type="text" required placeholder=""></input>
          </div>
          <div class="expiry-date-group form-group">
              <label>Checkout date</label>
              <input id="dateOut" name="dateOut" class="form-control" required placeholder="YYYY/MM/DD"></input>
          </div>
          <div class="security-code-group form-group">
              <label>Security Code</label>
              <div class="input-container" >
                  <input id="SecurityCode" name="secCode" class="form-control" type="text" required placeholder=""></input>
              </div>
          </div>
          <input  type="hidden" name="guestNo" value="<?php echo $guest_no ?>"></input>
          <input  type="submit" id="PayButton" class="btn btn-block btn-success submit-button" value="Check Out">

      </form>
  </div>
</div>
</body>
</html>
