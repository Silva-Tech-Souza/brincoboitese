<?php 	session_start(); ?>
<div class="header">
	<!-- Logo -->
	<div class="header-left">
		<a href="index.php" class="logo">
			<img src="assets/img/logo.png" width="40" height="40" alt="">
		</a>
	</div>
	<!-- /Logo -->
	
	<a id="toggle_btn" href="javascript:void(0);">
		<span class="bar-icon">
			<span></span>
			<span></span>
			<span></span>
		</span>
	</a>
	
	<!-- Header Title -->
	<div class="page-title-box">
		<h3>Sistema Via CAD</h3>
	</div>
	<!-- /Header Title -->
	
	<a id="mobile_btn" class="mobile_btn" href="#sidebar"><i class="fa fa-bars"></i></a>
	
	<!-- Header Menu -->
	<ul class="nav user-menu">
	
	<!-- /Message Notifications -->	
	<li class="nav-item dropdown has-arrow main-drop">
			<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
			<i class="fa fa-gear"></i> 
			</a>
			<div class="dropdown-menu">
			<?php
					$sql = "SELECT * FROM filiais";
					$query = $dbh->prepare($sql);
					$query->execute();
					$results = $query->fetchAll(PDO::FETCH_OBJ);
					$cnt = 1;
					if ($query->rowCount() > 0) {
						foreach ($results as $row) {
					?>
					<a class="dropdown-item" href="<?php echo 'includes\modals\filia\mudarfilial.php?idfilial='.$row->id; ?>"><?php  if($_SESSION['idfilial']== $row->id){?> <span class="status online"></span><?php  }?> <?php echo  htmlentities($row->nomefantasia); ?></a>
					<?php }
				}?>
			
			</div>
		</li>
	
		
	
		<!-- Notifications -->
		<li class="nav-item dropdown">
		    <?php 	 $iduser = $_SESSION['id'];
					$sql2 = "SELECT * FROM mensagens WHERE id_recebido = :id_recebido";
					$query2 = $dbh->prepare($sql2);
					$query2->bindParam(':id_recebido', $iduser, PDO::PARAM_INT);
					$query2->execute();
					$resultados = $query2->fetchAll(PDO::FETCH_OBJ);
					$cnt = 1; ?>
			<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
				<i class="fa fa-bell-o"></i> <span class="badge badge-pill"><?php 	if ($query2->rowCount() > 0) {
						foreach ($resultados as $row) {echo $query2->rowCount();}} ?></span>
			</a>
			<div class="dropdown-menu notifications">
				<div class="topnav-dropdown-header">
					<span class="notification-title">Notificações</span>
					<a href="includes\modals\mensagens\limpmensagem.php" class="clear-noti"> Limpar Tudo </a>
				</div>
				<div class="noti-content">
					<ul class="notification-list">
					    	<?php
					    
					if ($query2->rowCount() > 0) {
						foreach ($resultados as $row) {
						    
					?>
						<li class="notification-message">
							<a href="activities.php">
								<div class="media">
									<span class="avatar">
										<img alt="" src="assets/img/profiles/avatar-02.jpg">
									</span>
									<div class="media-body">
										<p class="noti-details"><span class="noti-title"><?php echo $row->nome_user; ?></span> <?php echo $row->texto; ?></p>
										<p class="noti-time"><span class="notification-time"><?php echo $row->data; ?></span></p>
									</div>
								</div>
							</a>
						</li>
					<?php }} ?>
						
					
						
					</ul>
				</div>
				<div class="topnav-dropdown-footer">
					<a href="activities.php">Ver todas as notificações</a>
				</div>
			</div>
		</li>
		<!-- /Notifications -->
		
		
	

		<?php 
		$sql = "SELECT * from users";
		$query = $dbh -> prepare($sql);
		$query->execute();
		$result=$query->fetch(PDO::FETCH_OBJ);
		$cnt=1;
		
		?>

		<li class="nav-item dropdown has-arrow main-drop">
			<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
				
				<span class="status online"></span></span>
				<span><?php echo htmlentities(ucfirst($_SESSION['fistname']));?></span>
			</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="profile.php">Meu Perfil<i class="icon-perfintegration"></i></a>
				<a class="dropdown-item" href="settings.php">Confiurações</a>
				<a class="dropdown-item" href="logout.php">Sair</a>
			</div>
		</li>
	</ul>
	<!-- /Header Menu -->
	
	<!-- Mobile Menu -->
	<div class="dropdown mobile-user-menu">
		<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
		<div class="dropdown-menu dropdown-menu-right">
			<a class="dropdown-item" href="profile.php">Meu Perfil</a>
			<a class="dropdown-item" href="settings.php">Configuração</a>
			<a class="dropdown-item" href="login.php">Sair</a>
		</div>
	</div>
	<!-- /Mobile Menu -->
	
</div>