<%@page import="dao.UsuarioDAO"%>
<%@page import="models.UsuarioModel"%>
<%@
page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Mi perfil</title>
<jsp:include page="./Imports.jsp"></jsp:include>
</head>
<style>
.social-link {
	width: 30px;
	height: 30px;
	border: 1px solid #ddd;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #666;
	border-radius: 50%;
	transition: all 0.3s;
	font-size: 0.9rem;
}

.social-link:hover, .social-link:focus {
	background: #ddd;
	text-decoration: none;
	color: #555;
}
</style>

<%
	//allow access only if session exists 
	String user = null;
	if (session.getAttribute("normalUser") == null) {
		response.sendRedirect(request.getContextPath() + "/jsp/Landing.jsp?activo=Inicio");
	} else {
		user = (String) session.getAttribute("normalUser");
		
	}
	String userName = null;
	String sessionID = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("normalUser"))
				userName = cookie.getValue();
			if (cookie.getName().equals("JSESSIONID"))
				sessionID = cookie.getValue();
		}
	}
%>
<%
	UsuarioModel usuario = UsuarioDAO.getRecordByCorreo((String) session.getAttribute("normalUser"));
%>
<body>
	<jsp:include page="./Header.jsp"></jsp:include>
	<!-- Page content holder -->
	<div class="page-content p-5" id="content">
		<!-- Demo content -->

		<div class=" cointainer p-3 mb-2 bg-light text-dark">
			<h1>Mi perfil</h1>

			<!-- MODAL UPDATED -->
			<div id="updatedModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								&times;</button>
							<h4 class="modal-title">Datos actualizados</h4>
						</div>
						<div class="modal-body">
							<p>¡Muy bien! Tus datos han sido actualizados.</p>
							<p class="text-warning">
								<small>Se han
									actualizado los registros en la base de datos</small>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">
								Quedarme aqu&iacute;</button>
							<a class="btn btn-primary" href="./Landing.jsp?activo=Inicio"
								role="button">Regresar
								a inicio</a>
						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->

			<form onSubmit="return checkPassword(this)"
				action="<%=request.getContextPath()%>/ActualizarUsuarioNormal2"
				method="POST">
				<div class="form-group">
					<label for="nombreProducto">Nombre</label> <input type="text"
						class="form-control" id="nombreProducto" name="nombre_usuario"
						value="<%=usuario.getNombre_usuario()%>" />
				</div>
				<div class="form-group">
					<label for="email">Correo electr&oacute;nico</label> <input type="email"
						name="correo_usuario" class="form-control" id="email"
						value="<%=usuario.getCorreo_usuario()%>" />
				</div>
				<div class="form-group">
					<label for="cantidad">Tel&eacute;fono</label> <input type="tel"
						class="form-control" id="cantidad" name="telefono_usuario"
						placeholder="Ej. 9511997104"
						value="<%=usuario.getTelefono_usuario()%>" />
				</div>
				<input type="hidden" id="custId" name="id_usuario"
					value="<%=usuario.getId_usuario()%>" />
					<input type="hidden" id="custId" name="deDonde"
					value="landing" /> 
					 <input
					type="hidden" id="custId" name="tipo_usuario"
					value="<%=usuario.getTipo_usuario()%>" />
				<div class="form-group">
					<label for="email">URL Imagen de usuario</label> <input type="url"
						class="form-control" id="email"
						placeholder="www.imagenes.com/imagen" name="urlimagen_usuario"
						value="<%=usuario.getUrlimagen_usuario()%>" />
				</div>
				<div class="form-group">
					<label for="contrasena">Cambiar
						Contrase&ntilde;a (si no la deseas cambiar, deja el campo como est&aacute;)</label>
					<input type="password" class="form-control" id="contrasena"
						name="contrasena_usuario" placeholder="Contraseï¿½a"
						value="<%=usuario.getContrasena_usuario()%>" />
				</div>
				<div class="form-group">
					<label for="contrasena">Confirmar contrase&ntilde;a</label> <input
						type="password" class="form-control" id="contrasena2"
						name="contrasena_usuario2" placeholder="Contraseï¿½a"
						value="<%=usuario.getContrasena_usuario()%>" />
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">
						Guardar Datos</button>
				</p>
			</form>
			<!-- 
			<h1>Direcciones</h1>
			<h2>Agregar Direcciï¿½n</h2>
			<form action="">
				<div class="form-group">
					<label for="nombreSucursal">Nombre direcciï¿½n</label> <input
						type="text" class="form-control" id="nombreDireccion"
						placeholder="Un nombre para esta direcciï¿½n">
				</div>
				<div class="form-group">
					<label for="fechaReporteInicio">Direcciï¿½n sucursal</label> <input
						type="text" class="form-control" id="direccion"
						placeholder="Ingresa una direcciï¿½n">
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">Agregar
						Direcciï¿½n</button>
				</p>system
				
			</form>
			<h3>Direcciï¿½n: Casita</h3>
			<form action="">
				<div class="form-group">
					<label for="nombreSucursal">Nombre direcciï¿½n</label> <input
						type="text" class="form-control" id="nombreSucursal"
						value="MegaTortas Norte">
				</div>
				<div class="form-group">
					<label for="fechaReporteInicio">Direcciï¿½n sucursal</label> <input
						type="text" class="form-control" id="fechaReporteInicio"
						value="Puerto Angel #4 Mza. 8 Fraccionamiento Santa Elena, Santa Cruz Xoxocotlï¿½n, Oaxaca">
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">Actualizar 
						Direcciï¿½n</button>
				</p>
			</form>
			 -->
		</div>
	</div>
	<jsp:include page="./Footer.jsp"></jsp:include>
</body>
<script>
	$(document).ready(function() {
		var url_string = window.location.href;
		var url = new URL(url_string);
		var c = url.searchParams.get("updated_profile");
		console.log(c);
		if (c == "success") {
			console.log("it worked");
			$("#updatedModal").modal();
		}
	});
	//Function to check Whether both passwords
	// is same or not.
	function checkPassword(form) {
		password1 = form.contrasena_usuario.value;
		password2 = form.contrasena_usuario2.value;

		// If password not entered
		if (password1 == "") {
			alert("Por favor introduzca la contrasena");
			return false;
		}

		// If confirm password not entered
		else if (password2 == "") {
			alert("Por favor confirme la contraseï¿½a");
			return false;
		}

		// If Not same return False.
		else if (password1 != password2) {
			alert("\nLas contraseï¿½as no coinciden, intente de nuevo");
			return false;
		}

		// If same return True.
		else {
			//alert("Password Match: Welcome to GeeksforGeeks!")
			return true;
		}
	}
</script>
</html>
