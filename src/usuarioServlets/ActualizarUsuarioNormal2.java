package usuarioServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDAO;
import models.UsuarioModel;

/**
 * Servlet implementation class ActualizarUsuarioNormal2
 */
@WebServlet("/ActualizarUsuarioNormal2")
public class ActualizarUsuarioNormal2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarUsuarioNormal2() {
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
		int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
		String nombre_usuario = request.getParameter("nombre_usuario");
		String correo_usuario = request.getParameter("correo_usuario");
		String telefono_usuario = request.getParameter("telefono_usuario");
		String tipo_usuario = request.getParameter("tipo_usuario");
		String urlimagen_usuario = request.getParameter("urlimagen_usuario");
		String contrasena_usuario = request.getParameter("contrasena_usuario");
		System.out.println("id _usuario P: "+request.getParameter("id_usuario"));
		System.out.println("nombre _usuario P: "+request.getParameter("nombre_usuario"));
		System.out.println("correo_usuario P: "+request.getParameter("correo_usuario"));
		System.out.println("telefono_usuario P: "+request.getParameter("telefono_usuario"));
		System.out.println("tipo_usuario P: "+request.getParameter("tipo_usuario"));
		System.out.println("urlimagen_usuario P: "+request.getParameter("urlimagen_usuario"));
		UsuarioModel usuario = new UsuarioModel(id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario);
		int status = UsuarioDAO.actualizar(usuario);
		if(status == 1) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("usuarioProfPic", UsuarioDAO.getRecordById(id_usuario).getUrlimagen_usuario());
			sesion.setAttribute("normalUser", UsuarioDAO.getRecordById(id_usuario).getCorreo_usuario());
			sesion.setAttribute("usuarioNombre", UsuarioDAO.getRecordById(id_usuario).getNombre_usuario());
			if(request.getParameter("deDonde").equals("admin")) {
				response.sendRedirect(request.getContextPath()+"/jsp/AdminPerfil.jsp?updated_profile=success&activo=AdminPerfil");
			}else {
				response.sendRedirect(request.getContextPath()+"/jsp/MiPerfil.jsp?updated_profile=success");
			}
			
		}
	}

}
