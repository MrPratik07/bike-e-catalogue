<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$bike_id = filter_input(INPUT_GET, 'bike_id');
$bike_name = filter_input(INPUT_GET, 'bike_name');
$engine_type = filter_input(INPUT_GET, 'engine_type');
$lubrication_system = filter_input(INPUT_GET, 'lubrication_system');
$clutch_type = filter_input(INPUT_GET, 'clutch_type');
$ignition_system = filter_input(INPUT_GET, 'ignition_system');
$starter_system = filter_input(INPUT_GET, 'starter_system');
include './resource.php';
include('phpqrcode/qrlib.php');
session_start();
                        //Insert

if(isset($_SESSION['email'])&&isset($_GET['insert']))
{
    $file_name=$bike_name.".jpeg";
    $sql = "insert into info(bike_id, bike_name, engine_type, lubrication_system, clutch_type, ignition_system, starter_system,image) VALUES ('$bike_id','$bike_name','$engine_type','$lubrication_system','$clutch_type','$ignition_system','$starter_system','$file_name')";
    $result = mysqli_query($_CONNECT, $sql);
    if($result){
        echo '<script type="text/javascript">
                alert("Data Inserted Suceesfuly"); 
                window.location = "./info.html";
        </script>';
        $text="http://192.168.43.111/Admin_Bar/display.php?id=".$bike_id;
        $folder="images/";
        $file_name=$bike_name.".jpeg";
        $file_name=$folder.$file_name;
        QRcode::png($text,$file_name);
        //QRcode::png($text);               //for display qr code
    }
    else {
        echo '<script type="text/javascript">
                alert("Data is not Inserted");
                window.location = "./info.html";
        </script>';
    }
}

                        //Delete

if(isset($_SESSION['email'])&&isset($_GET['delete']))
{
    $sql="DELETE FROM `info` WHERE bike_id='$bike_id' and bike_name='$bike_name'";
    $result = mysqli_query($_CONNECT, $sql);
    if($result){
        echo '<script type="text/javascript">
                alert("Data Deleted Suceesfuly");
                window.location = "./info.html";
        </script>';
    }
    else {
        echo '<script type="text/javascript">
                alert("Data is not Deleted");
                window.location = "./info.html";
        </script>';
    }
}

                        //Update

/*if(isset($_SESSION['email'])&&isset($_GET['update']))
{
    $sql="DELETE FROM `info` WHERE bike_id='$bike_id' and bike_name='$bike_name'";
    $result = mysqli_query($_CONNECT, $sql);
    if($result){
        echo '<script type="text/javascript">
                alert("Data Deleted Suceesfuly");
                window.location = "./info.html";
        </script>';
    }
    else {
        echo '<script type="text/javascript">
                alert("Data is not Deleted");
                window.location = "./info.html";
        </script>';
    }
}*/
if (isset($_GET['logout']))
    {
        session_destroy();
        echo '<script type="text/javascript">
                alert("Logout sucsess");
                window.location = "./home.html";
        </script>';
    }
?>
