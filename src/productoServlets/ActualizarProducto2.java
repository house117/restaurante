package productoServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductoDAO;
import models.ProductoModel;

/**
 * Servlet implementation class ActualizarProducto2
 */
@WebServlet("/ActualizarProducto2")
public class ActualizarProducto2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarProducto2() {
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
		int id_producto = Integer.parseInt(request.getParameter("id_producto"));
		String nombre_producto = request.getParameter("nombre_producto");
		String descripcion_producto = request.getParameter("descripcion_producto");
		String categoria_producto = request.getParameter("categoria_producto");
		String urlimagen_producto = request.getParameter("urlimagen_producto");
		double precio_producto = Double.parseDouble(request.getParameter("precio_producto"));
		int cantidad_producto = Integer.parseInt(request.getParameter("cantidad_producto"));
		System.out.println("id_producto P: "+request.getParameter("id_producto"));
		System.out.println("nombre_producto P: "+request.getParameter("nombre_producto"));
		System.out.println("descripcion_producto P: "+request.getParameter("descripcion_producto"));
		System.out.println("categoria_producto P: "+request.getParameter("categoria_producto"));
		System.out.println("urlimagen_producto P: "+request.getParameter("urlimagen_producto"));
		System.out.println("cantidad_producto P: "+request.getParameter("cantidad_producto"));
		ProductoModel producto = new ProductoModel(id_producto, nombre_producto, categoria_producto, urlimagen_producto, descripcion_producto, precio_producto, cantidad_producto);
		int status = ProductoDAO.actualizar(producto);
		if(status == 1) {
			response.sendRedirect(request.getContextPath()+"/jsp/AdminProductosEditar.jsp?producto_seleccionado="+producto.getId_producto()+"&item_actualizado=success&activo=AdminProductos");
		}
	}

}
