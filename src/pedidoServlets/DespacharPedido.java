package pedidoServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PedidoDAO;
import dao.ProductoDAO;
import models.PedidoModel;
import models.ProductoModel;

/**
 * Servlet implementation class DespacharPedido
 */
@WebServlet("/DespacharPedido")
public class DespacharPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DespacharPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit =  request.getParameter("sub");
		System.out.println("SUB: "+submit );
		int id_pedido =  Integer.parseInt(request.getParameter("id_pedido"));
		PedidoModel pedido = PedidoDAO.getRecordById(id_pedido);
		if(submit.equals("eliminar")) {
			
			System.out.println("entro en if eliminar");
			String [] cosas = pedido.getProductosycant_pedido().split(",");
			for (int i = 0; i < cosas.length; i++) {
				
				String[] partes = cosas[i].split("\\(");
				String nombre = partes[0].trim();
				System.out.println("cosasi = "+cosas[i]);
				String requiredString = cosas[i].substring(cosas[i].indexOf("(") + 1, cosas[i].indexOf(")"));
				System.out.println("Req String = "+requiredString);
				int cantidad = Integer.parseInt(requiredString);
				ProductoModel producto = ProductoDAO.getRecordByName(nombre);
				cantidad = producto.getCantidad_producto()+cantidad;
				System.out.println("El nombre es: "+nombre+"  Y la cantidad es: "+cantidad);
				ProductoDAO.actualizarCantidad(nombre, cantidad);
			}
			int status = PedidoDAO.eliminar(id_pedido);
			if(status == 1) {
				response.sendRedirect(request.getContextPath()+"/jsp/AdminPedidos.jsp?pedido_eliminado=success&activo=AdminPedidos");
			}
		}else {
			int status = PedidoDAO.actualizarEstado("Despachado", id_pedido);
			if(status == 1) {
				response.sendRedirect(request.getContextPath()+"/jsp/AdminDetallesPedido.jsp?id_pedido="+id_pedido+"&pedido_despachado=success&activo=AdminPedidos");
			}
		}
	}

}
