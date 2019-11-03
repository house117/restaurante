<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<i class="fa fa-usd" aria-hidden="true"></i> Empresa - Agregar
			Sucursal
		</h2>
		<div class="separator"></div>
		<div class=" cointainer p-3 mb-2 bg-light text-dark">

			<form action="">
				<div class="form-group">
					<label for="nombreSucursal">Nombre sucursal</label> <input
						type="text" class="form-control" id="nombreSucursal"
						value="MegaTortas Norte">
				</div>
				<div class="form-group">
					<label for="fechaReporteInicio">Dirección sucursal</label> <input
						type="text" class="form-control" id="fechaReporteInicio"
						value="Puerto Angel #4 Mza. 8 Fraccionamiento Santa Elena, Santa Cruz Xoxocotlán, Oaxaca">
				</div>

			<p align="right">
					<a class="btn btn-danger agregar" href="./AdminEmpresa.jsp" role="button">Cancelar</a>
					 <button class="btn btn-primary agregar" type="submit">Agregar Sucursal</button>
				</p>
			</form>
		</div>
		<!-- END DEMO -->
</body>
</html>