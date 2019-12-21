<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Iniciar sesión - Restasoft</title>
<jsp:include page="./Imports.jsp"></jsp:include>
</head>

<style type="text/css">
.login-form {
	width: 340px;
	margin: 50px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}
</style>


<body>
	<%
		//allow access only if session exists
		String user = null;
		if (session.getAttribute("user") == null) {
			System.out.println("ME EJECUTO OLVNNN");
		} else{
			response.sendRedirect(request.getContextPath()+"/jsp/AdminPedidos.jsp?activo=AdminPedidos");
			System.out.println("ME EJECUTO OLVF");
		}
			
		String userName = null;
		String sessionID = null;
		System.out.println("ME EJECUTO OLV");
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
	

	<div class="login-form">
		<form action="<%=request.getContextPath()%>/LoginController2" method="post">
			<h2 class="text-center">Resta-Soft</h2>
			<div class="form-group">
				<input type="email" class="form-control"
					placeholder="Correo de usuario" name="correo_usuario"
					required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					name="contrasena_usuario" placeholder="Contraseña usuario"
					required="required">
			</div>
			 <input type="hidden" id="custId" name="proveniente" value="Administrador">
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">
					Iniciar Sesión</button>
			</div>
		</form>
		<a class="btn btn-secondary btn-block" href=<%=request.getContextPath()+"/jsp/Landing.jsp?activo=Carrito" %>>Ir a pagina pública</a>
	</div>
</body>
</html>