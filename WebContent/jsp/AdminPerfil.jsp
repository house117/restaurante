<%@page import="dao.UsuarioDAO"%>
<%@page import="models.UsuarioModel"%>

<%@
page language="java" contentType="text/html; charset=ISO-8859-1"
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
	UsuarioModel usuario = UsuarioDAO.getRecordByCorreo((String) session.getAttribute("user"));
%>
<body>
	
	<!-- Page content holder -->
	<div class="page-content p-5" id="content">
		<!-- Demo content -->
<jsp:include page="AdminNavBar.jsp"></jsp:include>
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
								Aceptar</button>
							
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
					value="admin" /> 
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
		</div>
	</div>
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