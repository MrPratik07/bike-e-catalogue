<?php
include './resource.php';
session_start();
        session_destroy();
        echo '<script type="text/javascript">
                alert("Logout sucsess");
                window.location = "./home.html";
        </script>';
?>