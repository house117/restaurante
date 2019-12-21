<%@page import="dao.EmpresaDAO"%>
<%@page import="models.CarritoDeCompras"%>
<%@page import="models.EmpresaModel"%>
<%
		EmpresaModel empresa = EmpresaDAO.getEmpresa();

%>
<%
	//allow access only if session exists
	String user = null;
	String sCheck="";
	String navLogged = "";
	int cantidadCarrito = 0;
	System.out.println("normalUser: "+session.getAttribute("normalUser"));
	if (session.getAttribute("normalUser") == null || (session.getAttribute("normalUser") == null && session.getAttribute("tipo_usuario").equals("Administrador"))) {
		sCheck="notLogged";
		navLogged = "<!-- NO HAY SESIÓN INICIADA -->"+
			    "<form class=\"form-inline my-2 my-lg-0\"action=\""+request.getContextPath()+"/LoginController2\" method=\"post\">"+
			    "<table>"+
			    "<tr><td><input class=\"form-control mr-sm-2\" type=\"email\" name=\"correo_usuario\" placeholder=\"email\" aria-label=\"Search\">"+
			      "<input class=\"form-control mr-sm-2\" type=\"password\"  name=\"contrasena_usuario\"  placeholder=\"password\" aria-label=\"Search\">"+
			      "<button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Iniciar Sesión</button>&nbsp;"+
			       "<a href=\"http://localhost:8080/Restaurante/jsp/Registro.jsp\" class=\"btn btn-primary btn-md  \" role=\"button\" aria-pressed=\"true\">Regístrate</a>"+
			    "</table>"+
			    "<input type=\"hidden\" id=\"custId\" name=\"proveniente\" value=\"Usuario\">"+
			    "</form>"+
			    "<!-- NO HAY SESIÓN INICIADA -->";
	} else{
		sCheck="Logged";
		CarritoDeCompras carrito = (CarritoDeCompras)session.getAttribute("carrito");
		
		if(carrito != null){
			for(int i = 0; i < carrito.getListaProductos().size(); i++){
				cantidadCarrito+=carrito.getListaProductos().get(i).getCantidad();
			}
		}
		
		navLogged = "<!-- HAY SESIÓN INICIADA -->"+
				"<div class=\"py-4 px-3 mb-4 bg-light\">"+
			    "<div class=\"media d-flex align-items-center\">"+
			        "<img src=\""+session.getAttribute("usuarioProfPic")+"\" alt=\"...\" width=\"65\"  height=\"65\" class=\"mr-3 rounded-circle img-thumbnail shadow-sm\">"+
			        "<div class=\"media-body\">"+
			            "<h6 class=\"m-0\">"+session.getAttribute("usuarioNombre")+"</h6>"+
			            		"<form action=\""+request.getContextPath()+"/LogoutController2\" method=\"post\">"+
			            				"<a href=\"http://localhost:8080/Restaurante/jsp/MiPerfil.jsp\"class=\"\">Mi perfil</a> | "+
			            		"<input class=\"btn btn-link\" type=\"submit\" value=\"Cerrar sesión\" ></input>"+
			            		"</form>"+
			            		
			        "</div>"+
			    "</div>"+
			"</div>"+
			"<!-- HAY SESIÓN INICIADA -->";
			user = (String) session.getAttribute("normalUser");
		String userName = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("normalUser"))
					userName = cookie.getValue();
			}
		}
	}
%>

<% 
	String parametro = (request.getParameter("activo") != null) ? request.getParameter("activo") : "";
%>
<header>
<div class="container-fluid">
<nav class="navbar fixed-top navbar-expand-md navbar-light bg-light ">
  <a class="navbar-brand" href="http://localhost:8080/Restaurante/jsp/Landing.jsp?activo=Inicio">
  <img src="<%=empresa.getUrlimagen_empresa() %>"  width="30" height="30" class="d-inline-block align top" alt="logo">
  <%=empresa.getNombre_empresa() %> <!-- REPLACE NAME AND LOGO SOURCE FOR NAME IN DATABASE -->
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item <%=parametro.equals("Inicio")?"active":"" %>">
        <a class="nav-link" href="http://localhost:8080/Restaurante/jsp/Landing.jsp?activo=Inicio">Inicio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item <%=parametro.equals("Carrito")?"active":""%>">
        <a class="nav-link" href="http://localhost:8080/Restaurante/jsp/Shopping-cart.jsp?activo=Carrito">Carrito (<%=cantidadCarrito %>)<i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
      </li>
      <li class="nav-item <%=parametro.equals("AcercaDe")?"active":""%>">
        <a class="nav-link" href="http://localhost:8080/Restaurante/jsp/AboutUs.jsp?activo=AcercaDe">Acerca de nosotros</a>
      </li>
    </ul>
    <%=navLogged %>
    <!--  Por si se implemente recuperar contrasenia
    <form class="form-inline my-2 my-lg-0">
    <table>
    <tr><td><input class="form-control mr-sm-2" type="email" placeholder="email" aria-label="Search">
      <input class="form-control mr-sm-2" type="password" placeholder="password" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Iniciar Sesión</button> 
      <a href="http://localhost:8080/Restaurante/jsp/LandingLogged.jsp" class="btn btn-outline-success btn-md  " role="button" aria-pressed="true">Iniciar sesión</a>
       <a href="http://localhost:8080/Restaurante/jsp/Registro.jsp" class="btn btn-primary btn-md  " role="button" aria-pressed="true">Regístrate</a>
      <tr><td> <small><a class="nav-link" href="#">¿Olvidaste tu contraseña?</a></small>
    </table>
    </form>
     -->
    
    
  </div>
</nav>
</div>

</header>