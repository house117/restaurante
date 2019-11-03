<%@page import="java.util.List"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.ProductoModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Restaurante - Administrador</title>
<jsp:include page="./AdminImports.jsp"></jsp:include>
</head>
<style>
.agregar{
margin-top:15px;
}
</style>
<body>
<%! 
   public String getRecordsTable(HttpServletRequest req) { 
	List <ProductoModel> listaProductos = ProductoDAO.getAllRecords();
	String tabla = "";
	for (int i = 0; i < listaProductos.size(); i++) {
		ProductoModel auxiliar = listaProductos.get(i);
		tabla += "<tr>";
		tabla += "<td  class='col-1'>"+auxiliar.getId_producto()+"</th>";
		tabla += "<td class='col-5'>"+auxiliar.getNombre_producto()+"</td>";
		tabla += "<td class='col-3'>"+auxiliar.getCategoria_producto()+"</td>";
		tabla += "<td class='col-2'>"+auxiliar.getCantidad_producto()+"</td>";
		tabla += ""+
				"<td class='col-1'>"+
				"<div class='btn-group'>"+
					"<button type='button' class='btn btn-primary dropdown-toggle'"+
						"data-toggle='dropdown' aria-haspopup='true'"+
						"aria-expanded='false'></button>"+
					"<div class='dropdown-menu'"+
						"style='margin-left: -140px; padding: 20px'>"+
						"<!--<button type='button' style='width: 150px;' class='btn btn-primary'"+
						"@click='fn_comments(tarea)'>Ver comentarios</button>"+
					"<div class='dropdown-divider'></div>  -->"+
						"<a href='./AdminProductosEditar.jsp?producto_seleccionado="+auxiliar.getId_producto()+"' type='button' style='width: 150px;' class='btn btn-primary'>Editar</a>"+
						"<div class='dropdown-divider'></div>"+
							"<a href='"+req.getContextPath()+"/EliminarProducto?id_producto="+auxiliar.getId_producto()+"' type='button' onclick=\"return confirm('¿Seguro que deseas eliminar este registro?')\" style='width: 150px;' class='btn btn-danger'>Eliminar</a>"+
					"</div>"+
				"</div>"+
			"</td>";
				
		
		
		tabla += "</tr>";
	}
	tabla += "</tabla>";
	return tabla;
   } 
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
		<h2 class="display-4 text-white">
			<i class="fa fa-cutlery" aria-hidden="true"></i> Productos -
			Administración
		</h2>
		<div class="separator"></div>
		<div class="container-fluid">
		<form class="form-inline my-2 my-lg-0 ">
				<input class="form-control mr-sm-2" type="text"
					placeholder="Escribe aquí" aria-label="Search"> 
					<select class="form-control mr-sm-2" id="exampleFormControlSelect1">
					<option>Clave</option>
					<option>Nombre</option>
					<option>Cantidad</option>
					<option>4</option>
					<option>5</option>
				</select>
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Buscar</button> 
				
			</form>	
			<br>
			<div class="row">
				<div class="col-lg-12 mx-auto bg-white rounded shadow">

					<!-- Fixed header table-->
					<div class="table-responsive">
						<table class="table table-fixed">
							<thead>
								<tr>
									<th scope="col" class="col-1">Id</th>
									<th scope="col" class="col-5">Nombre</th>
									<th scope="col" class="col-3">Categoría</th>
									<th scope="col" class="col-2">Cantidad</th>
									<th scope="col" class="col-1">Opción</th>
								</tr>
							</thead>
							<tbody>
							<%=getRecordsTable(request) %>
							</tbody>
							<!--  
								<tr>
									<th scope="row" class="col-2">T133</th>
									<td class="col-2">Torta de chorizo</td>
									<td class="col-2">Tortas</td>
									<td class="col-2">15</td>
									<td class="col-2">Sí</td>
									<td class="col-2">
										<div class="btn-group">
											<button type="button" class="btn btn-primary dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"></button>
											<div class="dropdown-menu"
												style="margin-left: -140px; padding: 20px">-->
												<!--<button type="button" style="width: 150px;" class="btn btn-primary"
												@click="fn_comments(tarea)">Ver comentarios</button>
											<div class="dropdown-divider"></div>  -->
											<!--  
												<a href="./AdminProductosEditar.jsp" type="button" style="width: 150px;" class="btn btn-primary">Editar</a>
												<div class="dropdown-divider"></div>
												<button
													v-if="colaboradorLogged.idcolaborador==tarea.responsable"
													type="button" style="width: 150px;" class="btn btn-danger"
													@click="fn_eliminar(tarea.idencargo)">Eliminar</button>
											</div>
										</div>
									</td>
								</tr>-->
								
						</table>
						
					</div>
					
					<!-- End -->

				</div>
								<a class="btn btn-primary float-right agregar" href="./AdminProductosAgregar.jsp?activo=AdminProductos" role="button">Agregar Producto</a>	
				
			</div>

		</div>
	</div>

	</div>
	<!-- End demo content -->
</body>
</html>