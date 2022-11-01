<?php 
	session_start();
	error_reporting(0);
	include_once('includes/config.php');
	include_once("includes/functions.php");
	if(strlen($_SESSION['userlogin'])==0){
		header('location:login.php');
	}elseif (isset($_GET['delid'])) {
		$rid=intval($_GET['delid']);
	  $sql="DELETE from clients where id=:rid";
	  $query=$dbh->prepare($sql);
	  $query->bindParam(':rid',$rid,PDO::PARAM_STR);
	  $query->execute();
	   echo "<script>alert('Department deleted Successfully');</script>"; 
	}
	
	if (isset($_POST['add_client'])) {
	 echo    $datacriacao = date('d/m/Y');
echo	    $valortotal = "R$ 00,00";
echo	    $pedidostotal = "0";
echo	    $idcriador = $_SESSION['userlogin'];
echo	    $_SESSION['idfilial'];
echo		$prinome = $_POST["prinome"];
echo		$sobrenome = $_POST["sobrenome"];
echo		$codigo = $_POST["codigo"];
echo		$email = $_POST["email"];
echo		$senha = $_POST["senha"];
echo		$consenha = $_POST["consenha"];
echo		$celular = $_POST["celular"];
echo		$nomeempresa = $_POST["nomeempresa"];
echo		$cep = $_POST["cep"];
echo		$enderco = $_POST["endereco"];
echo		$cnpj = $_POST["cnpj"];
echo		$cpf = $_POST["cpf"];
echo		$idfilial = $_POST["filail"];
echo		$nascimento = $_POST["nascimento"];
		
	$sql =	
	"INSERT INTO `clientes`( `idcriador`, `idfilial`, `valortotal`, `pedidostotal`, `prinome`, `sobrenome`, `codigo`, `email`, `senha`, `celular`, `nomeempresa`, `cep`, `enderco`, `cpf`, `cnpj`, `nascimento`, `datacriacao`)
                    VALUES (:idcriador,:idfilial,:valortotal,:pedidostotal,:prinome,:sobrenome,:codigo,:email,:senha,:celular,:nomeempresa,:cep,:enderco,:cpf,:cnpj,:nascimento,:datacriacao)";
	$query = $dbh->prepare($sql);
	$query->bindParam(':idcriador', $idcriador, PDO::PARAM_INT);
		$query->bindParam(':idfilial', $idfilial, PDO::PARAM_INT);
		$query->bindParam(':valortotal', $valortotal, PDO::PARAM_INT);
		$query->bindParam(':pedidostotal', $pedidostotal, PDO::PARAM_INT);
		$query->bindParam(':prinome', $prinome, PDO::PARAM_STR);
		$query->bindParam(':sobrenome', $sobrenome, PDO::PARAM_STR);
		$query->bindParam(':codigo', $codigo, PDO::PARAM_STR);
		$query->bindParam(':email', $email, PDO::PARAM_STR);
		$query->bindParam(':senha', $senha, PDO::PARAM_STR);
		$query->bindParam(':celular', $celular, PDO::PARAM_STR);
		$query->bindParam(':nomeempresa', $nomeempresa, PDO::PARAM_STR);
		$query->bindParam(':cep', $cep, PDO::PARAM_STR);
		$query->bindParam(':enderco', $enderco, PDO::PARAM_STR);
		$query->bindParam(':cpf', $cpf, PDO::PARAM_STR);
		$query->bindParam(':cnpj', $cnpj, PDO::PARAM_STR);
		$query->bindParam(':nascimento', $nascimento, PDO::PARAM_STR);
		$query->bindParam(':datacriacao', $datacriacao, PDO::PARAM_STR);
		$query->execute();
		$_POST['add_client'] = null;
	}
	$_POST['add_client'] = null;
 ?>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Clients</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
		<link rel="stylesheet" href="assets/css/line-awesome.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="assets/css/select2.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
            <?php include_once("includes/header.php");?>
			<!-- /Header -->
			
			<!-- Sidebar -->
            <?php include_once("includes/sidebar.php");?>
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Clientes</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active">Clientes</li>
								</ul>
							</div>
							<?php if($wrongpassword){echo $wrongpassword;} ?>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_client"><i class="fa fa-plus"></i> Adicionar Cliente</a>
								<div class="view-icons">
								</div>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Search Filter -->
					<div class="row filter-row">
						<div class="col-sm-6 col-md-3">  
							<div class="form-group form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">ID Cliente</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<div class="form-group form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Nome do Cliente</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3"> 
							<div class="form-group form-focus select-focus">
								<select class="select floating"> 
									<option>Selecione as Filiais</option>
									<option>Bom Retiro</option>
									<option>Brás</option>
								</select>
								<label class="focus-label">Filias</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<a href="#" class="btn btn-success btn-block"> Pesquisar </a>  
						</div>     
                    </div>
					<!-- Search Filter -->
					
					<div class="row staff-grid-row">
					<?php
						$sql = "SELECT * FROM clientes";
						$query = $dbh->prepare($sql);
						$query->execute();
						$results=$query->fetchAll(PDO::FETCH_OBJ);
						$cnt=1;
						if($query->rowCount() > 0)
						{
						foreach($results as $row)
						{	
					?>
						<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3">
							<div class="profile-widget">
								
								<div class="dropdown profile-action">
									<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_client"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_client"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                </div>
								</div>
								<h4 class="user-name m-t-10 mb-0 text-ellipsis"><a href="client-profile.php"><?php echo "ID: ". htmlentities($row->id);?></a></h4>
								<h5 class="user-name m-t-10 mb-0 text-ellipsis"><a href="client-profile.php"><?php echo "Nome: ".htmlentities(($row->prinome).' '.($row->sobrenome)); ?></a></h5>
								<div class="small text-muted"><?php echo "Contato: ". htmlentities($row->celular);?></div>
								
								<a href="client-profile.php" class="btn btn-white btn-sm m-t-10">Ver Perfil</a>
							</div>
						</div>
						<?php $cnt+=1; 
						}
						}?>
					</div>
                </div>
				<!-- /Page Content -->
			
				<!-- Add Client Modal -->
				<?php include_once("includes/modals/clients/add_client.php"); ?>
				<!-- /Add Client Modal -->
				
				<!-- Edit Client Modal -->
				<?php include_once("includes/modals/clients/edit_client.php"); ?>
				<!-- /Edit Client Modal -->
				
				<!-- Delete Client Modal -->
				<?php include_once("includes/modals/clients/delete_client.php"); ?>
				<!-- /Delete Client Modal -->
				
            </div>
			<!-- /Page Wrapper -->
			
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="assets/js/select2.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
		
    </body>
</html>