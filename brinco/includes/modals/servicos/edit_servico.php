<?php 	session_start();error_reporting(0);
	include("../../../includes/config.php");
    
 $idservico = $_GET["idservico"];
 $iduser = $_SESSION['id'];
    $sql = "UPDATE `servico` SET ativado = 'off' WHERE id= :idservico ";
    $query = $dbh->prepare($sql);
    $query->bindParam(':idservico', $idservico, PDO::PARAM_INT);
    $query->execute();
  
    header('location:../../../servicos.php#');
?>