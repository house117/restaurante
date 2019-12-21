<%@page import="models.CarritoDeCompras"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="models.CarritoDeCompras"%>
<meta charset="ISO-8859-1">
<title>Carrito de compras</title>
<jsp:include page="./Imports.jsp"></jsp:include>
</head>

<%
String items = "";
String user = null;
CarritoDeCompras carrito2 = new CarritoDeCompras();;
if (session.getAttribute("normalUser") == null) {
	//response.sendRedirect(request.getContextPath() + "/jsp/Landing.jsp?activo=Inicio");
	response.sendRedirect(request.getContextPath()+"/jsp/Landing.jsp?activo=Carrito&notLoggedWarning=true");
} else {
	CarritoDeCompras carrito = null;
	user = (String) session.getAttribute("normalUser");
	System.out.println("CARRITO TIENE???: "+(CarritoDeCompras)session.getAttribute("carrito"));
	 carrito = (CarritoDeCompras)session.getAttribute("carrito");
	if(carrito == null || carrito.getListaProductos().size() < 1){
		response.sendRedirect(request.getContextPath()+"/jsp/Landing.jsp?activo=Carrito&carritoWarning=true");
	}else{
		carrito2 = carrito;
		for(int i = 0; i < carrito.getListaProductos().size(); i++){
			items+=" <tr>"+
				    "<th scope=\"row\">"+
				    "<div class=\"p-2\">"+
				       " <img src=\""+carrito.getListaProductos().get(i).getProducto().getUrlimagen_producto()+"\" alt=\"\" width=\"70\" class=\"img-fluid rounded shadow-sm\">"+
				        "<div class=\"ml-3 d-inline-block align-middle\">"+
				       " <h5 class=\"mb-0\"><a href=\"#\" class=\"text-dark d-inline-block\">"+carrito.getListaProductos().get(i).getProducto().getNombre_producto()+"</a></h5><span class=\"text-muted font-weight-normal font-italic\">Categoría: "+carrito.getListaProductos().get(i).getProducto().getCategoria_producto()+"</span>"+
				        "</div>"+
				 "   </div>"+
				    "</th>"+
				 
				    "<td class=\"align-middle\"><strong>"+carrito.getListaProductos().get(i).getProducto().getPrecio_producto()+"</strong></td>"+
				    "<td class=\"align-middle\"><strong>"+carrito.getListaProductos().get(i).getCantidad()+"</strong>"+
				    "&nbsp;"+
				    		 
				    "</td>"+
				    "<td class=\"align-middle\"><strong>"+
				    		"<form class=\"  float-left\" action=\""+request.getContextPath()+"/CarritoController\" method=\"post\">"+
				    		"<input type=\"hidden\" id=\"custId\" name=\"id_producto\" value=\""+carrito.getListaProductos().get(i).getProducto().getId_producto()+"\">"+
    						"<input type=\"hidden\" id=\"custId\" name=\"nombre_producto\" value=\""+carrito.getListaProductos().get(i).getProducto().getNombre_producto()+"\">"+
								"<input type=\"hidden\" id=\"custId\" name=\"descripcion_producto\" value=\""+carrito.getListaProductos().get(i).getProducto().getDescripcion_producto()+"\">"+
								"<input type=\"hidden\" id=\"custId\" name=\"categoria_producto\" value=\""+carrito.getListaProductos().get(i).getProducto().getCategoria_producto()+"\">"+
								"<input type=\"hidden\" id=\"custId\" name=\"urlimagen_producto\" value=\""+carrito.getListaProductos().get(i).getProducto().getUrlimagen_producto()+"\">"+
								"<input type=\"hidden\" id=\"custId\" name=\"cantidad_producto\" value=\""+carrito.getListaProductos().get(i).getProducto().getCantidad_producto()+"\">"+
        					"<input type=\"hidden\" id=\"custId\" name=\"precio_producto\" value=\""+carrito.getListaProductos().get(i).getProducto().getPrecio_producto()+"\">"+
				    		"<input type=\"hidden\" id=\"custId\" name=\"deDonde\" value=\"carrito\">"+
				    				"<input style=\"padding-right=200px\" class=\"btn btn-primary \" type=\"submit\" name=\"submit\" value=\"+\" ></input>"+
				    						"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		            		"<input style=\"padding-right=200px\" class=\"btn btn-danger \" type=\"submit\" name=\"submit\" value=\"-\" ></input>"+

				    "</form>"+
				    
				    		"</td>"+
				"</tr>";
	}
	//String items = "";
	
	}
}

%>


<body>
<div class="container-fluid">
<jsp:include page="./Header.jsp"></jsp:include>

<div class="px-4 px-lg-0">
  <!-- For demo purpose -->
    <h1 class="display-4">Carrito de compras</h1>
  <!-- End -->

  <div class="pb-5">
      <div class="row">
        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Producto</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Precio</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Cantidad</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Agregar / Eliminar del carrito</div>
                  </th>
                </tr>
              </thead>
              <tbody>
                
                
                <%=items %>
                
                
                
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>
<form action="<%=request.getContextPath()%>/RealizarPedido" method="POST">
      <div class="row py-5 p-4 bg-white rounded shadow-sm">
        <div class="col-lg-6">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Dirección</div>
          <div class="p-4">
            <p class="font-italic mb-4">Ingresa tus datos. Sólo aceptamos pedidos en la ciudad de Oaxaca de Juárez y municipios aledaños, de lo contrario tu pedido será cancelado y te avisaremos vía correo</p>
            <div class="input-group mb-4 border rounded-pill p-2">
              <input type="text" placeholder="Calle y número" name="dir1_pedido" class="form-control border-0">
              <div class="input-group-append border-0">
                <!-- <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Applicar cupón</button> -->
              </div>
            </div>
            <div class="input-group mb-4 border rounded-pill p-2">
              <input type="text" placeholder="Entre calles" name="dir2_pedido" class="form-control border-0">
              <div class="input-group-append border-0">
                <!-- <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Applicar cupón</button> -->
              </div>
            </div>
            <div class="input-group mb-4 border rounded-pill p-2">
              <input type="number" placeholder="Código postal" name="zipcode_pedido" class="form-control border-0">
              <div class="input-group-append border-0">
                <!-- <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Applicar cupón</button> -->
              </div>
            </div>
          </div>
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Detalles para el restaurante</div>
          <div class="p-4">
            <p class="font-italic mb-4">Detalles de tu pedido. Ej. "torta sin verdura" </p>
            <textarea cols="30" rows="2" class="form-control" name="detalles_pedido"></textarea>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Resumen de la orden </div>
          <div class="p-4">
            <p class="font-italic mb-4">El IVA es el 16% del total, en pedidos mayores a $150.00, el envío es gratis, de lo contrario tiene un costo de $40.00, el pago es en efectivo a la entrega</p>
            <ul class="list-unstyled mb-4">
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total de la orden </strong><strong>$<%= carrito2.getTotal()%></strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Costo de envío</strong><strong>$<%= carrito2.getCostoEnvio() %></strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">IVA</strong><strong>$<%=carrito2.getIva() %></strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                <h5 class="font-weight-bold">$<%=carrito2.getTotalPlusIva() %></h5>
              </li>
            </ul>
            
            <button type="submit" class="btn btn-dark btn-block">Enviar pedido</button>
            
          </div>
        </div>
      </div>
</form>
    </div>
</div>

<jsp:include page="./Footer.jsp"></jsp:include>
</div>
</body>
</html>