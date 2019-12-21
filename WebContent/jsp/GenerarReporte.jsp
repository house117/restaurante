<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.List"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="models.PedidoModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte</title>
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

</head>
<%
String startDateStr = request.getParameter("date1");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date startDate = sdf.parse(startDateStr);
String endDateStr = request.getParameter("date2");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
Date endDate = sdf.parse(endDateStr);
List<PedidoModel> listaPedidos = PedidoDAO.getBetweenTwoDates(startDate, endDate);
System.out.println("LISTA PEDIDOS SIZE: "+listaPedidos.size());
double totalpedido=0.0;
double totaliva=0.0;
String tabla = "<table border=1>";
tabla+="<tr><th>id_pedido</th>";
tabla+="<th>pedido</th>";
tabla+="<th>total (sin IVA)</th>";
tabla+="<th>iva</th></tr>";
for(int i =0; i<listaPedidos.size(); i++){
	System.out.println("NASODIASDFLKASJDFLASAAAAAAAAAAAAAA");
	tabla+="<tr>";
	tabla+="<td>"+listaPedidos.get(i).getId_pedido()+"</td>";
	tabla+="<td>"+listaPedidos.get(i).getProductosycant_pedido()+"</td>";
	tabla+="<td>"+listaPedidos.get(i).getTotal_pedido()+"</td>";
	tabla+="<td>"+String.format("%.2f", listaPedidos.get(i).getIva_pedido())+"</td>";
	tabla+="</tr>";
	totalpedido+=listaPedidos.get(i).getTotal_pedido();
	totaliva= listaPedidos.get(i).getTotal_pedido();
	
}
tabla+="<tr>";
tabla+="<td>"+" "+"</td>";
tabla+="<td>"+"TOTALES"+"</td>";
tabla+="<td>"+totalpedido+"</td>";
tabla+="<td>"+totaliva+"</td>";
tabla+="</tr>";
tabla+="</tabla>";
String formato = request.getParameter("formato");
if((formato != null) && (formato.equals("excel"))){
response.setContentType("application/vnd.ms-excel");
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  
System.out.println();  
response.setHeader("Content-disposition", "attachment; filename=Reporte"+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())+".xls");
}
%>
<body>
<h2>Reporte de pedidos</h2>
<%=tabla %>

</body>
</html>