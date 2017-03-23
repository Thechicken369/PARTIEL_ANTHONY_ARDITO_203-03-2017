<?php

if (isset($_REQUEST["index"])){
	switch($_REQUEST["index"]){
		case '1':
			require_once("login.php");
			break;
		case '2':
			require_once("list_projet.php");
			break;
	
	
	}
}


?>