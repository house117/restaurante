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

		<div class=" cointainer p-3 mb-2 bg-light text-dark">
			<h1>Mi perfil</h1>
			<form>
				<div class="form-group">
					<label for="nombreProducto">Nombre</label> <input type="text"
						class="form-control" id="nombreProducto"
						value="José Luis Flores García">
				</div>
				<div class="form-group">
					<label for="email">Correo electrónico</label> <input type="email"
						class="form-control" id="email" value="ejemplo@ejemplo.com">
				</div>
				<div class="form-group">
					<label for="categoria">Tipo</label> <select class="form-control"
						id="categoria" value="Administrador">
						<option>Administrador</option>
						<option>Usuario</option>
					</select>
				</div>
				<div class="form-group">
					<label for="contrasena">Cambiar Contraseña</label> <input
						type="password" class="form-control" id="contrasena"
						placeholder="Contraseña">
				</div>
				<div class="form-group">
					<label for="contrasena">Ingresar contraseña actual para guardar datos</label> <input
						type="password" class="form-control" id="contrasena"
						placeholder="Contraseña">
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">Guardar Datos</button>
				</p>

			</form>
		</div>
	</div>
		<!-- END DEMO -->
</body>
</html>