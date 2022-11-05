<?php 
	session_start();
	error_reporting(0);
	include('includes/config.php');
	if(strlen($_SESSION['userlogin'])==0){
		header('location:login.php');
	}
	
	if (isset($_POST['add_cargo'])) {
	    
	    $datacriacao = date('d/m/Y');
		$idcriador = $_SESSION['id'];
		$nomecargo = $_POST['nomecargo'];
		
		$sql = "INSERT INTO cargo(cargo, idcriador, datacriacao, status) VALUES (:nomecargo, :idcriador, :datacriacao, 'on')";
	   $query = $dbh->prepare($sql);
		    $query->bindParam(':nomecargo', $nomecargo, PDO::PARAM_STR);
		    $query->bindParam(':idcriador', $idcriador, PDO::PARAM_INT);
		    $query->bindParam(':datacriacao', $datacriacao, PDO::PARAM_STR);
		    
		    $query->execute();
	   
	    
	}
	
	
	
	$_POST['add_cargo'] = null;
	
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
        <title>Cargos</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
		
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
            <?php include_once("includes/sidebar.php");?>
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Funções e permissões</h3>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-sm-4 col-md-4 col-lg-4 col-xl-3">
							<a href="#" class="btn btn-primary btn-block" data-toggle="modal" data-target="#add_role">
							    <i class="fa fa-plus"></i> Adicionar Cargos</a>
							    	<form method="POST">
						    	 <input type="submit" class="btn btn-primary btn-block " name="arquivados" value="<?php if($_POST['arquivados'] == 'Ativos'){echo 'Arquivados'; }else{ echo 'Ativos'; }?>" >   
							    	</form>
							    	
							    	
							<div class="roles-menu">
								<ul>
								    <?php 
							
								    if ($_POST['arquivados'] == 'Ativos') {
								        $sql3 = "SELECT * from cargo WHERE status = 'off'";
								    $queryServer = $dbh -> prepare($sql3);
									$queryServer->execute();
	                                
	                                $_POST['arquivados'] = null;
                                    }else{
	                                $sql3 = "SELECT * from cargo WHERE status = 'on'";
								    $queryServer = $dbh -> prepare($sql3);
									$queryServer->execute();
								
									$_POST['arquivados'] = 'asdasdasd';
                                	}
                                	$_POST['arquivados']  =null;
								    
									$result2 = $queryServer->fetchAll(PDO::FETCH_OBJ);
									
									if($queryServer->rowCount() > 0){
											    foreach($result2 as $row)
											{    
								    
								    $idcargo2 = $row->id;
								    
								    ?>
									<li class="">
								
								    <?php echo $_POST['arquivados']?>
										  
										  <a  href="<?php echo 'includes\modals\roles\delete.php?idcargo='.$row->id; ?>">
										
													<?php echo $row->cargo?>
                                                    <i  class="material-icons">edit</i>
													<i  class="material-icons">delete</i>
											
										
										  </a>
										  
									</li>
									
								<?php }}?>
									
								</ul>
							</div>
						
						</div>
						<div class="col-sm-8 col-md-8 col-lg-8 col-xl-9">
							<h6 class="card-title m-b-20">Acesso ao módulo</h6>
							<div class="m-b-30">
								<ul class="list-group notification-list">
									<li class="list-group-item">
										Colaborador
										<div class="status-toggle">
											<input type="checkbox" id="staff_module" class="check">
											<label for="staff_module" class="checktoggle">checkbox</label>
										</div>
									</li>
									<li class="list-group-item">
										Feriados
										<div class="status-toggle">
											<input type="checkbox" id="holidays_module" class="check" checked="">
											<label for="holidays_module" class="checktoggle">checkbox</label>
										</div>
									</li>
									<li class="list-group-item">
										Folhas
										<div class="status-toggle">
											<input type="checkbox" id="leave_module" class="check" checked="">
											<label for="leave_module" class="checktoggle">checkbox</label>
										</div>
									</li>
									<li class="list-group-item">
										Pedidos
										<div class="status-toggle">
											<input type="checkbox" id="events_module" class="check" checked="">
											<label for="events_module" class="checktoggle">checkbox</label>
										</div>
									</li>
									<li class="list-group-item">
										Clientes
										<div class="status-toggle">
											<input type="checkbox" id="chat_module" class="check" checked="">
											<label for="chat_module" class="checktoggle">checkbox</label>
										</div>
									</li>
									<li class="list-group-item">
										Serviços
										<div class="status-toggle">
											<input type="checkbox" id="job_module" class="check">
											<label for="job_module" class="checktoggle">checkbox</label>
										</div>
									</li>
								</ul>
							</div>      	
							<div class="table-responsive">
								<table id="" class="table table-striped custom-table">
									<thead>
										<tr>
											<th id="permission">Permissão do módulo</th>
											<th id="read" class="text-center">Ler</th>
											<th id="write" class="text-center">Escrever</th>
											<th id="delete" class="text-center">Deletar</th>
											<th id="import" class="text-center">Importar</th>
											<th id="export" class="text-center">Exportar</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Colaborador</td>
											
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
										</tr>
										<tr>
											<td>Feriados</td>
										
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
										</tr>
										<tr>
											<td>Pedidos</td>
											
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
										</tr>
										<tr>
											<td>Serviços</td>
											
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
											<td class="text-center">
												<input type="checkbox" checked="">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
				<!-- Add Role Modal -->
				<?php include_once("includes/modals/roles/add.php"); ?>
				<!-- /Add Role Modal -->
				
				<!-- Edit Role Modal -->
				<?php include_once("includes/modals/roles/edit.php"); ?>
				<!-- /Edit Role Modal -->

				<!-- Delete Role Modal -->
				<?php include_once("includes/modals/roles/delete.php"); ?>
				<!-- /Delete Role Modal -->
				
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

		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
		
    </body>
</html>