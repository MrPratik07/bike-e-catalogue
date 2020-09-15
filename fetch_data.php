<?php 

  include './resource.php';

  $queryResult = $_CONNECT->
      query("SELECT bike_name FROM info where bike_id=100");

  $result = array();

  while ($fetchdata=$queryResult->fetch_assoc()) {
      $result[] = $fetchdata;
  }

  echo json_encode($result);
 ?>