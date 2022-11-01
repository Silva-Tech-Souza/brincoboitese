<?php 
	session_start();
	error_reporting(0);
	include('includes/config.php');
	if(strlen($_SESSION['userlogin'])==0){
		header('location:login.php');
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
        <title>Expenses - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
		
		<!-- Datatable CSS -->
		<link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">
		
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
								<h3 class="page-title">Despesas</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active">Despesas</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_expense"><i class="fa fa-plus"></i> Adicinar Despesas</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Search Filter -->
					<div class="row filter-row">
						<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Nome do Item</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus select-focus">
								<select class="select floating"> 
									<option> -- Selecione -- </option>
									<option>Lucas</option>
									<option>Teste</option>
								</select>
								<label class="focus-label">Comprado por</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12"> 
							<div class="form-group form-focus select-focus">
								<select class="select floating"> 
									<option> -- Selecione -- </option>
									<option> Dinheiro </option>
									<option> PIX </option>
									<option> Cartão de Credito </option>
										<option> Cartão de Débito </option>
								</select>
								<label class="focus-label">Modo de Pagamento</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus">
								<div class="cal-icon">
									<input class="form-control floating datetimepicker" type="text">
								</div>
								<label class="focus-label">A partir de</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus">
								<div class="cal-icon">
									<input class="form-control floating datetimepicker" type="text">
								</div>
								<label class="focus-label">Finalizado</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<a href="#" class="btn btn-success btn-block"> Pesquisar </a>  
						</div>     
                    </div>
					<!-- /Search Filter -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped custom-table mb-0 datatable">
									<thead>
										<tr>
											<th>Item</th>
											<th>Comprada na</th>
											<th>Data da Compra</th>
											<th>Comprado por</th>
											<th>Valor</th>
											<th>Modo de Pagamento</th>
											<th class="text-center">Status</th>
											<th class="text-right">Ação</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<strong>Dell Laptop</strong>
											</td>
											<td>Amazon</td>
											<td>5 Jan 2019</td>
											<td>
												<h2 class="table-avatar">
													<a href="profile.php" class="avatar avatar-xs"><img src="assets/img/profiles/avatar-04.jpg" alt=""></a>
													<a href="profile.php">Loren Gatlin</a>
												</h2>
											</td>
											<td>R$1215</td>
											<td>Dinheiro</td>
											<td class="text-center">
												<div class="dropdown action-label">
													<a class="btn btn-white btn-sm btn-rounded dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">
														<i class="fa fa-dot-circle-o text-danger"></i> Acabando
													</a>
													<div class="dropdown-menu dropdown-menu-right">
													    <a class="dropdown-item" href="#"><i class="fa fa-dot-circle-o text-danger"></i> Acabou</a>
														<a class="dropdown-item" href="#"><i class="fa fa-dot-circle-o text-warning"></i> Acabando</a>
														<a class="dropdown-item" href="#"><i class="fa fa-dot-circle-o text-success"></i> Cheio</a>
													</div>
												</div>
											</td>
											<td class="text-right">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_expense"><i class="fa fa-pencil m-r-5"></i> Editar</a>
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_expense"><i class="fa fa-trash-o m-r-5"></i> Arquivar</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<strong>Mac System</strong>
											</td>
											<td>Amazon</td>
											<td>5 Jan 2019</td>
											<td>
												<h2 class="table-avatar">
													<a href="profile.php" class="avatar avatar-xs"><img src="assets/img/profiles/avatar-03.jpg" alt=""></a>
													<a href="profile.php">Tarah Shropshire</a>
												</h2>
											</td>
											<td>R$1215</td>
											<td>PIX</td>
											<td class="text-center">
												<div class="dropdown action-label">
													<a class="btn btn-white btn-sm btn-rounded dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">
														<i class="fa fa-dot-circle-o text-success"></i> Cheio
													</a>
													<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#"><i class="fa fa-dot-circle-o text-danger"></i> Acabou</a>
														<a class="dropdown-item" href="#"><i class="fa fa-dot-circle-o text-warning"></i> Acabando</a>
														<a class="dropdown-item" href="#"><i class="fa fa-dot-circle-o text-success"></i> Cheio</a>
													</div>
												</div>
											</td>
											<td class="text-right">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_expense"><i class="fa fa-pencil m-r-5"></i> Editar</a>
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_expense"><i class="fa fa-trash-o m-r-5"></i> Arquivar</a>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
				<!-- Add Expense Modal -->
				<?php include_once("includes/modals/expenses/add.php");?>
				<!-- /Add Expense Modal -->
				
				<!-- Edit Expense Modal -->
				<?php include_once("includes/modals/expenses/edit.php");?>
				<!-- /Edit Expense Modal -->

				<!-- Delete Expense Modal -->
				<?php include_once("includes/modals/expenses/delete.php");?>
				<!-- Delete Expense Modal -->
				
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
		
		<!-- Datatable JS -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/dataTables.bootstrap4.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="assets/js/moment.min.js"></script>
		<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
		
    </body>
</html>