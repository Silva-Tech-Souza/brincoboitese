<?php 
session_start();
error_reporting(0);
include("includes/config.php");
 $idusuario = $_GET["idusuario"];
 $idpedido = $_GET["idpedido"];	
  $diahoje = date('d/m/Y');	
  $nomemensagem = "";
    $mensagme = "";
 $idpedido  = str_replace("card", "",$idpedido);
 $idusuario  = str_replace("list", "",$idusuario);
 $sql = "UPDATE `pedidos` SET iduser = $idusuario WHERE id= :idpedido ";
 $query = $dbh->prepare($sql);
 $query->bindParam(':idpedido', $idpedido, PDO::PARAM_STR);
 $query->execute();
 
 $sql3 = "SELECT FirstName from users where id = :idusuario";
 $query3 = $dbh->prepare($sql3);
 $query3->bindParam(':idusuario', $idusuario, PDO::PARAM_STR);
 $query3->execute();
$results3=$query3->fetchAll(PDO::FETCH_OBJ);

if($query3->rowCount() > 0){foreach ($results3 as $row) {
	   $nomemensagem =  $row->FirstName;
}}

 if( $idusuario  != 0){
$sql2 = "INSERT INTO `mensagens`(`id_recebido`, `nome_user`, `texto`, `data`) 
VALUES (:id_recebido,:nome_user,:texto,:data)";
 $query2 = $dbh->prepare($sql2);
 $query2->bindParam(':id_recebido', $idusuario, PDO::PARAM_INT);
 $query2->bindParam(':nome_user', $nomemensagem, PDO::PARAM_STR);
 $query2->bindParam(':texto', $mensagme, PDO::PARAM_STR);
 $query2->bindParam(':data', $diahoje, PDO::PARAM_STR);
 $query2->execute();
     
 }

 
header('location:index.php');
?>