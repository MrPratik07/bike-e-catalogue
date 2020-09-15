<?php

// /* localhost string */
define('DB_NAME', 'admin');
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');



/* connectivity */
$_CONNECT = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
?>