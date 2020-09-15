<?php

$email = filter_input(INPUT_GET, 'email');
$password = filter_input(INPUT_GET, 'password');
if (!empty($email)) {
    if (!empty($password)) {
        include './resource.php';
        $sql = "select email,password from login where email='$email' and password='$password'";
        $result = mysqli_query($_CONNECT, $sql);
        $count=mysqli_num_rows($result);
        if($count==1)
        {
            session_start();
                $_SESSION['email'] = $email;
                $_SESSION['password'] = $password;
            echo '<script type="text/javascript">
                    alert("Login Success");
           window.location = "./info.html";
      </script>';
        }
        else {
            echo '<script type="text/javascript">
                    alert("Wrong Username or password");
           window.location = "./home.html";
      </script>';
        }
    } 
}
?>