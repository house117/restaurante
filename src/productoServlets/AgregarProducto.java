package productoServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductoDAO;
import model.ProductoModel;

/**
 * Servlet implementation class AgregarUsuario
 */
@WebServlet("/AgregarProducto")
public class AgregarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarProducto() {
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
		String nombre_producto = request.getParameter("nombre_producto");
		String descripcion_producto = request.getParameter("descripcion_producto");
		String categoria_producto = request.getParameter("categoria_producto");
		String urlimagen_producto = request.getParameter("urlimagen_producto");
		int cantidad_producto = Integer.parseInt(request.getParameter("cantidad_producto"));
		System.out.println("nombre_producto P: "+request.getParameter("nombre_producto"));
		System.out.println("descripcion_producto P: "+request.getParameter("descripcion_producto"));
		System.out.println("categoria_producto P: "+request.getParameter("categoria_producto"));
		System.out.println("urlimagen_producto P: "+request.getParameter("urlimagen_producto"));
		System.out.println("cantidad_producto P: "+request.getParameter("cantidad_producto"));
		ProductoModel producto = new ProductoModel(nombre_producto, categoria_producto, urlimagen_producto, descripcion_producto, cantidad_producto);
		int status = ProductoDAO.agregar(producto);
		if(status == 1) {
			response.sendRedirect(request.getContextPath()+"/jsp/AdminProductos.jsp?activo=Adminproductos");
		}
		
	}

}
