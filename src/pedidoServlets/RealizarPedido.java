package pedidoServlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.PedidoDAO;
import dao.ProductoDAO;
import models.CarritoDeCompras;
import models.PedidoModel;

/**
 * Servlet implementation class RealizarPedido
 */
@WebServlet("/RealizarPedido")
public class RealizarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealizarPedido() {
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
		HttpSession sesion = request.getSession();
		String detalles_pedido = request.getParameter("detalles_pedido");
		String dir1_pedido = request.getParameter("dir1_pedido");
		String dir2_pedido = request.getParameter("dir2_pedido");
		String zipcode_pedido = request.getParameter("zipcode_pedido");
		String productosycant_pedido = "";
		Date date = new Date();
		Timestamp fecha_pedido = new Timestamp(date.getTime());
		String usuario_pedido = (String)sesion.getAttribute("usuarioNombre");
		String estado_pedido = "NO despachado";
		
		CarritoDeCompras carrito;
		carrito = (CarritoDeCompras)sesion.getAttribute("carrito");
		double total_pedido = carrito.getCostoEnvio()+carrito.getTotal();
		double iva_pedido = carrito.getIva();
		for (int i = 0; i < carrito.getListaProductos().size(); i++) {
			if(i<(carrito.getListaProductos().size()-1)) {
				productosycant_pedido+=carrito.getListaProductos().get(i).getProducto().getNombre_producto()+" ("+carrito.getListaProductos().get(i).getCantidad()+"),";
				System.out.println(carrito.getListaProductos().get(i).getProducto().getNombre_producto()+" ("+carrito.getListaProductos().get(i).getCantidad()+"),");
				ProductoDAO.actualizar(carrito.getListaProductos().get(i).getProducto());
			}else {
				productosycant_pedido+=carrito.getListaProductos().get(i).getProducto().getNombre_producto()+" ("+carrito.getListaProductos().get(i).getCantidad()+")";
				System.out.println(carrito.getListaProductos().get(i).getProducto().getNombre_producto()+" ("+carrito.getListaProductos().get(i).getCantidad()+")");
				ProductoDAO.actualizar(carrito.getListaProductos().get(i).getProducto());
			}			
			
		}
		PedidoModel pedido = new PedidoModel(productosycant_pedido, detalles_pedido, fecha_pedido, usuario_pedido, estado_pedido, dir1_pedido, dir2_pedido, zipcode_pedido, total_pedido, iva_pedido);
		int status = PedidoDAO.agregar(pedido);
		if(status == 1) {
			sesion.setAttribute("carrito", null); 
			response.sendRedirect(request.getContextPath()+"/jsp/Landing.jsp?activo=Inicio&pedidoHecho=true");
		}
		
		/*
		 pedido.setId_pedido(rs.getInt("id_pedido"));
				pedido.setProductosycant_pedido(rs.getString("productosycant_pedido"));
				pedido.setDetalles_pedido(rs.getString("nombre_empresa"));
				pedido.setFecha_pedido(rs.getTimestamp("detalles_pedido"));
				pedido.setUsuario_pedido(rs.getString("usuario_pedido"));
				pedido.setEstado_pedido(rs.getString("estado_pedido"));
				pedido.setDir1_pedido(rs.getString("dir1_pedido"));
				pedido.setDir2_pedido(rs.getString("dir2_pedido"));
				pedido.setZipcode_pedido(rs.getString("zipcode_pedido"));
		 */
		
	}

}
