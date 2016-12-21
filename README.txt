This README file will explain every file that make up the website.
------------------------------------------------------------------
                           Files:

1- homepage.html
2- formpage.html
3- Register.php
4- init.php
------------------------------------------------------------------

                      Explanation of files:

1- homepage.html: This is the homepage, it has links to news,
   contact, about, and to the home if a user wishes to go
   back to the homepage.

2- formpage.html: This file has the personal details and booking
   details. The personal details consist of first name, last name
   ID, email, and phone number.

   The first and last name must have at least 3 letters. The ID
   consists of numbers from 0 to 9 and should be 2 digits long.
   The phone number must have 10 digits. We chose a maximum number
   of rooms of 30. When the customer is done entering data and clicks
   on submit, the data is sent to Register.php.

3- Register.php requires(calls) init.php, which establishes a connec-
   tion with the database. Then it stores the first name, last name,
   ID, email, and phone number into variables. Then there's a query
   to select the next guest ID, and a query is executed to store 
   the first name, last name, ID, email, phone number, and guest ID
   into the database.

4- init.php: Establishes a connection to the database.
------------------------------------------------------------------

                Explanation of the Homepage:

- Home: will redirect a user back to the homepage.

- Contact: will redirect the user to the contact page, which has
  the phone number and email of the hotel.

- Location: will redirect the user to the location page, which has
  an embedded map from Google Maps (since the hotel doesn't exist,
  a random location was selected).

- Activities: will redirect the user to the activities page, which
  consist of activities available in the hotel.

- Check in: The user selects the check in date.

- Check out: The user selects the check out date.

- Guest reviews: will redirect the user to a page with reviews
  from other customers.

- Overview: will redirect the user to the overview of the hotel.

- Terms of Use: will redirect the user to the terms of use of the
  hotel's website.

- Privacy: will redirect the user to the privacy policy of the
  hotel's website.

- News: will redirect the user to the news of the hotel page. 
