<?php 
session_start();
error_reporting(0);
include("../../../includes/config.php"); 
	 $iduser = $_SESSION['id'];
	  $sql = "DELETE FROM `mensagens` WHERE id_recebido = :id_recebido";
	   $query = $dbh->prepare($sql);
    $query->bindParam(':id_recebido', $iduser, PDO::PARAM_INT);
      $query->execute();
       header('location:../../../index.php');
	?>