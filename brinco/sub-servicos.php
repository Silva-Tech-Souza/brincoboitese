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
	<title>Sub - Serviços</title>

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
							<h3 class="page-title">Serviços</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
								<li class="breadcrumb-item active">Serviços</li>
							</ul>
						</div>
						<div class="col-auto float-right ml-auto">
							<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i> Adiconar Serviços</a>
							<div class="view-icons">
							</div>
						</div>
					</div>
				</div>
				<!-- /Page Header -->
				<!-- Search Filter -->
				<form method="POST" enctype="multipart/form-data">
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
								<label class="focus-label">Nome do Serviços</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="form-group form-focus select-focus">
								<select name="status" class="select floating">
									<option value="on">Selecione Status</option>
									<option value="on">Ativo</option>
									<option value="off">Arquivado</option>
								</select>
								<label class="focus-label">Status</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<button type="submit" name="pesq_servico" id="pesq_servico" class="btn btn-success btn-block"> Pesquisar </a>
						</div>
					</div>
				</form>
				<!-- Search Filter -->
				<!-- user profiles list starts her -->

				<div class="row staff-grid-row">
					<?php
					$_POST['add_servico'] = null;
					$_POST['mynome0'] = null;
					$_POST['mynome1'] = null;
					$_POST['mynome2'] = null;
					$_POST['mynome3'] = null;
					$_POST['mynome4'] = null;
					$_POST['mynome5'] = null;
					$_POST['mynome6'] = null;
					if (isset($_POST['pesq_servico'])) {
						$status = $_POST['status'];
						$sql = "SELECT * FROM servico WHERE ativado = :status ";
						$query = $dbh->prepare($sql);
						$query->bindParam(':status', $status, PDO::PARAM_STR);
					} else {
						$sql = "SELECT * FROM servico";
						$query = $dbh->prepare($sql);
					}

					$query->execute();
					$results = $query->fetchAll(PDO::FETCH_OBJ);
					$cnt = 1;
					if ($query->rowCount() > 0) {
						foreach ($results as $row) {
					?>
							<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3">
								<div class="profile-widget">
									<div class="profile-img">
										<a href="profile.html" class=""><img src="assets\img\logo2.png" style="width: 50px;" alt="picture"></a>
									</div>
									<div class="dropdown profile-action">
										<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_employee"><i class="fa fa-pencil m-r-5"></i> Editar</a>
											<a class="dropdown-item" href="includes\modals\servicos\edit_servico.php?idservico=<?php echo $row->id?>" ><i class="fa fa-trash-o m-r-5"></i> Desativar</a>
										</div>
									</div>
									<h4 class="user-name m-t-10 mb-0 text-ellipsis"><a href="profile.html"><?php echo htmlentities($row->nomeservico) ?></a></h4>
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
			<?php include_once("includes/modals/servicos/add_servico.php"); ?>
			<!-- /Add Employee Modal -->



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
	<script>
		$(document).ready(function() {
			var max_fields = 10;
			var wrapper = $(".container1");
			var add_button = $(".add_form_field");

			var x = 1;
			$(add_button).click(function(e) {
				e.preventDefault();
				if (x < max_fields) {
					x++;
					$(wrapper).append(
						'<div  class="row col-sm-12">' +
						'<div class="col-sm-6">' +
						'<div class="form-group">' +
						'<label class="col-form-label">Sub Serviço</label>' +
						'<input type="text" class="form-control" name="mynome' + x + '">' +
						'</div>' +
						'</div>' +
						'<div class="col-sm-6 ">' +
						'<div class="form-group">' +
						'<label class="col-form-label">Preço</label> <input type="text" class="form-control" name="mypreco' + x + '">' +
						'</div></div><a href="#" class="delete">Apagar</a></div>');
				} else {
					alert('You Reached the limits')
				}
			});

			$(wrapper).on("click", ".delete", function(e) {
				e.preventDefault();
				$(this).parent('div').remove();
				x--;
			})
		});
	</script>
</body>

</html>