<%@page import="java.util.List"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="models.ProductoModel"%>
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
<%! 
   public String getRecordsTable(HttpServletRequest req) { 
	List <ProductoModel> listaProductos = ProductoDAO.getAllRecords();
	String tabla = "";
	for (int i = 0; i < listaProductos.size(); i++) {
		ProductoModel auxiliar = listaProductos.get(i);
		tabla += "<tr>";
		tabla += "<td  class='col-1'>"+auxiliar.getId_producto()+"</td>";
		tabla += "<td class='col-3'>"+auxiliar.getNombre_producto()+"</td>";
		tabla += "<td class='col-3'>"+auxiliar.getPrecio_producto()+"</td>";
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
						"<a href='./AdminProductosEditar.jsp?producto_seleccionado="+auxiliar.getId_producto()+"&activo=AdminProductos' type='button' style='width: 150px;' class='btn btn-primary'>Editar</a>"+
						"<div class='dropdown-divider'></div>"+
							"<a href='"+req.getContextPath()+"/EliminarProducto2?id_producto="+auxiliar.getId_producto()+"&activo=AdminProductos' type='button' onclick=\"return confirm('¿Seguro que deseas eliminar este registro?')\" style='width: 150px;' class='btn btn-danger'>Eliminar</a>"+
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
			<i class="fa fa-cutlery" aria-hidden="true"></i> Productos - Administración
		</h2>
		<div class="separator"></div>
		<div class="container-fluid">
		<a class="btn btn-primary float-left agregar btn-lg" href="./AdminProductosAgregar.jsp?activo=AdminProductos" role="button"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar Producto</a>	
			<br><br><br><br>
			<div class="row">
				<div class="col-lg-9 mx-auto bg-white rounded shadow">

					<!-- Fixed header table-->
					<div class="table-responsive">
						<table id="table_id" class=" display table table-fixed">
							<thead>
								<tr>
									<th scope="col" class="col-1">Id</th>
									<th scope="col" class="col-3">Nombre</th>
									<th scope="col" class="col-2">Precio</th>
									<th scope="col" class="col-2">Cantidad</th>
									<th scope="col" class="col-1">Opción</th>
								</tr>
							</thead>
							<tbody>
							<%=getRecordsTable(request) %>
							</tbody>	
						</table>
						
					</div>
					
					<!-- End -->

				</div>
								
				
			</div>

		</div>
	</div>

	
	<!-- End demo content -->
</body>
<script>
$(document).ready( function () {
    $('#table_id').DataTable({
    	"language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
    });
} );
</script>
</html>