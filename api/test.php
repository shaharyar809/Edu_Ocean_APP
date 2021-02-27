<?php
include 'conn.php';
 
// Creating connection
	$conn = new mysqli($servername, $username, $password, $dbname);
 
if ($conn->connect_error) {
 
	die("Connection failed: " . $conn->connect_error);
} 
 
	// Creating SQL command to fetch all records from Student_Data Table.
	$sql = "SELECT * FROM edu_ocean";
	 
	$result = $conn->query($sql);
 
if ($result->num_rows >0) {
 
	 while($row[] = $result->fetch_assoc()) {
	 
	 $item = $row;
	 
	 $json = json_encode($item);
	 
 }
 
} else {
	echo "No Data Found.";
}
echo $json;
$conn->close();
 
?>