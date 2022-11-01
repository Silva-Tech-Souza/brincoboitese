<?php
session_start(); 
	error_reporting(0);
	include_once("includes/config.php");
		$sql = "UPDATE `users` SET `ativo`= 'false' WHERE id = :id ";
		$query = $dbh->prepare($sql);
		$query->bindParam(':id',$_SESSION['id'],PDO::PARAM_INT);
			$query-> execute();
session_destroy(); // destroy session
header("location:login.php"); 
?>

