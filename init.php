<?php // Initialize establishing connection_status

    DEFINE('db_name', 'hotel'); // name of DB
    DEFINE('mysql_user', 'root'); // user name of admin of DB, our mysql user name is root.
    DEFINE('mysql_pass', ''); // password of admin of DB
    DEFINE('server_name', 'localhost'); // server name

    $connection = mysqli_connect(server_name, mysql_user, mysql_pass, db_name); // establishing a connection with the DB
?>