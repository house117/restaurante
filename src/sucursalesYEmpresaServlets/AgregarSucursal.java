package sucursalesYEmpresaServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SucursalDAO;
import models.SucursalModel;

/**
 * Servlet implementation class AgregarSucursal
 */
@WebServlet("/AgregarSucursal")
public class AgregarSucursal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AgregarSucursal() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//int id_sucursal = request.getParameter("id_sucursal");
		String nombre_sucursal = request.getParameter("nombre_sucursal");
		String direccion_sucursal = request.getParameter("direccion_sucursal");
		String telefono_sucursal = request.getParameter("telefono_sucursal");
		String correo_sucursal = request.getParameter("correo_sucursal");
		System.out.println("latitud_sucursal P: " + request.getParameter("latitud_sucursal"));
		System.out.println("longitud_sucursal P: " + request.getParameter("longitud_sucursal"));
		Double latitud_sucursal = Double.parseDouble(request.getParameter("latitud_sucursal"));
		Double longitud_sucursal = Double.parseDouble(request.getParameter("longitud_sucursal"));

		System.out.println("nombre_sucursal P: " + request.getParameter("nombre_sucursal"));
		System.out.println("direccion_sucursal P: " + request.getParameter("direccion_sucursal"));
		System.out.println("telefono_sucursal P: " + request.getParameter("telefono_sucursal"));
		System.out.println("correo_sucursal P: " + request.getParameter("correo_sucursal"));
		System.out.println("latitud_sucursal P: " + request.getParameter("latitud_sucursal"));
		System.out.println("longitud_sucursal P: " + request.getParameter("longitud_sucursal"));
		SucursalModel sucursal = new SucursalModel(nombre_sucursal, direccion_sucursal, telefono_sucursal, correo_sucursal, latitud_sucursal, longitud_sucursal);
		int status = SucursalDAO.agregar(sucursal);
		if (status == 1) {
			response.sendRedirect(request.getContextPath() + "/jsp/AdminEmpresa.jsp?activo=AdminEmpresa");
		}
	}

}
