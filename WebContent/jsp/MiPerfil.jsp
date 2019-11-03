<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sobre nosotros</title>
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
<body>
	<jsp:include page="./HeaderLogged.jsp"></jsp:include>
	<!-- Page content holder -->
	<div class="page-content p-5" id="content">
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
					<label for="contrasena">Cambiar Contraseña</label> <input
						type="password" class="form-control" id="contrasena"
						placeholder="Contraseña">
				</div>
				<div class="form-group">
					<label for="contrasena">Ingresar contraseña actual para
						guardar datos</label> <input type="password" class="form-control"
						id="contrasena" placeholder="Contraseña">
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">Guardar
						Datos</button>
				</p>

			</form>

			<h1>Direcciones</h1>
			<h2>Agregar Dirección</h2>
			<form action="">
				<div class="form-group">
					<label for="nombreSucursal">Nombre dirección</label> <input
						type="text" class="form-control" id="nombreDireccion"
						placeholder="Un nombre para esta dirección">
				</div>
				<div class="form-group">
					<label for="fechaReporteInicio">Dirección sucursal</label> <input
						type="text" class="form-control" id="direccion"
						placeholder="Ingresa una dirección">
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">Agregar
						Dirección</button>
				</p>
			</form>
			<h3>Dirección: Casita</h3>
			<form action="">
				<div class="form-group">
					<label for="nombreSucursal">Nombre dirección</label> <input
						type="text" class="form-control" id="nombreSucursal"
						value="MegaTortas Norte">
				</div>
				<div class="form-group">
					<label for="fechaReporteInicio">Dirección sucursal</label> <input
						type="text" class="form-control" id="fechaReporteInicio"
						value="Puerto Angel #4 Mza. 8 Fraccionamiento Santa Elena, Santa Cruz Xoxocotlán, Oaxaca">
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">Actualizar 
						Dirección</button>
				</p>
			</form>
		</div>
	</div>
	<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>