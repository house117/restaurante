<%@page import="dao.EmpresaDAO"%>
<%@page import="models.EmpresaModel"%>

<%
		EmpresaModel empresa = EmpresaDAO.getEmpresa(); 
%>
<footer class="footer">
  <div class="footer-left col-md-4 col-sm-6">
    <p class="about">
      <span> Sobre nosotros</span> Desde 1995, nos dedicamos a hacer las mejores tortas de toda la ciudad, y buscamos tener las mejores tortas de todo el mundo,
      utilizamos ingredientes naturales y de alta calidad, para que as&iacute; usted pueda tener una torta que va m&aacute;s all&aacute; de lo convencional, que lo haga volver
      siempre con nosotros. Atte. Jos&eacute; Luis F.G. CEO de MegaTortas!
    </p>
    <div class="icons">
      <a href="<%=empresa.getFacebook_empresa()%>" target="_blank"><i class="fa fa-facebook"></i></a>
      <a href="<%=empresa.getTwitter_empresa()%>" target="_blank"><i class="fa fa-twitter"></i></a>
      <a href="<%=empresa.getInstagram_empresa()%>" target="_blank"><i class="fa fa-instagram"></i></a> 
      <a href="<%=empresa.getLinkedin_empresa()%>" target="_blank"><i class="fa fa-linkedin"></i></a>
      <!--   a href="#"><i class="fa fa-google-plus"></i></a>-->
      <!-- -->
    </div>
  </div>
  <div class="footer-center col-md-4 col-sm-6">
    <div>
      <i class="fa fa-map-marker"></i>
      <p><span> <%=empresa.getDireccion1_empresa() %></span> <%= empresa.getDireccion2_empresa()%></p>
    </div>
    <div>
      <i class="fa fa-phone"></i>
      <p> <%= empresa.getTelefono1_empresa()%></p>
    </div>
    <div>
      <i class="fa fa-envelope"></i>
      <p><a href="#"> <%= empresa.getCorreo_empresa()%></a></p>
    </div>
  </div>
  <div class="footer-right col-md-4 col-sm-6">
    <h2> <%= empresa.getNombre_empresa()%><span> Me encanta</span></h2>
    <p class="menu">
      <a href="<%=request.getContextPath()%>/jsp/AdminLogin.jsp"> Sitio Administrativo</a> 
    </p>
    <p class="name"> <%= empresa.getNombre_empresa()%> &copy; 2019</p>
  </div>
</footer>