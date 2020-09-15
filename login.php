<?php
      include './resource.php';

  $username=$_POST['username'];
  $password=$_POST['password'];
  $queryResult = $_CONNECT->query("SELECT * FROM customer where username = '".$username."' and password = '".$password."'");

  $result = array();

  while ($fetchdata=$queryResult->fetch_assoc()) {
      $result[] = $fetchdata;
  }

  echo json_encode($result);
  
?>