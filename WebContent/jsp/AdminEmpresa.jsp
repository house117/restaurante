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
			<i class="fa fa-usd" aria-hidden="true"></i> Empresa - Gestión 
		</h2>
		<div class="separator"></div>
		<div class=" cointainer p-3 mb-2 bg-light text-dark">
			<h1>Datos de la empresa</h1>
			<form class="form-inline">
				<div class="form-group">
					<label for="nombreEmpresa">Nombre de la empresa: &nbsp;&nbsp;&nbsp;</label> <input type="text" 
						class="form-control" id="nombreEmpresa" value="Mega Tortas"
						> &nbsp;
				</div>
				<p align="left">
					&nbsp;<button class="btn btn-primary agregar" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i>
				 Guardar
						</button>
				</p>

			</form>
			<p>
			<h1>Sucursales</h1> <a class="btn btn-success agregar " href="./AdminEmpresaAgregarSucursal.jsp" role="button"> <i class="fa fa-plus-circle" aria-hidden="true"></i>
			 Agregar Sucursal</a>	
			</p>
			<form action="">
			<h4>Sucursal MegaTortas Norte</h4>
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

				<button class="btn btn-primary agregar" type="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i>
				 Guardar
						</button>
			</form>
					<div class="separator"></div>
			
			<form action="">
			<h4>Sucursal MegaTortas Sur</h4>
				<div class="form-group">
					<label for="nombreSucursal">Nombre sucursal</label> <input
						type="text" class="form-control" id="nombreSucursal"
						value="MegaTortas Sur">
				</div>
				<div class="form-group">
					<label for="fechaReporteInicio">Dirección sucursal</label> <input
						type="text" class="form-control" id="fechaReporteInicio"
						value="Puerto Angel #4 Mza. 8 Fraccionamiento Santa Elena, Santa Cruz Xoxocotlán, Oaxaca">
				</div>

				<button class="btn btn-primary agregar" type="submit"> <i class="fa fa-floppy-o" aria-hidden="true"></i>
				 Guardar
						</button>
			</form>
		</div>

		<!-- END DEMO -->
</body>
</html>