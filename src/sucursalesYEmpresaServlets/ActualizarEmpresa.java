package sucursalesYEmpresaServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpresaDAO;
import models.EmpresaModel;

/**
 * Servlet implementation class ActualizarEmpresa
 */
@WebServlet("/ActualizarEmpresa")
public class ActualizarEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActualizarEmpresa() {
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

		int id_empresa = Integer.parseInt(request.getParameter("id_empresa"));
		String nombre_empresa = request.getParameter("nombre_empresa");
		String direccion1_empresa = request.getParameter("direccion1_empresa");
		String direccion2_empresa = request.getParameter("direccion2_empresa");
		String urlimagen_empresa = request.getParameter("urlimagen_empresa");
		String correo_empresa = request.getParameter("correo_empresa");
		String telefono1_empresa = request.getParameter("telefono1_empresa");
		String telefono2_empresa = request.getParameter("telefono2_empresa");
		String facebook_empresa = request.getParameter("facebook_empresa");
		String twitter_empresa = request.getParameter("twitter_empresa");
		String instagram_empresa = request.getParameter("instagram_empresa");
		String linkedin_empresa = request.getParameter("linkedin_empresa");

		EmpresaModel empresa = new EmpresaModel(id_empresa, nombre_empresa, direccion1_empresa, 
				direccion2_empresa, urlimagen_empresa, correo_empresa, telefono1_empresa, telefono2_empresa, 
				facebook_empresa, twitter_empresa, instagram_empresa, linkedin_empresa);
				
		int status = EmpresaDAO.actualizar(empresa);
		if (status == 1) {
			response.sendRedirect(request.getContextPath() + "/jsp/AdminEmpresa.jsp?activo=AdminEmpresa&empresa_actualizada=success");
		}
	}

}
