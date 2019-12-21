<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<!-- Sesion check -->
<%
	//allow access only if session exists
	String user = null;
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath()+"/jsp/AdminLogin.jsp");
	} else
		user = (String) session.getAttribute("user");
	String userName = null;
	String sessionID = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user"))
				userName = cookie.getValue();
			if (cookie.getName().equals("JSESSIONID"))
				sessionID = cookie.getValue();
		}
	}
%>
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

			<form method="post" action="<%=request.getContextPath()%>/AgregarSucursal">
				<div class="form-group">
					<label for="nombreSucursal">Nombre sucursal</label> <input
						type="text" class="form-control" id="nombreSucursal" 
						name="nombre_sucursal"
						placeholder="Ej. Restaurante Sección Norte"
						value="">
				</div>
				<div class="form-group">
					<label for="direccionSucursal">Dirección sucursal</label> <input
						type="text" class="form-control" id="direccionSucursal"
						name="direccion_sucursal"
						placeholder="Ej. Avenida X #123, Colonia Estrella"
						value="">
				</div>
				<div class="form-group">
					<label for="telefonoSucursal">Teléfono de sucursal</label> <input
						type="tel" class="form-control" id="telefonoSucursal"
						name="telefono_sucursal"
						placeholder="Ej. 9511310433"
						value="">
				</div>
				<div class="form-group">
					<label for="correoSucursal">Correo de sucursal</label> <input
						type="email" class="form-control" id="correoSucursal"
						name="correo_sucursal"
						placeholder="Ej. ejemplo_correo@ejemplo.com"
						value="">
				</div>
				<div class="form-group">
					<label for="latitudSucursal">Latitud de sucursal</label> <input
						type="number" step="any" class="form-control" id="latitudSucursal"
						name="latitud_sucursal"
						placeholder="Ej. 17.040273"
						value="">
				</div>
				<div class="form-group">
					<label for="longitudSucursal">Longitud de sucursal</label> <input
						type="number" step="any" class="form-control" id="longitudSucursal"
						name="longitud_sucursal"
						placeholder="Ej. -96.728648"
						value="">
				</div>

			<p align="right">
					<a class="btn btn-danger agregar" href="./AdminEmpresa.jsp?activo=AdminEmpresa" role="button">Cancelar</a>
					 <button class="btn btn-primary agregar" type="submit">Agregar Sucursal</button>
				</p>
			</form>
		</div>
		</div>
		<!-- END DEMO -->
</body>
</html>