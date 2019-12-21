<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.List"%>
<%@page import="dao.SucursalDAO"%>
<%@page import="models.SucursalModel"%>
	<%@page import="models.EmpresaModel"%>
<%@ page import="dao.EmpresaDAO"%>
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


<%! 
   public String getRecordsTable(HttpServletRequest req) { 
	List <SucursalModel> listaSucursales = SucursalDAO.getAllRecords();
	String tabla = "";
	for (int i = 0; i < listaSucursales.size(); i++) {
		SucursalModel auxiliar = listaSucursales.get(i);
		tabla += "<tr>";
		tabla += "<td  class='col-1'>"+auxiliar.getId_sucursal()+"</td>";
		tabla += "<td class='col-3'>"+auxiliar.getNombre_sucursal()+"</td>";
		tabla += "<td class='col-3'>"+auxiliar.getCorreo_sucursal()+"</td>";
		tabla += "<td class='col-2'>"+auxiliar.getTelefono_sucursal()+"</td>";
		tabla += ""+
				"<td class='col-1'>"+
				"<div class='btn-group'>"+
					"<button type='button' class='btn btn-primary dropdown-toggle'"+
						"data-toggle='dropdown' aria-haspopup='true'"+
						"aria-expanded='false'></button>"+
					"<div class='dropdown-menu'"+
						"style='margin-left: -140px; padding: 20px'>"+
						
"<a href='./AdminEmpresaActualizarSucursal.jsp?producto_seleccionado="+auxiliar.getId_sucursal()+"&activo=AdminEmpresa' type='button' style='width: 150px;' class='btn btn-primary'>Editar</a>"+
						"<div class='dropdown-divider'></div>"+
							"<a href='"+req.getContextPath()+"/EliminarProducto?id_producto="+auxiliar.getId_sucursal()+"&activo=AdminEmpresa' type='button' onclick=\"return confirm('¿Seguro que deseas eliminar este registro?')\" style='width: 150px;' class='btn btn-danger'>Eliminar</a>"+
					"</div>"+
				"</div>"+
			"</td>";
		tabla += "</tr>";
	}
	tabla += "</tabla>";
	return tabla;
   } 
%>




<%
		
		EmpresaModel empresa = EmpresaDAO.getEmpresa();
		if(empresa.getNombre_empresa() .equals("null")) empresa.setNombre_empresa("");
		if(empresa.getDireccion1_empresa() == null) empresa.setDireccion1_empresa("");
		if(empresa.getDireccion2_empresa() == null) empresa.setDireccion2_empresa("");
		if(empresa.getUrlimagen_empresa()== null) empresa.setUrlimagen_empresa("");
		if(empresa.getCorreo_empresa() == null) empresa.setCorreo_empresa("");
		if(empresa.getTelefono1_empresa() == null) empresa.setTelefono1_empresa("");
		if(empresa.getTelefono2_empresa() == null) empresa.setTelefono2_empresa("");
		if(empresa.getFacebook_empresa() == null) empresa.setFacebook_empresa("");
		if(empresa.getTwitter_empresa() == null) empresa.setTwitter_empresa("");
		if(empresa.getInstagram_empresa() == null) empresa.setInstagram_empresa("");
		if(empresa.getLinkedin_empresa()== null) empresa.setLinkedin_empresa("");
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
			<i class="fa fa-building mr-3 fa-fw"></i> Empresa - Gestión
		</h2>
		<div class="separator"></div>
		<div class=" cointainer p-3 mb-2 bg-light text-dark">
			<h1>Datos de la empresa</h1>
			<form method="post" action="<%=request.getContextPath()%>/ActualizarEmpresa">
				<!-- ROW 1, NOMBRE Y TELEFONOS -->
				<input type="hidden" id="custId" name="id_empresa" value="<%=empresa.getId_empresa()%>">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputName">Nombre de la empresa</label> <input
							type="text" class="form-control" id="inputEmail4" placeholder="Nombre para su empresa" 
							name="nombre_empresa"
							value="<%=empresa.getNombre_empresa() %>">
					</div>
					
				</div>
				<!-- ROW 1, NOMBRE Y TELEFONOS FIN -->
				<!-- ROW 2, DIRECCIONES -->
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputAddress">Dirección (línea 1)</label> <input
							type="text" class="form-control" id="inputAddress" placeholder="Primera línea para la página cliente"
							name="direccion1_empresa"
							value="<%=empresa.getDireccion1_empresa()%>">
					</div>
					<div class="form-group col-md-6">
						<label for="inputAddress2">Dirección (línea 2)</label> <input
							type="text" class="form-control" id="inputAddress2" placeholder="Segunda línea para la página cliente"
							name="direccion2_empresa"
							value="<%=empresa.getDireccion2_empresa()%>">
					</div>
				</div>
				<!-- DIRECCIONES FIN -->
				<!-- ROW 3, URL Y CORREO -->
				<div class="form-row">
					<div class="form-group col-md-3">
						<label for="inputName">URL Logo</label> <input type="url"
							class="form-control" id="inputLogo" placeholder="Ejemplo: www.imagenes.com/imagen.jpg (Formato PNG, JPG)"
							name="urlimagen_empresa"
							value="<%= empresa.getUrlimagen_empresa()%>" >
					</div>
					<div class="form-group col-md-3">
						<label for="inputTel1">Correo electrónico</label> <input
							type="email" class="form-control" id="inputEmail" placeholder="Ejemplo: ejem@ejem.com"
							name="correo_empresa"
							value="<%=empresa.getCorreo_empresa()%>">
					</div>
					<div class="form-group col-md-3">
						<label for="inputTel1">Telefono (1)</label> <input type="tel"
							class="form-control" id="inputTel1" placeholder="Ejemplo: 9511997103"
							name="telefono1_empresa"
							value="<%=empresa.getTelefono1_empresa()%>">
					</div>
					<div class="form-group col-md-3">
						<label for="inputTel2">Telefono (2)</label> <input type="tel"
							class="form-control" id="inputTel2" placeholder="Ejemplo: 9511997103"
							name="telefono2_empresa"
							value="<%=empresa.getTelefono2_empresa()%>">
					</div>
				</div>
				<!-- ROW 3, URL Y CORREO FIN -->
				<h5>Apartado Social</h5>
				<!-- ROW 3, URL Y CORREO -->
				<div class="form-row">
					<div class="form-group col-md-3">
						<label for="inputFacebook">Facebook URL</label> <input type="url"
							class="form-control" id="inputFacebook" placeholder="URL de su página de facebook"
							name="facebook_empresa"
							value="<%=empresa.getFacebook_empresa()%>">
					</div>
					<div class="form-group col-md-3">
						<label for="inputTwitter">Twitter URL</label> <input type="url"
							class="form-control" id="inputTwitter" placeholder="URL de su página de twitter"
							name="twitter_empresa"
							value="<%=empresa.getTwitter_empresa()%>">
					</div>
					<div class="form-group col-md-3">
						<label for="inputInstagram">Instagram URL</label> <input type="url"
							class="form-control" id="inputInstagram" placeholder="URL de su instagram"
							name="instagram_empresa"
							value="<%=empresa.getInstagram_empresa()%>">
					</div>
					<div class="form-group col-md-3">
						<label for="inputLinkedin">Linkedin URL</label> <input type="url"
							class="form-control" id="inputLinkedin" placeholder="URL de su página de linkedin"
							name="linkedin_empresa"
							value="<%=empresa.getLinkedin_empresa()%>">
					</div>
				</div>
				<!-- ROW 3, URL Y CORREO FIN -->
				<p align="left">
					&nbsp;
					<button class="btn btn-primary agregar" type="submit">
						<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar cambios
						empresa
					</button>
				</p>
			</form>
			<p>
			<!--  
			<h1>Sucursales</h1>--><!-- ///////////////////////////////APARTADO SUCURSALES////////////////////////////////// -->
			<!--  
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-success agregar "
				href="./AdminEmpresaAgregarSucursal.jsp" role="button"> <i
				class="fa fa-plus-circle" aria-hidden="true"></i> Agregar Sucursal
			</a>
			<br><br>
			<div class="row">
			
				<div class="col-lg-8 mx-auto bg-white rounded shadow">
					<div class="table-responsive">
						<table id="table_id" class=" display table table-fixed">
							<thead>
								<tr>
									<th scope="col" class="col-1">Id</th>
									<th scope="col" class="col-3">Nombre Sucursal</th>
									<th scope="col" class="col-2">Correo</th>
									<th scope="col" class="col-2">Teléfono</th>
									<th scope="col" class="col-1">Opción</th>
								</tr>
							</thead>
							<tbody>
							<%=getRecordsTable(request) %>
							</tbody>	
						</table>
						
					</div>
					-->
					<!-- End -->

				</div>
								
				
			</div>
			<!-- fin apartado sucursales -->
		</div>
</div>
		<!-- END DEMO -->
		
		<!-- MODAL UPDATED -->
			<div id="updatedModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Datos Empresa Actualizados</h4>
						</div>
						<div class="modal-body">
							<p>La empresa ha sido actualizada</p>
							<p class="text-warning">
								<small>Se guardaron los datos.</small>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Aceptar</button>
							

						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->
		
</body>
<script>
$(document).ready(function() {
	$('#table_id').DataTable({
    	"language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
    });
	var url_string = window.location.href;
	var url = new URL(url_string);
	var c = url.searchParams.get("empresa_actualizada");
	console.log(c);
	if (c == "success") {
		console.log("it worked");
		$('#updatedModal').modal();
	}
});
</script>
</html>