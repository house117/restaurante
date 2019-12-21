<% 
	String parametro = (request.getParameter("activo") != null) ? request.getParameter("activo") : "";
%>
<!-- Vertical navbar -->
<div class="vertical-nav bg-white" id="sidebar">
  <div class="py-4 px-3 mb-4 bg-light">
    <div class="media d-flex align-items-center"><img src="<%=session.getAttribute("usuarioProfPic") %>" alt="..." width="65" class="mr-3 rounded-circle img-thumbnail shadow-sm">
      <div class="media-body">
        <h4 class="m-0"><%=session.getAttribute("usuarioNombre") %></h4>
        <p class="font-weight-light text-muted mb-0"><%=session.getAttribute("tipoUsuario") %></p>
      </div>
    </div>
  </div>

  <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Menú</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
      <a href="./AdminPedidos.jsp?activo=AdminPedidos" class="nav-link  <%= parametro.equals("AdminPedidos") ? "text-white bg-secondary": "text-dark"%>  font-italic">
                <i class="fa fa-th-large mr-3 text-primary fa-fw"></i>
                Pedidos Nuevos
            </a>
    </li>
    
    <li class="nav-item">
      <a href="./AdminProductos.jsp?activo=AdminProductos" class=" nav-link <%= parametro.equals("AdminProductos") ? "text-white bg-secondary": "text-dark" %>   font-italic">
                <i class="fa fa-cutlery mr-3 text-primary fa-fw"></i>
                Productos
            </a>
    </li>
    <li class="nav-item">
      <a href="./AdminUsuarios.jsp?activo=AdminUsuarios" class="nav-link  <%= parametro.equals("AdminUsuarios") ? "text-white bg-secondary": "text-dark" %> font-italic">
                <i class="fa fa-users mr-3 text-primary fa-fw"></i>
                Usuarios
            </a>
    </li>
    <li class="nav-item">
      <a href="./AdminReportes.jsp?activo=AdminReportes" class="nav-link  <%= parametro.equals("AdminReportes") ? "text-white bg-secondary": "text-dark" %> font-italic">
                <i class="fa fa-usd mr-3 text-primary fa-fw"></i>
                Reportes
            </a>
    </li>
    <li class="nav-item">
      <a href="./AdminEmpresa.jsp?activo=AdminEmpresa" class="nav-link  <%= parametro.equals("AdminEmpresa") ? "text-white bg-secondary": "text-dark" %> font-italic">
                <i class="fa fa-building mr-3 text-primary fa-fw"></i>
                Empresa
            </a>
    </li>
     <li class="nav-item">
      <a href="./AdminPerfil.jsp?activo=AdminPerfil" class="nav-link  <%=parametro.equals("AdminPerfil") ? "text-white bg-secondary":"text-dark" %> font-italic">
                <i class="fa fa-area-chart mr-3 text-primary fa-fw"></i>
                Mi Perfil
            </a>
    </li>
  </ul>

  <p class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">Acciones</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
    <form action="<%=request.getContextPath()%>/LogoutController2"
				method="post">
<input class="btn btn-danger btn-lg btn-block" type="submit" value="Cerrar sesión" ></input>
</form>
     <!-- <a href="./Landing.jsp" class="nav-link text-dark font-italic">
                <i class="fa fa-area-chart mr-3 text-primary fa-fw"></i>
                Cerrar Sesión
            </a> --> 
    </li>
   

  </ul>
</div>
<!-- End vertical navbar -->