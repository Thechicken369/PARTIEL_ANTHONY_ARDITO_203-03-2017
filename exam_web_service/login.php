<?php



$reponce = array();

require_once("connect.php");
	
$statement=  $sqlpdo->prepare("SELECT * FROM utilisateur");
$statement->execute();
$results=$statement->fetchAll(PDO::FETCH_ASSOC);
$json=json_encode($results);
echo($json);



?>