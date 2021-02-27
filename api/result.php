<?php
include "conn.php";

$json = file_get_contents('php://input');

$obj = json_decode($json,true);
 
$searchtext = $obj['searchtext'];
//$searchtext = 1;

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) 
{
  die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT id, name, education, location, logo, type FROM edu_ocean WHERE name LIKE '%$searchtext%' OR education LIKE '%$searchtext%' OR type LIKE '%$searchtext%' OR location LIKE '%$searchtext%'";
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