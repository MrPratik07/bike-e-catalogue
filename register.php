<?php

    include './resource.php';
    $username=$_POST['username'];
    $password=$_POST['password'];
    
    $_CONNECT->query("insert into customer(username,password) values('".$username."','".$password."')");
    
?>