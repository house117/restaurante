<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="models.PedidoModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pedidos</title>
<jsp:include page="./AdminImports.jsp"></jsp:include>
</head>
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
<%
int id = Integer.parseInt(request.getParameter("id_pedido"));
PedidoModel pedido = PedidoDAO.getRecordById(id);
System.out.println("detalles= "+pedido.getProductosycant_pedido());
String [] partes = pedido.getProductosycant_pedido().split(",");
String ulista = "<ul>";
System.out.println("??= "+partes.length);
for(int i = 0; i<partes.length; i++){
	ulista+="<li>"+partes[i]+"</li>";
}
ulista+="</ul>";
%>
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
		<h2 class="display-4 text-white">
			<i class="fa fa-building mr-3 fa-fw"></i> Ver y despachar pedido
		</h2>
		<div class="separator"></div>
		<div class=" cointainer p-3 mb-2 bg-light text-dark">
		<h2>Datos del pedido</h2>
		<h5>
		<%=ulista %>
		</h5>
		
			<h2>Detalles del pedido</h2>
			<h5>
			<%=pedido.getDetalles_pedido() %>
			</h5>
			<h2>Dirección del pedido</h2>
			<br>
			<h3>Calle y número</h3>
			<h5>
			<%=pedido.getDir1_pedido()%>
			</h5>
			<br>
			<h3>Entre calles...</h3>
			<h5>
			<%=pedido.getDir2_pedido() %>
			</h5>
			<h3>Estado del pedido</h3>
			<h5>
			<%=pedido.getEstado_pedido() %>
			</h5>
			<form method="post" action="<%=request.getContextPath()%>/DespacharPedido">			
			 <input type="hidden" id="custId" name="id_pedido" value="<%=pedido.getId_pedido()%>">
					<button class="btn btn-primary agregar" name="sub" value="despachar" type="submit">
						<i class="fa fa-floppy-o" aria-hidden="true"></i> Despachar pedido 
					</button>
					&nbsp;&nbsp;&nbsp;
					<button id="eliminar-btn" class="btn btn-danger agregar" name="sub" value="eliminar" type="submit">
						<i class="fa fa-trash" aria-hidden="true"></i> Eliminar pedido
					</button>
					<a class="btn btn-danger agregar float-right" href="./AdminPedidos.jsp?activo=AdminPedidos" role="button">Cancelar</a>
					</form>
		</div>
		</div><!-- Container -->
		<!-- END DEMO -->
		
			
			<!-- MODAL UPDATED -->
			<div id="despachadoModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">El pedido ha sido despachado exitosamente</h4>
						</div>
						<div class="modal-body">
							<p>puedes seguir viendo sus datos, o volver a pedidos y atender nuevos</p>
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
			
			
			<!-- MODAL UPDATE -->
			<div id="deleteModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">¿Estás seguro?</h4>
						</div>
						<div class="modal-body">
							<p>¿Seguro que quieres eliminar este elemento?</p>
							<p class="text-warning">
								<small>Se restaurarán los datos de productos</small>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cerrar</button>
							<button type="button" id="actualizar-confirmed-btn"
								class="btn btn-primary">Eliminar</button>
						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->
		
</body>
<script>
var success = false;
$(document).ready(function() {

	$("#eliminar-btn").click(function(event) {
		if (!success) {
			event.preventDefault();
			$("#deleteModal").modal();
			console.log("LOL?: " + success)
		} else {
			console.log("ELSE")
		}

	});
	$("#actualizar-confirmed-btn").click(function() {
		success = true;
		$('#deleteModal').modal('hide');
		$("#eliminar-btn").trigger('click');
	});
	var url_string = window.location.href;
	var url = new URL(url_string);
	var c = url.searchParams.get("pedido_despachado");
	console.log(c);
	if (c == "success") {
		console.log("it worked");
		$('#despachadoModal').modal();
	}
});
</script>
</html>