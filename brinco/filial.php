<?php
session_start();
error_reporting(0);
include_once('includes/config.php');
include_once("includes/functions.php");
if (strlen($_SESSION['userlogin']) == 0) {
	header('location:login.php');
} elseif (isset($_GET['delid'])) {

	/*	$rid = intval($_GET['delid']);
	$sql = "DELETE from filiais";
	$query = $dbh->prepare($sql);
*/
	//$query->execute();
	echo "<script>alert('Employee Has Been Deleted');</script>";
	echo "<script>window.location.href ='filial.php'</script>";
}
if (isset($_POST['add_filial'])) {
	try {


		$datacriacao = date('d/m/Y');
		$idcriador = $_SESSION['userlogin'];
		$nomeempresa = $_POST["nomeempresa"];
		$nomefantasia = $_POST["nomefantasia"];
		$endereco = $_POST["endereco"];
		$estados = $_POST["estado"];
		$cep = $_POST["cep"];
		$email1 = $_POST["email1"];
		$email2 = $_POST["email2"];
		$telefone1 = $_POST["telefone1"];
		$telefone2 = $_POST["telefone2"];
		$cnpj = $_POST["cnpj"];
		$idfili = 0;
		$sql = "INSERT INTO filiais (datacriacao, idcriador, nomeempresa, nomefantasia,endereco, estados, cep, email1, email2, telefone1, telefone2, cnpj)
	 VALUES (:datacriacao, :idcriador,:nomeempresa,:nomefantasia,:endereco,:estados,:cep,:email1,:email2,:telefone1,:telefone2,:cnpj)";
		$query = $dbh->prepare($sql);
	
		$query->bindParam(':datacriacao', $datacriacao, PDO::PARAM_STR);
		$query->bindParam(':idcriador', $idcriador, PDO::PARAM_STR);
		$query->bindParam(':nomeempresa', $nomeempresa, PDO::PARAM_STR);
		$query->bindParam(':nomefantasia', $nomefantasia, PDO::PARAM_STR);
		$query->bindParam(':endereco', $endereco, PDO::PARAM_STR);
		$query->bindParam(':estados', $estados, PDO::PARAM_STR);
		$query->bindParam(':cep', $cep, PDO::PARAM_STR);
		$query->bindParam(':email1', $email1, PDO::PARAM_STR);
		$query->bindParam(':email2', $email2, PDO::PARAM_STR);
		$query->bindParam(':telefone1', $telefone1, PDO::PARAM_STR);
		$query->bindParam(':telefone2', $telefone2, PDO::PARAM_STR);
		$query->bindParam(':cnpj', $cnpj, PDO::PARAM_STR);
		$query->execute();
		
	
	} catch (\Throwable $th) {
		echo "<script>alert('$th');</script>";
	}
	$_POST['add_filial'] = null;
}
?>
<!DOCTYPE html>
<html lang="pt_BR">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
	<meta name="author" content="Dreamguys - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>Employees</title>

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
							<h3 class="page-title">Filial</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
								<li class="breadcrumb-item active">Filial</li>
							</ul>
						</div>
						<div class="col-auto float-right ml-auto">
							<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i> Adiconar Filiais</a>
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
							<label class="focus-label">ID</label>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="form-group form-focus">
							<input type="text" class="form-control floating">
							<label class="focus-label">Nome da Filial</label>
						</div>
					</div>

					<div class="col-sm-6 col-md-3">
						<a href="#" class="btn btn-success btn-block"> Pesquisar </a>
					</div>
				</div>
				<!-- Search Filter -->
				<!-- user profiles list starts her -->

				<div class="row staff-grid-row">
					<?php
					$sql = "SELECT * FROM filiais";
					$query = $dbh->prepare($sql);
					$query->execute();
					$results = $query->fetchAll(PDO::FETCH_OBJ);
					$cnt = 1;
					if ($query->rowCount() > 0) {
						foreach ($results as $row) {
					?>
							<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3">
								<div class="profile-widget">
									<div class="profile-img">
										<img src="assets\img\logo2" style="width: 50px;" alt="picture">
									</div>
									<div class="dropdown profile-action">
										<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_employee"><i class="fa fa-pencil m-r-5"></i> Editar</a>
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Arquivar</a>
										</div>
									</div>
									<h4 class="user-name m-t-10 mb-0 text-ellipsis"><a href="#"><?php echo htmlentities($row->nomefantasia); ?></a></h4>
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
			<?php include_once("includes/modals/filia/add_filia.php"); ?>
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