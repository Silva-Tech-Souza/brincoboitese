<?php 	session_start();error_reporting(0);
	include("../../../includes/config.php");
    
 $idfilial = $_GET["idfilial"];
 $iduser = $_SESSION['id'];
    $sql = "UPDATE `users` SET filial = $idfilial WHERE id= :iduser ";
    $query = $dbh->prepare($sql);
    $query->bindParam(':iduser', $iduser, PDO::PARAM_INT);
    $query->execute();
    $_SESSION['idfilial'] = $_GET["idfilial"];
    header('location:../../../index.php');
?>