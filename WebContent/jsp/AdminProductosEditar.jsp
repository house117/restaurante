<%@page import="model.ProductoModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.ProductoDAO"%>
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
			response.sendRedirect(request.getContextPath() + "jsp/AdminProductos?activo=AdminProductos");
		}
		ProductoModel producto = ProductoDAO.getRecordById(Integer.parseInt(producto_seleccionado));
	%>
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
			<h1>Editar Producto</h1>
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
							<h4 class="modal-title">Producto Actualizado</h4>
						</div>
						<div class="modal-body">
							<p>El producto ha sido actualizado</p>
							<p class="text-warning">
								<small>Se guardaron los datos.</small>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Seguir gestionando este producto</button>
							<a class="btn btn-primary"
								href="./AdminProductos.jsp?activo=AdminProductos" role="button">Volver
								a productos</a>

						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->

			<form action="<%=request.getContextPath()%>/ActualizarProducto"
				method="post">
				<input type="hidden" id="id_producto" name="id_producto"
					value="<%=producto.getId_producto()%>">
				<div class="form-group">
					<label for="nombreProducto">Nombre del producto</label> <input
						type="text" class="form-control" id="nombreProducto"
						name="nombre_producto" value="<%=producto.getNombre_producto()%>" />
				</div>
				<div class="form-group">
					<label for="descripcion">Descripción del producto</label>
					<textarea class="form-control" id="descripcion" rows="3"
						name="descripcion_producto"><%=producto.getDescripcion_producto()%></textarea>
				</div>
				<div class="form-group">
					<label for="categoria">Categoría</label> <select
						class="form-control" id="categoria" name="categoria_producto"
						value="<%=producto.getCategoria_producto()%>">
						<option
							<%=producto.getCategoria_producto().equals("Tortas") ? "selected" : ""%>>Tortas</option>
						<option
							<%=producto.getCategoria_producto().equals("Refrescos") ? "selected" : ""%>>Refrescos</option>
						<option
							<%=producto.getCategoria_producto().equals("Tacos") ? "selected" : ""%>>Tacos</option>
					</select>
				</div>
				<div class="form-group">
					<label for="nombreProducto">URL de imagen</label> <input
						type="text" class="form-control" id="nombreProducto"
						name="urlimagen_producto"
						value="<%=producto.getUrlimagen_producto()%>" />
				</div>

				<div class="form-group">
					<label for="cantidad">Cantidad</label> <input type="number"
						class="form-control" id="cantidad" name="cantidad_producto"
						value="<%=producto.getCantidad_producto()%>">
				</div>
				<p align="right">
					<a class="btn btn-danger agregar"
						href="./AdminProductos.jsp?activo=AdminProductos" role="button">Cancelar</a>
					<button class="btn btn-primary agregar" type="submit"
						id="actualizar-btn">Actualizar Producto</button>

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