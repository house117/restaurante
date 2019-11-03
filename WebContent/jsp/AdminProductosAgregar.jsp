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
<!-- Nombre, Descripcion, Categoria, url, cantidad -->
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
			<h1>Agregar Producto</h1>
			<form action="<%= request.getContextPath()%>/AgregarProducto" method="post">
				<div class="form-group">
					<label for="nombreProducto">Nombre del producto</label> <input
						type="text" class="form-control" id="nombreProducto" name="nombre_producto"
						placeholder="Nombre para el producto">
				</div>
				<div class="form-group">
					<label for="descripcion">Descripción del producto</label>
					<textarea class="form-control" id="descripcion" rows="3" name="descripcion_producto"></textarea>
				</div>
				<div class="form-group">
					<label for="categoria">Categoría</label> <select
						class="form-control" id="categoria" name="categoria_producto">
						<option>Tortas</option>
						<option>Refrescos</option>
						<option>Tacos</option>
					</select>
				</div>
				<div class="form-group">
					<label for="nombreProducto">URL de imagen</label> <input
						type="text" class="form-control" id="nombreProducto" name="urlimagen_producto"
						placeholder="URL...">
				</div>

				<div class="form-group">
					<label for="cantidad">Cantidad</label> <input type="number"
						class="form-control" id="cantidad" placeholder="1" name="cantidad_producto">
				</div>
				<p align="right">
					<a class="btn btn-danger agregar" href="./AdminProductos.jsp?activo=AdminProductos" role="button">Cancelar</a>
					 <button class="btn btn-primary agregar" type="submit">Agregar Producto</button>
				</p>

			</form>
		</div>

		<!-- END DEMO -->
</body>
</html>