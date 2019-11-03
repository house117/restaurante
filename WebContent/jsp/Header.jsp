<header>
<div class="container-fluid">
<nav class="navbar fixed-top navbar-expand-md navbar-light bg-light ">
  <a class="navbar-brand" href="http://localhost:8080/Restaurante/jsp/Landing.jsp">
  <img src="https://logo-logos.com/wp-content/uploads/2016/10/McDonalds_logo_logotype.png"  width="30" height="30" class="d-inline-block align top" alt="logo">
  MegaTortas <!-- REPLACE NAME AND LOGO SOURCE FOR NAME IN DATABASE -->
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="http://localhost:8080/Restaurante/jsp/Landing.jsp">Inicio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/Restaurante/jsp/Shopping-cart.jsp">Carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/Restaurante/jsp/AboutUs.jsp">Acerca de nosotros</a>
      </li>
    </ul>
    <!-- NO HAY SESIÓN INICIADA -->
    <form class="form-inline my-2 my-lg-0">
    <table>
    <tr><td><input class="form-control mr-sm-2" type="email" placeholder="email" aria-label="Search">
      <input class="form-control mr-sm-2" type="password" placeholder="password" aria-label="Search">
      <!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Iniciar Sesión</button> -->
      <a href="http://localhost:8080/Restaurante/jsp/LandingLogged.jsp" class="btn btn-outline-success btn-md  " role="button" aria-pressed="true">Iniciar sesión</a>
       <a href="http://localhost:8080/Restaurante/jsp/Registro.jsp" class="btn btn-primary btn-md  " role="button" aria-pressed="true">Regístrate</a>
      <tr><td> <small><a class="nav-link" href="#">¿Olvidaste tu contraseña?</a></small>

    </table>
      
    </form>
     
    <!-- NO HAY SESIÓN INICIADA -->
  </div>
</nav>
</div>

</header>