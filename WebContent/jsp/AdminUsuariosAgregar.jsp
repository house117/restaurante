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

		<div class=" cointainer p-3 mb-2 bg-light text-dark">
			<h1>Agregar Usuario</h1>
			<form onSubmit = "return checkPassword(this)" action="<%=request.getContextPath()%>/AgregarUsuario2" method="POST">
				<div class="form-group">
					<label for="nombreProducto">Nombre</label> <input type="text"
						class="form-control" id="nombreProducto" name="nombre_usuario"
						placeholder="Escribe tu nombre completo">
				</div>
				<input
                        type="hidden"
                        id="custId"
                        name="tipoUsuario"
                        value="Administrador"
                    />
				<div class="form-group">
					<label for="email">Correo electrónico</label> <input type="email"
						class="form-control" id="email" placeholder="ejemplo@ejemplo.com" name="correo_usuario">
				</div>
				<div class="form-group">
					<label for="cantidad">Teléfono</label> <input type="tel"
						class="form-control" id="cantidad" name="telefono_usuario"
						>
				</div>
				<div class="form-group">
					<label for="categoria">Tipo</label> <select class="form-control" name="tipo_usuario"
						id="categoria">
						<option>Administrador</option>
						<option>Usuario</option>
					</select>
				</div>
				<div class="form-group">
					<label for="email">URL Imagen de usuario</label> <input type="url"
						class="form-control" id="email" placeholder="www.imagenes.com/imagen" name="urlimagen_usuario">
				</div>
				<div class="form-group">
					<label for="contrasena">Contraseña</label> <input
						type="password" class="form-control" id="contrasena" name="contrasena_usuario"
						placeholder="Contraseña">
				</div>
				<div class="form-group">
					<label for="contrasena">Confirmar contraseña</label> <input
						type="password" class="form-control" id="contrasena2" name="contrasena_usuario2"
						placeholder="Contraseña">
				</div>
				
				<p align="right">
					<a class="btn btn-danger agregar" href="./AdminUsuarios.jsp"
						role="button">Cancelar</a>
					<button class="btn btn-primary agregar" type="submit" id="agregar-btn">
						Agregar Usuario</button>
				</p>
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
							<p>¿Seguro que quieres agregar este elemento?</p>
							<p class="text-warning">
								<small>Sobreescribirás la información en la base de
									datos.</small>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancelar</button>
							<button type="button" id="agregar-confirmed-btn"
								class="btn btn-primary">Agregar usuario</button>
						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->
			</form>
		</div>
	</div>
		<!-- END DEMO -->
</body>
<script>
	var success = false;
	$(document).ready(function() {

		$("#agregar-btn").click(function(event) {
			if (!success) {
				event.preventDefault();
				$("#updateModal").modal();
				console.log("LOL?: " + success)
			} else {
				console.log("ELSE")
			}

		});
		$("#agregar-confirmed-btn").click(function() {
			success = true;
			$('#updateModal').modal('hide');
			$("#agregar-btn").trigger('click');
		});
		
	});
	
	// Function to check Whether both passwords 
    // is same or not. 
    function checkPassword(form) { 
        password1 = form.contrasena_usuario.value; 
        password2 = form.contrasena_usuario2.value; 

        // If password not entered 
        if (password1 == '') {
        	 alert ("Por favor introduzca la contrasena");
         	return false;
        }
           
              
        // If confirm password not entered 
        else if (password2 == '') {
        	alert ("Por favor confirme la contraseña"); 
        	return false;
        }
            
              
        // If Not same return False.     
        else if (password1 != password2) { 
            alert ("\nLas contraseñas no coinciden, intente de nuevo") 
            return false; 
        } 

        // If same return True. 
        else{ 
            //alert("Password Match: Welcome to GeeksforGeeks!") 
            return true; 
        } 
    } 
</script>
</html>