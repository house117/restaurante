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

.social-link:hover,
.social-link:focus {
  background: #ddd;
  text-decoration: none;
  color: #555;
}
</style>
<body>
<jsp:include page="./Header.jsp"></jsp:include>
	<!-- Page content holder -->
	<div class="page-content p-5" id="content">
		<!-- Demo content -->

		<div class=" cointainer p-3 mb-2 bg-light text-dark">
			<h1>Registro</h1>
			<form>
				<div class="form-group">
					<label for="nombreProducto">Nombre</label> <input type="text"
						class="form-control" id="nombreProducto"
						placeholder="Escribe tu nombre completo">
				</div>
				<div class="form-group">
					<label for="email">Correo electr�nico</label> <input type="email"
						class="form-control" id="email" placeholder="ejemplo@ejemplo.com">
				</div>
				<div class="form-group">
					<label for="contrasena">Contrase�a</label> <input
						type="password" class="form-control" id="contrasena"
						placeholder="Contrase�a">
				</div>
				<div class="form-group">
					<label for="contrasena">Confirmar Contrase�a</label> <input
						type="password" class="form-control" id="contrasena"
						placeholder="Confirmar Contrase�a">
				</div>
				<p align="right">

					<button class="btn btn-primary agregar" type="submit">Registrarse</button>
				</p>

			</form>
		</div>
	</div>
	<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>