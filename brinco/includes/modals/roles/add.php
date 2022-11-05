<div id="add_role" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Adicionar Cargo</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form method="POST" enctype="multipart/form-data">
									<div class="form-group">
										<label>Nome do Cargo<span class="text-danger">*</span></label>
										<input class="form-control" required type="text" name="nomecargo">
									</div>
									<div class="submit-section">
										<button name="add_cargo" type="submit" class="btn btn-primary submit-btn">Cadastrar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>