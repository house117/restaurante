<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<i class="fa fa-usd" aria-hidden="true"></i> Reportes - Generar 
		</h2>
		<div class="separator"></div>
		<div class=" cointainer p-3 mb-2 bg-light text-dark">
			<h1>Generar reporte</h1>
			<form action="<%=request.getContextPath()%>/jsp/GenerarReporte.jsp">
				<div class="form-group">
					<label for="fechaReporteInicio">Desde qué fecha</label> <input type="date"
						class="form-control" id="fechaReporteInicio" name="date1"
						>
				</div>
				 <input type="hidden" id="custId" name="formato" value="excel">
				<div class="form-group">
					<label for="fechaReporteInicio">Hasta qué fecha</label> <input type="date"
						class="form-control" id="fechaReporteInicio" name="date2"
						>
				</div>
				<p align="right">
					<button class="btn btn-primary agregar" type="submit">Generar Reporte (xls)
						</button>
				</p>

			</form>
		</div>
</div>
		<!-- END DEMO -->
</body>
</html>