
<div id="add_employee" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Filial</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Nome da Empresa <span class="text-danger">*</span></label>
								<input name="nomeempresa" id="nomeempresa" required class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Nome fantasia</label>
								<input name="nomefantasia" id="nomefantasia" class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Endereço<span class="text-danger">*</span></label>
								<input class="form-control" name="endereco" id="endereco" required value="" type="text">
							</div>
						</div>
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="form-group">
								<label>Estados<span class="text-danger">*</span></label>
								<select required id="estado" name="estado" class="form-control select">

									<option value="AC">AC
									<option>
									<option value="AL">AL
									<option>
									<option value="AP">AP
									<option>
									<option value="AM">AM
									<option>
									<option value="BA">BA
									<option>
									<option value="BA">CE
									<option>
									<option value="BA">DF
									<option>
									<option value="BA">ES
									<option>
									<option value="BA">GO
									<option>
									<option value="BA">MA
									<option>
									<option value="BA">MT
									<option>
									<option value="BA">MS
									<option>
									<option value="BA">MG
									<option>
									<option value="BA">PA
									<option>
									<option value="BA">PB
									<option>
									<option value="BA">PR
									<option>
									<option value="BA">RJ
									<option>
									<option value="BA">RN
									<option>
									<option value="BA">RS
									<option>
									<option value="BA">RO
									<option>
									<option value="BA">RR
									<option>
									<option value="BA">SP
									<option>
									<option value="BA">SE
									<option>
									<option value="BA">TO
									<option>
								</select>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="form-group">
								<label>CEP</label>
								<input class="form-control" name="cep" id="cep" value="" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Email (1)<span class="text-danger">*</span></label>
								<input name="email1" id="email1" required class="form-control" type="email">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Email (2)<span class="text-danger">*</span></label>
								<input name="email2" id="email2" class="form-control" type="email">
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Telefone (1)<span class="text-danger">*</span></label>
								<input name="telefone1" id="telefone1" required class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Telefone (2) </label>
								<input name="telefone2" id="telefone2" class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">CNPJ <span class="text-danger">*</span></label>
								<input name="cnpj" id="cnpj" required class="form-control" type="text">
							</div>
						</div>

					</div>

					<div class="submit-section">
						<button type="submit" name="add_filial" id="add_filial" class="btn btn-primary submit-btn">Cadastrar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>