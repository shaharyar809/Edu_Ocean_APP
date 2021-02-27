<?php
include "conn.php";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) 
{
  die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT * FROM notice";
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