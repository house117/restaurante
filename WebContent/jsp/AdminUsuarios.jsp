<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="models.UsuarioModel"%>

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
	List <UsuarioModel> listaUsuarios = UsuarioDAO.getAllRecords();
	String tabla = "";
	for (int i = 0; i < listaUsuarios.size(); i++) {
		UsuarioModel auxiliar = listaUsuarios.get(i);
		tabla += "<tr>";
		tabla += "<td  class='col-1'>"+auxiliar.getId_usuario()+"</th>";
		tabla += "<td class='col-3'>"+auxiliar.getNombre_usuario()+"</td>";
		tabla += "<td class='col-3'>"+auxiliar.getCorreo_usuario()+"</td>";
		tabla += "<td class='col-2'>"+auxiliar.getTelefono_usuario()+"</td>";
		tabla += ""+
				"<td class='col-1'>"+
				"<div class='btn-group'>"+
					"<button type='button' class='btn btn-primary dropdown-toggle'"+
						"data-toggle='dropdown' aria-haspopup='true'"+
						"aria-expanded='false'></button>"+
					"<div class='dropdown-menu'"+
						"style='margin-left: -140px; padding: 20px'>"+
						
					
						"<div class='dropdown-divider'></div>"+
							"<a href='"+req.getContextPath()+"/EliminarUsuario2?id_usuario="+auxiliar.getId_usuario()+"' type='button' onclick=\"return confirm('�Seguro que deseas eliminar este registro?')\" style='width: 150px;' class='btn btn-danger'>Eliminar</a>"+
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
				class="text-uppercase font-weight-bold">Men�</small>
		</button>

		<!-- Demo content -->
		<h2 class="display-4 text-white">
			<i class="fa fa-users mr-3 text-primary fa-fw"></i> Usuarios - Administraci�n
		</h2>
		<div class="separator"></div>
		<div class="container-fluid">
		<a class="btn btn-primary float-left agregar btn-lg" href="./AdminUsuariosAgregar.jsp?activo=AdminUsuarios" role="button"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar Usuario</a>	
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
									<th scope="col" class="col-2">Correo</th>
									<th scope="col" class="col-2">Tel�fono</th>
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
									<td class="col-2">S�</td>
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