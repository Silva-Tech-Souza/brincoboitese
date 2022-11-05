<?php 	session_start();error_reporting(0);
	include("../../../includes/config.php");
    
 $idcargo = $_GET["idcargo"];
 $off = "off";
    $sql = 'UPDATE cargo SET status = "off" WHERE id= :idcargo';
    $query = $dbh->prepare($sql);
    $query->bindParam(':idcargo', $idcargo, PDO::PARAM_INT);
    $query->execute();
 
   header('location:../../../roles-permissions.php');
?>