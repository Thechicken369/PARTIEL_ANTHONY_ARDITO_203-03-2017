<?php



$reponce = array();
if (isset($_REQUEST["name"])){
	require_once("connect.php");
	
	$result1 = $sqlpdo->query("SELECT UTI_ID from utilisateur where UTI_Nom='".$_REQUEST["name"]."'");
	$row = $result1->fetch(PDO::FETCH_ASSOC);
	$statement=  $sqlpdo->prepare("SELECT PRO_Nom FROM projet,travail where PRO_ID = TRA_IDProjet AND TRA_IDUti=".$row["UTI_ID"]);
	
	
	$statement->execute();
	$results=$statement->fetchAll(PDO::FETCH_ASSOC);
	$json=json_encode($results);
echo($json);
}


?>