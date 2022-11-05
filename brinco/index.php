<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['userlogin']) == 0) {
	header('location:login.php');
}
?>
<!DOCTYPE html>
<html >

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
	<meta name="author" content="Dreamguys - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>Dashboard</title>

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">

	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<!-- Lineawesome CSS -->
	<link rel="stylesheet" href="assets/css/line-awesome.min.css">

	<!-- Chart CSS -->
	<link rel="stylesheet" href="assets/plugins/morris/morris.css">

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
					<div class="row">
						<div class="col-sm-12">
							<h3 class="page-title">Bem vindo <?php echo htmlentities(ucfirst($_SESSION['fistname'])); ?>!</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item active">Dashboard</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /Page Header -->

				<div class="row">
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
					    <a href="projects.php">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
								<div class="dash-widget-info">
									<h3>2</h3>
									<span>Pedi. Abertos</span>
								</div>
							</div>
						</div>
						</a>
					</div>
					<?php
					$sql = "SELECT id from clients";
					$query = $dbh->prepare($sql);
					$query->execute();
					$results = $query->fetchAll(PDO::FETCH_OBJ);
					$totalcount = $query->rowCount();
					?>
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
						 <a href="invoices.php">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-barcode"></i></span>
								<div class="dash-widget-info">
									<h3><?php echo $totalcount; ?></h3>
									<span>Faturas </span>
								</div>
							</div>
						</div>
						</a>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
						 <a href="payments.php">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-credit-card-alt"></i></span>
								<div class="dash-widget-info">
									<h3>7</h3>
									<span>Contas a Pagar</span>
								</div>
							</div>
						</div>
						</a>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
						 <a href="employees.php">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-user"></i></span>
								<div class="dash-widget-info">
									<h3>1</h3>
									<span>Colab. Ativos</span>
								</div>
							</div>
						</div>
						</a>
					</div>
				</div>

				<div class="card-footer" style="
    margin-bottom: 10px;">
								<a href="projects.php">Ver todos os pedidos</a>
							</div>
				<div class="row pb-10">
					<div class="col-xl-3 col-lg-3 col-md-6 mb-20">
						<div class="card-box height-100-p widget-style3">
							<div id='list1' class="board-list" ondrop="dropIt(event)" ondragover="allowDrop(event)">

								<div class="list-title">
									Pedidos Recentes
									
								</div>
								
								<div id='card1' class="card" draggable="true" ondragstart="dragStart(event)" style="
    margin: 0;"
>
									<tr>
										<td>
											<row class="row">
												<div class="col-xl-10 col-lg-10 col-md-10 ">
													<h4><a href="project-view.php">Pedidos teste</a></h4>
												</div>
												<div class="col-xl-1 col-lg-1 col-md-1 " style="
    margin: 0px;
    padding: 0px;
">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-left">
															<a class="dropdown-item" href="project-view.php"><i class="fa fa-pencil m-r-5"></i> Edit</a>
															<a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</div>


											</row>

	<p class="text-muted">Lorem Ipsum is simply dummy text of the printing and
									of type and
										scrambled it...
									</p>
											<small class="block text-ellipsis">
												<span>2</span> <span class="text-muted">tarefas abertas, </span>
												<span>5</span> <span class="text-muted">tarefas finalizadas</span>
											</small>
										</td>
										<td>
											<div class="progress progress-xs progress-striped">
												<div class="progress-bar" role="progressbar" data-toggle="tooltip" title="15%" style="width: 15%"></div>
											</div>
										</td>

									</tr>
								</div>
								<div id='card2' class="card" draggable="true" ondragstart="dragStart(event)">
									<tr>
										<td>
											<row class="row">
												<div class="col-xl-10 col-lg-10 col-md-10 ">
													<h4><a href="project-view.php">Pedidos teste</a></h4>
												</div>
												<div class="col-xl-1 col-lg-1 col-md-1 " style="
    margin: 0px;
    padding: 0px;
">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-left">
															<a class="dropdown-item" href="project-view.php"><i class="fa fa-pencil m-r-5"></i> Edit</a>
															<a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</div>


											</row>
	<p class="text-muted">Lorem Ipsum is simply dummy text of the printing and
									 of type and
										scrambled it...
									</p>

											<small class="block text-ellipsis">
											<span>2</span> <span class="text-muted">tarefas abertas, </span>
												<span>5</span> <span class="text-muted">tarefas finalizadas</span>
											</small>
										</td>
										<td>
											<div class="progress progress-xs progress-striped">
												<div class="progress-bar" role="progressbar" data-toggle="tooltip" title="15%" style="width: 15%"></div>
											</div>
										</td>

									</tr>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-6 mb-20">
						<div id="list2" class="board-list" ondrop="dropIt(event)" ondragover="allowDrop(event)">
							<div class="list-title">
								Lucas
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- /Page Content -->

		</div>
		<!-- /Page Wrapper -->


	</div>
	<!-- /Main Wrapper -->

	<!-- javascript links starts here -->
	<!-- jQuery -->
	<script src="assets/js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Slimscroll JS -->
	<script src="assets/js/jquery.slimscroll.min.js"></script>

	<!-- Chart JS -->
	<script src="assets/plugins/morris/morris.min.js"></script>
	<script src="assets/plugins/raphael/raphael.min.js"></script>
	<script src="assets/js/chart.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/app.js"></script>
	<!-- javascript links ends here  -->
	<script>
		function allowDrop(ev) {
			ev.preventDefault(); // default is not to allow drop
		}

		function dragStart(ev) {
			// The 'text/plain' is referring the Data Type (DOMString) 
			// of the Object being dragged.
			// ev.target.id is the id of the Object being dragged
			ev.dataTransfer.setData("text/plain", ev.target.id);
		}

		function dropIt(ev) {
			ev.preventDefault(); // default is not to allow drop
			let sourceId = ev.dataTransfer.getData("text/plain");
			let sourceIdEl = document.getElementById(sourceId);
			let sourceIdParentEl = sourceIdEl.parentElement;
			// ev.target.id here is the id of target Object of the drop
			let targetEl = document.getElementById(ev.target.id)
			let targetParentEl = targetEl.parentElement;

			// Compare List names to see if we are going between lists
			// or within the same list
			if (targetParentEl.id !== sourceIdParentEl.id) {
				// If the source and destination have the same 
				// className (card), then we risk dropping a Card in to a Card
				// That may be a cool feature, but not for us!
				if (targetEl.className === sourceIdEl.className) {
					// Append to parent Object (list), not to a 
					// Card in the list
					// This is in case you drag and drop a Card on top 
					// of a Card in a different list
					targetParentEl.appendChild(sourceIdEl);

				} else {
					// Append to the list
					targetEl.appendChild(sourceIdEl);

				}

			} else {
				// Same list. Swap the text of the two cards
				// Just like swapping the values in two variables

				// Temporary holder of the destination Object
				let holder = targetEl;
				// The text of the destination Object. 
				// We are really just moving the text, not the Card
				let holderText = holder.textContent;
				// Replace the destination Objects text with the sources text
				targetEl.textContent = sourceIdEl.textContent;
				// Replace the sources text with the original destinations
				sourceIdEl.textContent = holderText;
				holderText = '';
			}

		}
	</script>

	<style>
		.board-layout {
			background-color: #c5c5c5;
			font-family: Arial, Helvetica, sans-serif;
			font-size: 15px;
			display: grid;
			grid-template-rows: max-content auto;
			grid-gap: 10px;
			padding: 10px;
			height: 800px;
		}

		.list-layout {
			display: grid;
			grid-gap: 10px;

		}

		.board-text {
			font-weight: bold;
			font-size: 28px;
			padding: 5px;
		}

		.board-lists {
			display: grid;
			grid-auto-columns: 275px;
			grid-auto-flow: column;
			grid-gap: 10px;
			height: 400px;

		}

		.board-list {
			background-color: #e1e1e1;
			border-radius: 3px;
			display: grid;
			grid-auto-rows: max-content;
			grid-gap: 10px;
			/* Chrome use a fixed height */
			height: max-content;
			padding: 10px;
		}

		.list-title {
			font-size: 18px;
			font-weight: bold;
		}

		.card {
			background-color: white;
			border-radius: 3px;
			box-shadow: 0 1px 0 rgba(9, 30, 66, .25);
			padding: 10px;
			cursor: pointer;
		}

		ul {
			padding: 0px;
			margin: 0px;
		}

		#lista li {
			background-color: #1aad72;
			color: #fff;
			margin: 0 0 3px;
			padding: 10px;
			list-style: none;
		}
	</style>
</body>

</html>