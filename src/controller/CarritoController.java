package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.CarritoDeCompras;
import models.ListaProductos;
import models.ProductoModel;

/**
 * Servlet implementation class CarritoController
 */
@WebServlet("/CarritoController")
public class CarritoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarritoController() {
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
		String deDonde = request.getParameter("deDonde");
		int id_producto = Integer.parseInt(request.getParameter("id_producto"));
		String nombre_producto = request.getParameter("nombre_producto");
		String descripcion_producto = request.getParameter("descripcion_producto");
		String categoria_producto = request.getParameter("categoria_producto");
		String urlimagen_producto = request.getParameter("urlimagen_producto");
		Double precio_producto = Double.parseDouble(request.getParameter("precio_producto"));
		int cantidad_producto = Integer.parseInt(request.getParameter("cantidad_producto"));
		String submit = request.getParameter("submit");
		ProductoModel producto = new ProductoModel(id_producto, nombre_producto, categoria_producto, urlimagen_producto, descripcion_producto, precio_producto, cantidad_producto);
		System.out.println("SUBMIT: "+submit);
		CarritoDeCompras carrito;
		System.out.println("SESIONCARRITO: "+sesion.getAttribute("carrito"));
		String msg = "";
		Boolean action = false;
		if(sesion.getAttribute("carrito") == null) {
			System.out.println("carrito es Null");
			if(submit.equals("+")) {
				System.out.println("entro al icuals");
				carrito = new CarritoDeCompras();
				producto.setCantidad_producto(producto.getCantidad_producto()-1);
				carrito.getListaProductos().add(new ListaProductos(producto, 1));
				sesion.setAttribute("carrito", carrito);
				System.out.println("Se creo carrito y agrego producto");
			}
		}else {
			carrito = (CarritoDeCompras)sesion.getAttribute("carrito");
			if(submit.equals("+")) {
				
				action = !carrito.agregar(producto);
				System.out.println("Se agrego producto");
				msg = "&add";
				
			}else if(submit.equals("-")) {
				action = !carrito.remover(producto);
				System.out.println("Se removio producto");
				msg = "&rem";
			}
		}
		if(action) {
			msg+="=true";
		}else {
			msg+="false";
		}
		if(deDonde.equals("landing")) {
			response.sendRedirect(request.getContextPath()+"/jsp/Landing.jsp?activo=Inicio"+msg);
		}else {
			response.sendRedirect(request.getContextPath()+"/jsp/Shopping-cart.jsp?activo=Carrito"+msg);
		}
		
	}

}
