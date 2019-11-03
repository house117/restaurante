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
.agregar{
margin-top:15px;
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
			<i class="fa fa-users " aria-hidden="true"></i> Usuarios -
			Administración
		</h2>
		<div class="separator"></div>
		<div class="container-fluid">
		<form class="form-inline my-2 my-lg-0 ">
				<input class="form-control mr-sm-2" type="text"
					placeholder="Escribe aquí" aria-label="Search"> 
					<select class="form-control mr-sm-2" id="exampleFormControlSelect1">
					<option>Nombre</option>
					<option>Correo</option>
					<option>Telefono</option>
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
									<th scope="col" class="col-3">Nombre</th>
									<th scope="col" class="col-3">Correo electrónico</th>
									<th scope="col" class="col-2">Telefono</th>
									<th scope="col" class="col-2">Tipo</th>
									<th scope="col" class="col-2">Opción</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="col-3">José Luis Flores García</th>
									<td class="col-3">josefloresgarcia17@gmail.com</td>
									<td class="col-2">9511310436</td>
									<td class="col-2">Administrador</td>
									<td class="col-2">
										<div class="btn-group">
											<button type="button" class="btn btn-primary dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"></button>
											<div class="dropdown-menu"
												style="margin-left: -140px; padding: 20px">
												<!--<button type="button" style="width: 150px;" class="btn btn-primary"
												@click="fn_comments(tarea)">Ver comentarios</button>
											<div class="dropdown-divider"></div>  -->
												<button
													v-if="colaboradorLogged.idcolaborador==tarea.responsable"
													type="button" style="width: 150px;" class="btn btn-danger"
													@click="fn_eliminar(tarea.idencargo)">Eliminar</button>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
					</div>
					
					<!-- End -->

				</div>
								<a class="btn btn-primary float-right agregar" href="./AdminUsuariosAgregar.jsp" role="button">Agregar Usuario</a>	
				
			</div>

		</div>
	</div>

	</div>
	<!-- End demo content -->
</body>
</html>