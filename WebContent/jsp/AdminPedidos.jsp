<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="models.UsuarioModel"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="models.PedidoModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<%! 
   public String getRecordsTable(HttpServletRequest req) { 
	List <PedidoModel> listaPedidos = PedidoDAO.getTodayRecords();
	String tabla = "";
	for (int i = 0; i < listaPedidos.size(); i++) {
		PedidoModel auxiliar = listaPedidos.get(i);
		tabla += "<tr>";
		tabla += "<td  class='col-1'>"+auxiliar.getId_pedido()+"</th>";
		tabla += "<td class='col-3'>"+auxiliar.getFecha_pedido()+"</td>";
		tabla += "<td class='col-3'>"+auxiliar.getEstado_pedido()+"</td>";
		tabla += "<td class='col-2'>"+auxiliar.getTotal_pedido()+"</td>";
		tabla += ""+
				"<td class='col-1'>"+
				"<div class='btn-group'>"+
					"<button type='button' class='btn btn-primary dropdown-toggle'"+
						"data-toggle='dropdown' aria-haspopup='true'"+
						"aria-expanded='false'></button>"+
					"<div class='dropdown-menu'"+
						"style='margin-left: -140px; padding: 20px'>"+
						
"<a href='"+req.getContextPath()+"/jsp/AdminDetallesPedido.jsp?activo=AdminPedidos&id_pedido="+auxiliar.getId_pedido()+"' type='button' style='width: 150px;' class='btn btn-primary'>Detalles pedido</a>"+
						"<div class='dropdown-divider'></div>"+
							//"<a href='"+req.getContextPath()+"/EliminarPedido?id_pedido="+auxiliar.getId_pedido()+"' type='button' onclick=\"return confirm('¿Seguro que deseas eliminar este pedido?')\" style='width: 150px;' class='btn btn-danger'>Eliminar</a>"+
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
			<i class="fa fa-th-large mr-3 text-primary fa-fw"></i> Pedidos - Administración
		</h2>
		<div class="separator"></div>
		<div class="container-fluid">
			<br><br>
			<div class="row">
				<div class="col-lg-9 mx-auto bg-white rounded shadow">

					<!-- Fixed header table-->
					<div class="table-responsive">
						<table id="table_id" class=" display table table-fixed">
							<thead>
								<tr>
									<th scope="col" class="col-1">Id</th>
									<th scope="col" class="col-3">Hora pedido</th>
									<th scope="col" class="col-2">Estado</th>
									<th scope="col" class="col-2">Total</th>
									<th scope="col" class="col-1">Opcion</th>
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