<?php $set = '1234567890';
$id = substr(str_shuffle($set), 0, 6); ?>
<div id="add_client" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Adicionar Cliente</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form method="POST">
									<div class="row">
									    	<div class="col-md-6">  
											<div class="form-group">
												<label class="col-form-label">Client ID <span class="text-danger">*</span></label>
												<input name="clientid" value="<?php echo 'CLT-'.$id; ?>" readonly class="form-control floating" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Primeiro Nome <span class="text-danger">*</span></label>
												<input name="prinome" required class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Sobrenome</label>
												<input name="sobrenome" required class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">CPF <span class="text-danger">*</span></label>
												<input name="cpf"  class="form-control" type="text">
											</div>
										</div>
											<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Data de Nascimento <span class="text-danger">*</span></label>
												<input name="nascimento" class="form-control" type="date">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Código <span class="text-danger">*</span></label>
												<input name="codigo" required class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Email <span class="text-danger">*</span></label>
												<input name="email" required class="form-control floating" type="email">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Senha</label>
												<input name="senha" required class="form-control" type="password">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Confirmar Senha</label>
												<input name="consenha" required class="form-control" type="password">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Filial <span class="text-danger">*</span></label>
												<select required name="filail" class="select">
													<option>Selecione a Filial</option>
													<?php 
											$sql2 = "SELECT * from filiais";
											$query2 = $dbh -> prepare($sql2);
											$query2->execute();
											$result2=$query2->fetchAll(PDO::FETCH_OBJ);
											foreach($result2 as $row)
											{          
												?>  
											<option value="<?php echo htmlentities($row->nomefantasia);?>">
											<?php echo htmlentities($row->nomefantasia);?></option>
											<?php } ?> 
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Celular </label>
												<input name="celular" required class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Nome da Empresa</label>
												<input name="nomeempresa"  class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">CNPJ</label>
												<input name="cnpj"  class="form-control" type="text">
											</div>
										</div>
											<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">CEP</label>
												<input class="form-control" name="cep" required type="text">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="col-form-label">Endereço</label>
												<input class="form-control" name="endereco" required type="text">
											</div>
										</div>
									
										
									</div>
									<div class="submit-section">
										<button type="submit" name="add_client" class="btn btn-primary submit-btn">Cadastrar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
