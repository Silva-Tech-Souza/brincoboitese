<div id="add_employee" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Serviços</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-12">

							<label class="col-form-label">Nome do Serviço<span class="text-danger">*</span></label>
							<input name="nomeservico" id="nomeservico" required class="form-control" type="text">
						</div>
					</div>
					<button type="button" class="add_form_field">Add Sub Serviço
						</button>
					<div class="row ">
						<div class="col-sm-6 ">
							<div class="form-group">
								<label class="col-form-label">Sub Serviço</label>
								<input type="text" class="form-control" name="mynome0">
							</div>
						</div>
						<div class="col-sm-6 ">
							<div class="form-group">

								<label class="col-form-label">Preço</label>
								<input type="text" class="form-control" name="mypreco0">
							</div>
						</div>
					</div>
					<div class="row container1">
						
					</div>


			</div>

			<div class="submit-section">
				<button type="submit" name="add_servico" id="add_servico" class="btn btn-primary submit-btn">Cadastrar</button>
			</div>
			</form>
		</div>
	</div>
</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>