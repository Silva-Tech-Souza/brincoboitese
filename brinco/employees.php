<?php
session_start();
error_reporting(0);
include_once('includes/config.php');
include_once("includes/functions.php");
if (strlen($_SESSION['userlogin']) == 0) {
	header('location:login.php');
} elseif (isset($_GET['delid'])) {
	$rid = intval($_GET['delid']);
	$sql = "DELETE from employees where id=:rid";
	$query = $dbh->prepare($sql);
	$query->bindParam(':rid', $rid, PDO::PARAM_STR);
	$query->execute();
	echo "<script>alert('Employee Has Been Deleted');</script>";
	echo "<script>window.location.href ='employees.php'</script>";
}

if (isset($_POST['add_colab'])|| $_POST['add_colab'] != "") {
  
  
        
        $datacriacao = date('d/m/Y');
		$idcriador = $_SESSION['id'];
		$idfilial = $_SESSION['idfilial'];
		$nome_colab = $_POST['nome_colab'];
		$login_colab = $_POST['login_colab'];
		$email_colab = $_POST['email_colab'];
		$senha_colab = $_POST['senha_colab'];
		$senha_colab2 = $_POST['senha_colab2'];
		$celular_colab = $_POST['celular_colab'];
		$endereco_colab = $_POST['endereco_colab'];
		$cep_colab = $_POST['cep_colab'];
		$servico_colab = $_POST['servico_colab'];
		$idcargo = $_POST['idcargo'];
		
		
		if($senha_colab == $senha_colab2){
		    
		    $criptografada = md5($senha_colab);
		    
		 	$sql = "INSERT INTO users(FirstName, Username, email, Password, Phone, Address, cep, funcao, datacriacao,
		 	idcriador, filial, idcargo) VALUES 
		 	(:nome_colab, :login_colab, :email_colab, :criptografada, :celular_colab, :endereco_colab, :cep_colab,
		 	:servico_colab, :datacriacao, :idcriador, :idfilial, :idcargo)";
		    $query = $dbh->prepare($sql);
		    $query->bindParam(':nome_colab', $nome_colab, PDO::PARAM_STR);
		    $query->bindParam(':login_colab', $login_colab, PDO::PARAM_STR);
		    $query->bindParam(':email_colab', $email_colab, PDO::PARAM_STR);
		    $query->bindParam(':criptografada', $criptografada, PDO::PARAM_STR);
		    $query->bindParam(':celular_colab', $celular_colab, PDO::PARAM_STR);
		    $query->bindParam(':endereco_colab', $endereco_colab, PDO::PARAM_STR);
		    $query->bindParam(':cep_colab', $cep_colab, PDO::PARAM_STR);
		    $query->bindParam(':servico_colab', $servico_colab, PDO::PARAM_STR);
		    $query->bindParam(':datacriacao', $datacriacao, PDO::PARAM_STR);
		    $query->bindParam(':idcriador', $idcriador, PDO::PARAM_INT);
		    $query->bindParam(':idfilial', $idfilial, PDO::PARAM_INT);
		    $query->bindParam(':idcargo', $idcargo, PDO::PARAM_INT);
		    $query->execute();
		}
    
	
        
		
		
		
        
    
}
$_POST['add_colab'] = "";
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
	<title>Employees - HRMS admin template</title>

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

	<!-- Datetimepicker CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

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
		<?php include_once("includes/header.php"); ?>
		<!-- /Header -->

		<!-- Sidebar -->
		<?php include_once("includes/sidebar.php"); ?>
		<!-- /Sidebar -->

		<!-- Page Wrapper -->
		<div class="page-wrapper">

			<!-- Page Content -->
			<div class="content container-fluid">

				<!-- Page Header -->
				<div class="page-header">
					<div class="row align-items-center">
						<div class="col">
							<h3 class="page-title">Colaboradores</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
								<li class="breadcrumb-item active">Colaboradores</li>
							</ul>
						</div>
						<div class="col-auto float-right ml-auto">
							<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i> Adiconar Colab.</a>

						</div>
					</div>
				</div>
				<!-- /Page Header -->
				<!-- Search Filter -->
				<form method="POST" enctype="multipart/form-data">
					<div class="row filter-row">
						<div class="col-sm-6 col-md-3">
							<div class="form-group form-focus">
								<input type="text" name="pesqid" class="form-control floating">
								<label class="focus-label">ID</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="form-group form-focus">
								<input type="text" name="pesqnome" class="form-control floating">
								<label class="focus-label">Nome do Colaborador</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="form-group form-focus select-focus">
								<select class="select floating">
								    <?php 
								    
								      
        
								    
								    $sql3 = "SELECT * FROM servico";
						                    $queryServ = $dbh->prepare($sql3);
						                    $queryServ->execute();
					                        $resultsServ = $queryServ->fetchAll(PDO::FETCH_OBJ);
					                        	if ($queryServ->rowCount() > 0) {
						foreach ($resultsServ as $row) {
						?>
									<option><?php echo $row->nomeservico;  ?></option>
									<?php }} ?>
								
								</select>
								<label class="focus-label">Serviços</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
						<button type="submit" name="pesq_colab" id="pesq_filial" class="btn btn-success btn-block"> Pesquisar</button>
						</div>
					</div>
				</form>
				<!-- Search Filter -->
				<!-- user profiles list starts her -->

				<div class="row staff-grid-row">
					<?php
					$_POST['add_colab'] = "";
					if(isset($_POST['pesq_colab'])){
						$pesqid = $_POST['pesqid'];
						$pesqname = $_POST["pesqnome"];		
						if(isset($pesqid) && $pesqname == null || $pesqname =="" ){
							$sql = "SELECT * FROM users WHERE  id = :pesqid ";
							$query = $dbh->prepare($sql);
							$query->bindParam(':pesqid', $pesqid, PDO::PARAM_INT);
							
						}else if(isset($pesqname) && $pesqid == null || $pesqid ==""){
							$sql = "SELECT * FROM users WHERE  FirstName = :pesqname ";
							$query = $dbh->prepare($sql);
							$query->bindParam(':pesqname', $pesqname, PDO::PARAM_STR);
						
						}else if(isset($pesqname) && isset($pesqid)){
							$sql = "SELECT * FROM users WHERE  id = :pesqid && FirstName = :pesqname ";
							$query = $dbh->prepare($sql);
							$query->bindParam(':pesqid', $pesqid, PDO::PARAM_INT);
							$query->bindParam(':pesqname', $pesqname, PDO::PARAM_STR);
							
						}
					}else{
						$sql = "SELECT * FROM users";
						$query = $dbh->prepare($sql);
					}
					$_POST['pesq_colab'] = null;
					$query->execute();
					$results = $query->fetchAll(PDO::FETCH_OBJ);
					$cnt = 1;
					if ($query->rowCount() > 0) {
						foreach ($results as $row) {
					?>
							<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3">
								<div class="profile-widget">
									<div class="profile-img">
										<a href="profile.html" class="avatar"><img src="assets/img/user.jpg" alt="picture"></a>
									</div>
									<div class="dropdown profile-action">
										<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_employee"><i class="fa fa-pencil m-r-5"></i> Edit</a>
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
										</div>
									</div>
									<h4 class="user-name m-t-10 mb-0 text-ellipsis"><a href="profile.html"><?php echo htmlentities($row->FirstName) . " "; ?></a></h4>
									<div class="small text-muted"><?php echo htmlentities($row->Designation); ?></div>
								</div>
							</div>
					<?php $cnt += 1;
						}
					} ?>
				</div>

			</div>

			<!-- /Page Content -->

			<!-- Add Employee Modal -->
			<?php include_once("includes/modals/employee/add_employee.php"); ?>
			<!-- /Add Employee Modal -->

			<!-- Edit Employee Modal -->
			<?php include_once("includes/modals/employee/edit_employee.php"); ?>
			<!-- /Edit Employee Modal -->

			<!-- Delete Employee Modal -->
			<?php include_once("includes/modals/employee/delete_employee.php"); ?>
			<!-- /Delete Employee Modal -->

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

	<!-- Datetimepicker JS -->
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/app.js"></script>

</body>

</html>