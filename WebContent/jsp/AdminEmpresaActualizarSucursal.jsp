<%@page import="dao.SucursalDAO"%>
<%@page import="models.SucursalModel"%>
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
<%
		String producto_seleccionado = request.getParameter("producto_seleccionado");
		String item_actualizado = "";
		if (request.getParameter("item_actualizado") != null
				&& request.getParameter("item_actualizado").equals("success")) {
			item_actualizado = "";
		} else {
			item_actualizado = "true";
		}
		if (producto_seleccionado == null) {
			response.sendRedirect(request.getContextPath() + "jsp/AdminEmpresa?activo=AdminEmpresa");
		}
		SucursalModel producto = SucursalDAO.getRecordById(Integer.parseInt(producto_seleccionado));
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
			<i class="fa fa-usd" aria-hidden="true"></i> Empresa - Actualizar
			Sucursal
		</h2>
		
		<!-- MODAL UPDATE -->
			<div id="updateModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">¿Estás seguro?</h4>
						</div>
						<div class="modal-body">
							<p>¿Seguro que quieres actualizar este elemento?</p>
							<p class="text-warning">
								<small>Sobreescribirás la información en la base de
									datos.</small>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cerrar</button>
							<button type="button" id="actualizar-confirmed-btn"
								class="btn btn-primary">Actualizar</button>
						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->

			<!-- MODAL UPDATED -->
			<div id="updatedModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Sucursal Actualizada</h4>
						</div>
						<div class="modal-body">
							<p>La sucursal ha sido actualizada</p>
							<p class="text-warning">
								<small>Se guardaron los datos.</small>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Seguir gestionando esta sucursal</button>
							<a class="btn btn-primary"
								href="./AdminEmpresa.jsp?activo=AdminEmpresa" role="button">Volver
								a empresa</a>

						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->
		
		
		
		
		<div class="separator"></div>
		<div class=" cointainer p-3 mb-2 bg-light text-dark">

			<form method="post" action="<%=request.getContextPath()%>/ActualizarSucursal">
			<input type="hidden" id="id_producto" name="id_sucursal"
					value="<%=producto.getId_sucursal()%>">
				<div class="form-group">
					<label for="nombreSucursal">Nombre sucursal</label> <input
						type="text" class="form-control" id="nombreSucursal" 
						name="nombre_sucursal"
						placeholder="Ej. Restaurante Sección Norte"
						value="<%=producto.getNombre_sucursal()%>">
				</div>
				<div class="form-group">
					<label for="direccionSucursal">Dirección sucursal</label> <input
						type="text" class="form-control" id="direccionSucursal"
						name="direccion_sucursal"
						placeholder="Ej. Avenida X #123, Colonia Estrella"
						value="<%=producto.getDireccion_sucursal()%>">
				</div>
				<div class="form-group">
					<label for="telefonoSucursal">Teléfono de sucursal</label> <input
						type="tel" class="form-control" id="telefonoSucursal"
						name="telefono_sucursal"
						placeholder="Ej. 9511310433"
						value="<%=producto.getTelefono_sucursal()%>">
				</div>
				<div class="form-group">
					<label for="correoSucursal">Correo de sucursal</label> <input
						type="email" class="form-control" id="correoSucursal"
						name="correo_sucursal"
						placeholder="Ej. ejemplo_correo@ejemplo.com"
						value="<%=producto.getCorreo_sucursal()%>">
				</div>
				<div class="form-group">
					<label for="latitudSucursal">Latitud de sucursal</label> <input
						type="number" step="any" class="form-control" id="latitudSucursal"
						name="latitud_sucursal"
						placeholder="Ej. 17.040273"
						value="<%=producto.getLatitud_sucursal()%>">
				</div>
				<div class="form-group">
					<label for="longitudSucursal">Longitud de sucursal</label> <input
						type="number" step="any" class="form-control" id="longitudSucursal"
						name="longitud_sucursal"
						placeholder="Ej. -96.728648"
						value="<%=producto.getLongitud_sucursal()%>">
				</div>

			<p align="right">
					<a class="btn btn-danger agregar" href="./AdminEmpresa.jsp?activo=AdminEmpresa" role="button">Cancelar</a>
					 <button class="btn btn-primary agregar" type="submit" id="actualizar-btn">Actualizar Sucursal</button>
				</p>
			</form>
		</div>
		</div>
		<!-- END DEMO -->
</body>
<script>
	var success = false;
	$(document).ready(function() {

		$("#actualizar-btn").click(function(event) {
			if (!success) {
				event.preventDefault();
				$("#updateModal").modal();
				console.log("LOL?: " + success)
			} else {
				console.log("ELSE")
			}

		});
		$("#actualizar-confirmed-btn").click(function() {
			success = true;
			$('#updateModal').modal('hide');
			$("#actualizar-btn").trigger('click');
		});
		var url_string = window.location.href;
		var url = new URL(url_string);
		var c = url.searchParams.get("item_actualizado");
		console.log(c);
		if (c == "success") {
			console.log("it worked");
			$('#updatedModal').modal();
		}
	});
</script>
</html>