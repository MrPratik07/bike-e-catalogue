<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>

    </head>
    <body>
        <?php
        include './resource.php';
        $id = intval($_GET['id']);  
        $sql="select * from info where bike_id=$id";
        $result = mysqli_query($_CONNECT, $sql);
            while ($row= mysqli_fetch_array($result))
            {

                $bike_id     = $row['bike_id'];
                $bike_name = $row['bike_name'];
                $engine_type = $row['engine_type'];
                $lubrication_system = $row['lubrication_system'];
                $clutch_type = $row['clutch_type'];
                $ignition_system = $row['ignition_system'];
                $starter_system = $row['starter_system'];
            }
        ?>
        <iframe width="350" height="315" src="3D_bike/iframe.html" frameborder="0" allowfullscreen></iframe>
        <table>
  <tr>
    <th>Name</th>
    <th>Specification</th>
  </tr>
  <tr>
    <td>Bike Id</td>
    <td><?php echo $bike_id; ?></td>
  </tr>
  <tr>
    <td>Bike Name</td>
    <td><?php echo $bike_name; ?></td>
  </tr>
  <tr>
    <td>Engine Type</td>
    <td><?php echo $engine_type; ?></td>
  </tr>
  <tr>
    <td>Lubrication System</td>
    <td><?php echo $lubrication_system; ?></td>
  </tr>
  <tr>
    <td>Clutch Type</td>
    <td><?php echo $clutch_type; ?></td>
  </tr>
  <tr>
    <td>Ignition System</td>
    <td><?php echo $ignition_system; ?></td>
  </tr>
  <tr>
    <td>Starter System</td>
    <td><?php echo $starter_system; ?></td>
  </tr>
</table>
        <br>
        <input type="submit" value="Add To Favoutite" id="submit" hspace="100" style="width: 150px"/>
    </body>
</html>
