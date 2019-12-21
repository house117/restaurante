<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="models.CategoriasModel"%>
<%@page import="models.ProductoModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<jsp:include page="./Imports.jsp"></jsp:include>

<title>Restaurante</title>
</head>
<style>
.dj {
	display: -ms-grid;
	display: grid
}

.dk {
	grid-gap: 40px 24px
}

.dl {
	-ms-grid-columns: repeat(3, 1fr);
	grid-template-columns: repeat(3, 1fr)
}

ul {
	list-style-type: none;
}
</style>

<%!public String getCategoriasMenu(HttpServletRequest req) {

		List<CategoriasModel> listaSucursales = CategoriaDAO.getAllRecords();
		String menuHeaders = "";
for (int i = 0; i < listaSucursales.size(); i++) {
		CategoriasModel auxiliar = listaSucursales.get(i);
			menuHeaders += "<li class=\"list-inline-item\"><a class=\"social-icon text-xs-center\" target=\"_blank\" href=\"#\">"
					+ auxiliar.getNombre_categoria() + "</a></li>";
		}

		return menuHeaders;
	}%>
	
	<%!public String getMenu(HttpServletRequest req, String sCheck) {
		if(sCheck.equals("Logged")){
			List<CategoriasModel> listaSucursales = CategoriaDAO.getAllRecords();
			String menu = "<ul><!-- GENERAL MENU DIV -->";
			for (int i = 0; i < listaSucursales.size(); i++) {
				CategoriasModel auxiliar = listaSucursales.get(i);
				menu+="<li><!--  KIND OF MENU LI -->";
				menu+="<h2>"+auxiliar.getNombre_categoria()+"</h2>";
				menu+="<ul class=\"dj dk dl \"><!-- LIST OF THE SAME KIND -->";
				
				List<ProductoModel> listaProductosCategoria = ProductoDAO.getRecordByCategoria(auxiliar.getNombre_categoria());
				for(int j=0; j<listaProductosCategoria.size(); j++){
					ProductoModel auxProducto = listaProductosCategoria.get(j);
					if(auxProducto.getUrlimagen_producto() == null) auxProducto.setUrlimagen_producto("");
					menu+="<li><!-- LI MENU CARD -->"+
	                        "<div class=\" card mb-3 \" style=\"max-width: 540px;\">"+
	                        "<!-- Menu card -->"+
	                            "<div class=\"row no-gutters\">"+
	                                "<div class=\"col-md-4\">"+
	                                    "<img src=\""+auxProducto.getUrlimagen_producto()+"\" class=\"card-img\" alt=\"...\">"+
	                                "</div>"+
	                                "<div class=\"col-md-8\">"+
	                                    "<div class=\"card-body\">"+
	                                        "<h5 class=\"card-title\">"+auxProducto.getNombre_producto()+" - &nbsp; <small class=\"text-muted \">$"+auxProducto.getPrecio_producto()+"</small>"+"</h5>"+
	                                        "<p class=\"card-text\">"+auxProducto.getDescripcion_producto()+"</p>"+
	                                        "<p class=\"card-text\">"+
	                                            		"<form class=\"  float-right\" action=\""+req.getContextPath()+"/CarritoController\" method=\"post\">"+
	                                            				"<input type=\"hidden\" id=\"custId\" name=\"id_producto\" value=\""+auxProducto.getId_producto()+"\">"+
                                            						"<input type=\"hidden\" id=\"custId\" name=\"nombre_producto\" value=\""+auxProducto.getNombre_producto()+"\">"+
                                       								"<input type=\"hidden\" id=\"custId\" name=\"descripcion_producto\" value=\""+auxProducto.getDescripcion_producto()+"\">"+
                              										"<input type=\"hidden\" id=\"custId\" name=\"categoria_producto\" value=\""+auxProducto.getCategoria_producto()+"\">"+
                       												"<input type=\"hidden\" id=\"custId\" name=\"urlimagen_producto\" value=\""+auxProducto.getUrlimagen_producto()+"\">"+
               														"<input type=\"hidden\" id=\"custId\" name=\"cantidad_producto\" value=\""+auxProducto.getCantidad_producto()+"\">"+
	                                            					"<input type=\"hidden\" id=\"custId\" name=\"precio_producto\" value=\""+auxProducto.getPrecio_producto()+"\">"+
	                                            							"<input type=\"hidden\" id=\"custId\" name=\"deDonde\" value=\"landing\">"+
	    	            			            		"<input class=\"btn btn-primary\" type=\"submit\" name=\"submit\" value=\"+\" ></input>"+
	    	            			            		"</form>"+
	                                        "</p>"+
	                                    "</div>"+
	                                "</div>"+
	                            "</div>"+
	                        "</div><!-- Menu card -->"+
						"</li><!-- END OF LI MENUCARD --></li>";
							
				}
					menu+="</li><!-- END OF LI MENUCARD -->";
					menu+="</ul><!-- LIST OF THE SAME KIND -->";		
			}
			menu +="</ul><!-- GENERAL MENU DIV -->";
			return menu;
		}else if(sCheck.equals("notLogged")){
			List<CategoriasModel> listaSucursales = CategoriaDAO.getAllRecords();
			String menu = "<ul><!-- GENERAL MENU DIV -->";
			for (int i = 0; i < listaSucursales.size(); i++) {
				CategoriasModel auxiliar = listaSucursales.get(i);
				menu+="<li><!--  KIND OF MENU LI -->";
				menu+="<h2>"+auxiliar.getNombre_categoria()+"</h2>";
				menu+="<ul class=\"dj dk dl \"><!-- LIST OF THE SAME KIND -->";
				
				List<ProductoModel> listaProductosCategoria = ProductoDAO.getRecordByCategoria(auxiliar.getNombre_categoria());
				for(int j=0; j<listaProductosCategoria.size(); j++){
					ProductoModel auxProducto = listaProductosCategoria.get(j);
					if(auxProducto.getUrlimagen_producto() == null) auxProducto.setUrlimagen_producto("");
					menu+="<li><!-- LI MENU CARD -->"+
	                        "<div class=\" card mb-3 \" style=\"max-width: 540px;\">"+
	                        "<!-- Menu card -->"+
	                            "<div class=\"row no-gutters\">"+
	                                "<div class=\"col-md-4\">"+
	                                    "<img src=\""+auxProducto.getUrlimagen_producto()+"\" class=\"card-img\" alt=\"...\">"+
	                                "</div>"+
	                                "<div class=\"col-md-8\">"+
	                                    "<div class=\"card-body\">"+
	                                        "<h5 class=\"card-title\">"+auxProducto.getNombre_producto()+"</h5>"+
	                                        "<p class=\"card-text\">"+auxProducto.getDescripcion_producto()+"</p>"+
	                                        "<p class=\"card-text\">"+
	                                            "<small class=\"text-muted\">$"+auxProducto.getPrecio_producto()+"</small>"+
	                                            "<a class=\"btn btn-primary float-right\" href=\" "+req.getContextPath()+"/jsp/Registro.jsp"+" \" role=\"button\">Reg&iacute;strate para Agregar</a>"+
	                                        "</p>"+
	                                    "</div>"+
	                                "</div>"+
	                            "</div>"+
	                        "</div><!-- Menu card -->"+
						"</li><!-- END OF LI MENUCARD --></li>";
							
				}
					menu+="</li><!-- END OF LI MENUCARD -->";
					menu+="</ul><!-- LIST OF THE SAME KIND -->";		
			}
			menu +="</ul><!-- GENERAL MENU DIV -->";
			return menu;
		}else{
			return "";
		}
		
	}%>
<body>
<!-- MODAL UPDATED -->
			<div id="carritoWarningModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Carrito Vac&iacute;o</h4>
						</div>
						<div class="modal-body">
							<p>Primero agrega productos a tu carrito
							</p>
							<p class="text-warning">
								<small>El carrito no contiene productos a&uacute;n</small>
							</p>
						</div>
						<div class="modal-footer">
							
							<a class="btn btn-primary"
								href="./Landing.jsp?activo=Inicio" role="button">Aceptar</a>

						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->
			<!-- MODAL UPDATED -->
			<div id="loginErrorModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Datos incorrectos</h4>
						</div>
						<div class="modal-body">
							<p>El usuario o la contrase&ntilde;a son incorrectos
							</p>
							<p class="text-warning">
								<small>&iexcl;Verifica tus datos!</small>
							</p>
						</div>
						<div class="modal-footer">
							
							<a class="btn btn-primary"
								href="./Landing.jsp?activo=Inicio" role="button">Aceptar</a>

						</div>
					</div>
				</div>
			</div>

			<!-- MODAL -->
			<!-- MODAL UPDATED -->
			<div id="notLoggedWarningModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">No has iniciado sesi&oacute;n</h4>
						</div>
						<div class="modal-body">
							<p>Inicia sesi&oacute;n para poder ver el carrito
							</p>
							<p class="text-warning">
								<small>sesi&oacute;n no iniciada</small>
							</p>
						</div>
						<div class="modal-footer">
							
							<a class="btn btn-primary"
								href="./Landing.jsp?activo=Inicio" role="button">Aceptar</a>

						</div>
					</div>
				</div>
			</div>
			<!-- MODAL -->
			<!-- MODAL UPDATED -->
			<div id="maxedAddModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Ya no se pueden agregar más de este producto</h4>
						</div>
						<div class="modal-body">
							<p>¡Te has terminado todo!
							</p>
							<p class="text-warning">
								<small>Puedes intentar comunicarte al número de la empresa en la parte inferior de la página</small>
							</p>
						</div>
						<div class="modal-footer">
							
							<a class="btn btn-primary"
								href="./Landing.jsp?activo=Inicio" role="button">Aceptar</a>

						</div>
					</div>
				</div>
			</div>
			<!-- MODAL -->
			<!-- MODAL UPDATED -->
			<div id="pedidoRealizado" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">¡El pedido se ha realizado con éxito!</h4>
						</div>
						<div class="modal-body">
							<p>Sólo espera a que llegue a tu puerta
							</p>
							<p class="text-warning">
								<small> Espéranos pronto :)</small>
							</p>
						</div>
						<div class="modal-footer">
							
							<a class="btn btn-primary"
								href="./Landing.jsp?activo=Inicio" role="button">Aceptar</a>

						</div>
					</div>
				</div>
			</div>
			<!-- MODAL -->
			
	<div class="container-fluid">
	<%@ include file="./Header.jsp" %>
		
		<!-- <ul class="list-inline">
			<%=getCategoriasMenu(request)%>
		</ul> -->
		<%=getMenu(request, sCheck) %>
		<jsp:include page="./Footer.jsp"></jsp:include>
	</div>
	<!-- Container -->

</body>
<script>
$(document).ready(function() {

	var url_string = window.location.href;
	var url = new URL(url_string);
	var c = url.searchParams.get("loginError");
	var d = url.searchParams.get("carritoWarning");
	var e= url.searchParams.get("notLoggedWarning");
	var add= url.searchParams.get("add");
	var rev= url.searchParams.get("rev");
	var pedido= url.searchParams.get("pedidoHecho");
	console.log(c);
	if (c == "true") {
		console.log("it worked");
		$('#loginErrorModal').modal();
	}
	if(d == "true"){
		console.log("carritoWarning");
		$('#carritoWarningModal').modal();
	}
	if(e == "true"){
		console.log("notLoggedWarning");
		$('#notLoggedWarningModal').modal();
	}
	if(add == "true"){
		$('#maxedAddModal').modal();
	}
	if(rev == "true"){
		$('#maxedRevModal').modal();
	}
	if(pedido == "true"){
		$('#pedidoRealizado').modal();
	}
});

</script>
</html>
