
<div id="add_employee" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Colaborador</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form method="POST" enctype="multipart/form-data">
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Nome<span class="text-danger">*</span></label>
												<input name="nome_colab" required class="form-control" type="text">
											</div>
										</div>
										
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Login <span class="text-danger">*</span></label>
												<input name="login_colab" required class="form-control" type="text">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Email <span class="text-danger">*</span></label>
												<input name="email_colab" required class="form-control" type="email">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Senha</label>
												<input class="form-control" required name="senha_colab" type="password">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Confirmar Senha</label>
												<input class="form-control" required name="senha_colab2" type="password">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Celular </label>
												<input name="celular_colab" required class="form-control" type="text">
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Endereço </label>
												<input name="endereco_colab" required class="form-control" type="text">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">CEP </label>
												<input name="cep_colab" required class="form-control" type="text">
											</div>
										</div>
			
										<div class="col-md-6">
											<div class="form-group">
												<label>Função <span class="text-danger">*</span></label>
												<select required name="servico_colab" class="select">
													<option>Select Department</option>
													<?php 
											$sql3 = "SELECT * from servico";
											$queryServer = $dbh -> prepare($sql3);
											$queryServer->execute();
											$result2 = $queryServer->fetchAll(PDO::FETCH_OBJ);
											
											if($queryServer->rowCount() > 0){
											    foreach($result2 as $row)
											{          
											
											
												?>  
											<option value='<?php echo $row->id?>'><?php echo $row->nomeservico?></option>
											<?php }} ?> 
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Cargo <span class="text-danger">*</span></label>
												<select required name="idcargo" class="select">
													<option>Selecionar Cargo Department</option>
													<?php 
											$sql3 = "SELECT * from cargo";
											$queryServer = $dbh -> prepare($sql3);
											$queryServer->execute();
											$result2 = $queryServer->fetchAll(PDO::FETCH_OBJ);
											
											if($queryServer->rowCount() > 0){
											    foreach($result2 as $row)
											{          
											
											
												?>  
											<option value='<?php echo $row->id?>'><?php echo $row->cargo?></option>
											<?php }} ?> 
												</select>
											</div>
										</div>
										
									
									</div>
									
									<div class="submit-section">
										<button type="submit" name="add_colab" class="btn btn-primary submit-btn">Cadastrar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>