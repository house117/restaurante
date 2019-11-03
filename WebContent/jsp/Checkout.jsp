<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<jsp:include page="./Imports.jsp"></jsp:include>
</head>
<style>
</style>
<body class="bg-light">
	<jsp:include page="./Header.jsp"></jsp:include>

		<div class="container">
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Direcci�n de entrega</h4>
				<form class="needs-validation" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">Nombre</label> <input type="text"
								class="form-control" id="firstName" placeholder="" value=""
								required>
							<div class="invalid-feedback">Nombre v�lido requerid.
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">Apellidos</label> <input type="text"
								class="form-control" id="lastName" placeholder="" value=""
								required>
							<div class="invalid-feedback">Apellido v�lido requerido
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="address">Direcci�n</label> <input type="text"
							class="form-control" id="address" placeholder="1234 Main St"
							required>
						<div class="invalid-feedback">Por favor ingresa tu direcci�n de env�o</div>
					</div>

					<div class="mb-3">
						<label for="address2">Direcci�n l�nea 2 <span class="text-muted">(Opcional)</span></label>
						<input type="text" class="form-control" id="address2"
							placeholder="Apartment or suite">
					</div>

					<div class="row">
						<div class="col-md-5 mb-3">
							<label for="country">Pa�s</label> <select
								class="custom-select d-block w-100" id="country" required>
								<option value="">Elige...</option>
								<option>M�xico</option>
							</select>
							<div class="invalid-feedback"> Por favor elige un pa�s v�lido</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="state">Estado</label> <select
								class="custom-select d-block w-100" id="state" required>
								<option value="">Elige...</option>
								<option>Oaxaca</option>
							</select>
							<div class="invalid-feedback">Pon un estado v�lido
							</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="zip">C�digo postal</label> <input type="text"
								class="form-control" id="zip" placeholder="" required>
							<div class="invalid-feedback">C�digo postal requerido</div>
						</div>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="same-address"> <label class="custom-control-label"
							for="same-address">Shipping address is the same as my
							billing address</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="save-info">
						<label class="custom-control-label" for="save-info">Save
							this information for next time</label>
					</div>
					<hr class="mb-4">

					<h4 class="mb-3">Pago</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credit" name="paymentMethod" type="radio"
								class="custom-control-input" checked required> <label
								class="custom-control-label" for="credit">Tarjeta de cr�dito</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="debit" name="paymentMethod" type="radio"
								class="custom-control-input" required> <label
								class="custom-control-label" for="debit">Tarjeta de d�bito</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="paypal" name="paymentMethod" type="radio"
								class="custom-control-input" required> <label
								class="custom-control-label" for="paypal">Paypal</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="cc-name">Nombre en la tarjeta</label> <input type="text"
								class="form-control" id="cc-name" placeholder="" required>
							<small class="text-muted">Nombre completo como viene en la tarjeta</small>
							<div class="invalid-feedback">El nombre en la tarjeta es obligatorio</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">N�mero de tarjeta</label> <input
								type="text" class="form-control" id="cc-number" placeholder=""
								required>
							<div class="invalid-feedback">N�mero de tarjeta de cr�dito requerido</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="cc-expiration">Expiraci�n</label> <input type="text"
								class="form-control" id="cc-expiration" placeholder="" required>
							<div class="invalid-feedback">Fecha de expiraci�n requerida</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="cc-expiration">CVV</label> <input type="text"
								class="form-control" id="cc-cvv" placeholder="" required>
							<div class="invalid-feedback">C�digo de seguridad requerido</div>
						</div>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">PAGAR</button>
				</form>
			</div>
		</div>
	<jsp:include page="./Footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write(
								'<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="../../../../assets/js/vendor/popper.min.js"></script>
	<script src="../../../../dist/js/bootstrap.min.js"></script>
	<script src="../../../../assets/js/vendor/holder.min.js"></script>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
						(
								function() {
									'use strict';

									window
											.addEventListener(
													'load',
													function() {
														// Fetch all the forms we want to apply custom Bootstrap validation styles to
														var forms = document
																.getElementsByClassName('needs-validation');

														// Loop over them and prevent submission
														var validation = Array.prototype.filter
																.call(
																		forms,
																		function(
																				form) {
																			form
																					.addEventListener(
																							'submit',
																							function(
																									event) {
																								if (form
																										.checkValidity() === false) {
																									event
																											.preventDefault();
																									event
																											.stopPropagation();
																								}
																								form.classList
																										.add('was-validated');
																							},
																							false);
																		});
													}, false);
								})();
	</script>
</body>
</html>