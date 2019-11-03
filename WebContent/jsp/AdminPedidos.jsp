<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Restaurante - Administrador</title>
<jsp:include page="./AdminImports.jsp"></jsp:include>
</head>
<style>
.agregar {
	margin-top: 15px;
}
</style>
<body>
	<jsp:include page="./AdminNavBar.jsp"></jsp:include>
	<!-- Page content holder -->
	<div class="page-content p-5" id="content">
		<!-- Toggle button -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold">Menú</small>
		</button>

		<!-- Demo content -->
		<h2 class="display-4 text-white">
			<i class="fa fa-th-large" aria-hidden="true"></i> Pedidos - Nuevos
		</h2>
		<div class="separator"></div>
		<div class="container-fluid">
			<form class="form-inline my-2 my-lg-0 ">
				<input class="form-control mr-sm-2" type="text"
					placeholder="Escribe aquí" aria-label="Search"> <select
					class="form-control mr-sm-2" id="exampleFormControlSelect1">
					<option>No.Orden</option>
					<option>Despachado</option>
					<option>Cliente</option>
				</select>
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Buscar</button>

			</form>



			<br>
			<div class="row">
				<div class="col-lg-12 mx-auto bg-white rounded shadow">

					<!-- Fixed header table-->
					<div class="table-responsive">
						<table class="table table-fixed">
							<thead>
								<tr>
									<th scope="col" class="col-2">No. Orden</th>
									<th scope="col" class="col-2">Pedido</th>
									<th scope="col" class="col-2">Detalles del cliente</th>
									<th scope="col" class="col-2">Hora del pedido</th>
									<th scope="col" class="col-2">Despachado</th>
									<th scope="col" class="col-2">Despachar pedido</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="col-2">114216102019</th>
									<td class="col-2"><ul>
											<li>Torta de chorizo (2)
											<li>Coca cola 355 ml (2)
										</ul></td>
									<td class="col-2">La torta es sin verdura por favor</td>
									<td class="col-2">12:35</td>
									<td class="col-2">NO</td>
									<td class="col-2">
										<button type="button" style="width: 150px;"
											class="btn btn-success">Despachar</button>
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- End -->

				</div>

			</div>

		</div>
		<!--  OTROS PEDIDOS.......................................... -->

		<div class="separator"></div>
		<h2 class="display-4 text-white">
			<i class="fa fa-th-large" aria-hidden="true"></i> Pedidos - Todos
		</h2>
		<div class="separator"></div>
		<div class="container-fluid">
			<form class="form-inline my-2 my-lg-0 ">
				<input class="form-control mr-sm-2" type="text"
					placeholder="Escribe aquí" aria-label="Search"> <select
					class="form-control mr-sm-2" id="exampleFormControlSelect1">
					<option>No.Orden</option>
					<option>Despachado</option>
					<option>Cliente</option>
				</select>
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Buscar</button>

			</form>



			<br>
			<div class="row">
				<div class="col-lg-12 mx-auto bg-white rounded shadow">

					<!-- Fixed header table-->
					<div class="table-responsive">
						<table class="table table-fixed">
							<thead>
								<tr>
									<th scope="col" class="col-2">No. Orden</th>
									<th scope="col" class="col-2">Pedido</th>
									<th scope="col" class="col-2">Detalles del cliente</th>
									<th scope="col" class="col-2">Hora del pedido</th>
									<th scope="col" class="col-2">Despachado</th>
									<th scope="col" class="col-2">Usuario</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="col-2">114216102019</th>
									<td class="col-2"><ul>
											<li>Torta de chorizo (2)
											<li>Coca cola 355 ml (2)
										</ul></td>
									<td class="col-2">La torta es sin verdura por favor</td>
									<td class="col-2">12:35</td>
									<td class="col-2">SI</td>
									<td class="col-2">
										José Luis Flores Garcia
									</td>
								</tr>
							</tbody>
						</table>

					</div>

					<!-- End -->

				</div>

			</div>

		</div>
	</div>
	</div>
	<!-- End demo content -->
</body>
</html>