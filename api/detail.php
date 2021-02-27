<?php
include "conn.php";

$json = file_get_contents('php://input');

$obj = json_decode($json,true);
 
$id = $obj['id'];
//$id = "1";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) 
{
  die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT * FROM edu_ocean WHERE id='$id'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) 
{
    while($row[] = mysqli_fetch_assoc($result)) 
    {
            $item = $row;
            $json = json_encode($item);
    }
} 
else 
{
  echo "0 results";
}
echo $json;
mysqli_close($conn);
?>